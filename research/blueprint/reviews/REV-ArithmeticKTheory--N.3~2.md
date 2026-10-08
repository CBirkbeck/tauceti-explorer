# Independent revision review: ArithmeticKTheory N.3

**Accepted.** Job `REV-ArithmeticKTheory--N.3~2`, issue #6987; Codex session `codex-oBsZls`, GPT-6, 8 October 2026. This session did none of the original or revision authoring. The review covers the packet, reader and suggested file, the earlier independent review and the revision handoff. It accepts a target-level plan with recorded gaps, not implemented mathematics.

| Item | Result |
| --- | --- |
| Retained nodes | 7: 5 theorems, 1 construction, 1 promoted lemma |
| Per-node verdicts | 6 verified, 1 corrected; none unverifiable |
| Reused parent endpoints | 6, retaining their owning IDs |
| Construction API and tests | 8 API entries, 5 discriminating tests |
| Planets | 2 |
| Pinned baseline declarations | 19 confirmed; none removed or replaced |
| Scope and completion | 1 stage planned, 0 closed; packet complete |
| Open local boundaries | 1 ownership gap, 0 direct requests |
| Nodes added or removed | 0 |
| Source findings | 2 independently reconfirmed, 0 added |

## Previous review and the revised prototypes

The previous report returned the mathematically sound plan for PROTOCOL §13: the seven arithmetic declarations and their API/tests were a commented register. Revision 2 resolves that blocker. Every target and API statement is a Lean declaration, and each test is an elaborated anonymous example identified by its packet test name.

I inspected the entire suggested file. Its supplier model has finite idempotent matrices with modules given by their actual images; Q morphisms are split-epi/split-mono spans modulo middle-module isomorphism. Composition uses the genuine module pullback and its projective presentation. These match Weibel IV.6.1–6.4, pp.318–321, and the owning LowDegrees Z.1/K.1 plans. Category laws, existence and comparison proofs are placeholders; that limitation is explicit.

The native nerve is realized by `SSet.toTop`; the basepoint is its zero-object vertex. Positive K-groups are actual cube homotopy quotients, not arbitrary abelian groups supplied as parameters. `Supplier.K R d` represents mathematical K_(d+1), using π_(d+2), so the commutative-group instance applies. The defect/equivalence parameter d represents degree d+2. The degree-one example therefore uses index 0, the even example index 1 and the degree-five examples index 4. No K₀ carrier is faked to obtain a commutativity instance.

Rank is dimension after tensoring with the fraction field; the Q filtration is the full rank-bounded subcategory. Integral homology and its two filtration maps use the native simplicial homology functor with integral coefficients. H.1 still owns comparison with singular homology. Matrix scalar extension, tensoring module maps and postcomposition on actual based cubes fix the forward K-map. Transfer presents the underlying restricted module and transports its zero basepoint along a path. These are supplier prototypes with meaningful carriers and maps; they are not proofs of their owner theorems. The pinned Tau Ceti induced-map source was checked, but its compiled module is absent from the shared build; the Mathlib-only helper uses the same quotient-postcomposition action.

The exact upstairs-prime condition is an explicit equality under ideal contraction. Arithmetic ring maps restrict the given field embedding. The extension/transfer statement uses actual maps and finite-projective instances, rather than a field representing the desired commutative square. No Lean edit was needed in this review.

## Sources and seven node checks

I downloaded the three public files at the packet URLs on 8 October 2026 and recomputed their SHA-256 hashes; all match the packet. I read the following passages, with conclusions stated here in my own words. Earlier broader reading records remain the authors' provenance and are not claimed as a new full rereading.

- [Quillen's finite-generation lecture text](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf): §1, source pp.179–185, including Theorems 1 and 3, Remark (2), the Stability corollary and the arithmetic proof. One-based scan page is source page plus eight. I also inspected source p.182 as a rendered page.
- [Weibel's combined K-book draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), 29 August 2013: IV.1.12–1.18, pp.269–271; IV.6.1–6.4, pp.318–321; IV.6.8–6.9, p.325; IV.7.1–7.2, pp.328–329; V.6.1, p.406; V.6.6–6.6.4, pp.409–410. One-based PDF page is book page plus eight.
- [Kahn, arXiv:1108.2441v3](https://arxiv.org/pdf/1108.2441v3), 2 July 2014: §§4.1–4.3.4, pp.15–18, including rendered pp.16 and 18 for the two findings.

The prefix of the following node IDs is `ArithmeticKTheory:N.3/`.

| Node | Independent check |
| --- | --- |
| `finite-rank-Q-homology` | Quillen pp.184–185 and Weibel IV.6.8–6.9 give the finite-Pic/integral-Steinberg criterion. Read the accepted sibling's generic homology theorem, the parent lattice identification and Borel's early integral finiteness node. Nonfree projectives, rank one, orientation and finite-quotient descent remain in the contracts. Finite generation follows by extensions over ℤ, not by rational dimension. |
| `rank-filtration-homology-stability` | Rendered Quillen p.182 gives surjectivity for m≥i and injectivity for m≥i+1. Exhaustion and the precise H.1 filtered-colimit comparison give the same stable bounds. The relative negative-degree convention is preserved; no extra stable-GL bound is asserted. |
| `stable-Q-homology-finite-type` | Stabilization at rank i+1 identifies the specified stable homology with a finitely generated stage. An arbitrary filtered colimit of finitely generated groups would not suffice. This theorem stops before the recorded H-space-to-homotopy gap. |
| `finite-S-localisation-defect` | Quillen Remark (2), pp.179–180, and Weibel V.6.1/V.6.6 give the finite-S localization sequence. For n≥2 both adjacent finite-field groups are finite; for even n the left residue group vanishes, giving injection. The same argument over O_(F,S) applies to finite S⊆T. Degree one and infinitely many inverted primes cannot inherit finite cokernel. |
| `canonical-rational-S-integer-equivalence` | Flat rationalization kills the finite defects of the specified inclusion; native `ofBijective` retains that map. Corrected proof attribution for the toField identity and stale supplier-status/test-boundary notes. No rank theorem is needed for the constructor. |
| `canonical-rational-equivalence-map` | The forward map of `ofBijective` is its input. Its promotion is justified by the extension/transfer consumer; it is not a new independent comparison theorem. |
| `rational-localisation-extension-transfer` | Read N.1's finite-projective/base-change contract and K.1/K.2/K.3's exact-functor contracts. Tensor associativity and localization/restriction natural isomorphisms give the two actual squares. Weibel IV.6.3.2, p.320, supplies projective transfer; V.6.6.3–6.6.4, p.410, supplies compatibility. Exact prime contraction allows ramification, including the stated Q(i)/Q example. |

E25 is confirmed: Kahn Proposition 4.2.4, p.16, puts the ambient sheaf's generic fibre on the left where the pure subsheaf's fibre is needed. Taking the ambient sheaf to be O_X and the pure subsheaf to be zero disproves the printed equality; the immediately preceding calculation gives the intended correction. E26 is confirmed at §4.3.4, p.18: an extra letter in the fibration term is a harmless spelling slip. Both remain scoped to v3 and affect no result. I reopened the arXiv history and repeated correction searches; no correction was located. No new source mistake was found in the passages read. The existing parent E15 is not duplicated.

## Pinned baseline and audit

I read every listed declaration's actual source statement at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including neighboring rules needed by the maps. All nineteen citations are valid with their stated boundaries.

| Declarations checked | What the check establishes |
| --- | --- |
| `Set.integer`, `IsDedekindDomain.HeightOneSpectrum` | Native S-integer subalgebra and nonzero finite primes. |
| `NumberField.InfinitePlace.nrRealPlaces`, `nrComplexPlaces` | Correct real/complex-place counts, with one complex place per conjugate pair. |
| `NumberField.RingOfIntegers.instFintypeClassGroup`, `ClassGroup.equivPic` | Finite Picard group after transport; not a projective-classification theorem. |
| `NumberField.Units.finrank_eq` | Actual Dirichlet rank for empty S, rather than only a rank definition. |
| `Submodule.fg_of_fg_map_of_fg_inf_ker` | Finite-generation extension from image and kernel; ℤ noetherianity handles subgroups. |
| `Module.Flat.lTensor_exact`, `IsLocalization.flat` | Exact rationalization at the flat localization ℚ/ℤ. |
| `TensorProduct.AlgebraTensorModule.lTensor` | ℚ-linear first-factor rationalization agreeing after scalar restriction with the ℤ-linear tensor map. |
| `LinearEquiv.ofBijective` | Native equivalence with the prescribed forward map and inverse rules. |
| Tau Ceti `Set.unit_fg_of_units`, `IsDedekindDomain.finite_integer_classGroup` | Classical unit/class-group finiteness; no higher-K or K₁-identification conclusion. |
| `CategoryTheory.nerve`, `SSet.toTop` | Existing nerve and geometric realization with the adjunction used for the zero vertex. |
| `HomotopyGroup`, `SSet.homologyFunctor` | Actual cubical homotopy quotients and integral simplicial homology with induced maps. |
| Tau Ceti `HomotopyGroup.mapHom` | Based positive-dimensional induced homomorphism by postcomposition, with identity/composition laws. |

The reviewed library audit's N.1–N.3 records agree: classical units and class groups do not implement the higher-K construction, Quillen finite generation or nonempty-S rank passage. None of the seven nodes duplicates an audited implemented declaration. I read the AlgebraicTopology and GrothendieckEulerForms upstream roadmaps and the relevant accepted RS-18/RS-33 ownership records; their infrastructure is consumed rather than replanned.

## Dependencies, API, planets and closure

Every direct packet-node prerequisite resolves to an existing owning node and its statement was read, as were the six reused parent endpoints. Following prerequisite edges through currently available packet nodes reaches 403 nodes with no directed cycle. This automated check treats library references and unresolved stage-level inputs as leaves; it is not independent mathematical certification of all 403 nodes.

The accepted finite-generation sibling owns the generic filtration proofs. The present first two IDs remain arithmetic/reexport interfaces; assembly must share their proofs. The rational construction and its finite S⊆T refinement are distinct consumer API. Imports use early Borel integral Steinberg finiteness and the order rank theorem, avoiding Borel's downstream arithmetic consumers. Nonempty S-integer rings are not orders; localization supplies their higher ranks. Rank one uses U.4's separate determinant/SK₁ and S-unit theorem.

All eight API entries preserve the specified map, cover evaluation and both inverse identities, uniqueness, empty-S transport, enlargement and field compatibility. The five tests distinguish empty-S transport, a nonzero degree-five map square, the degree-one obstruction, multiplication by two on a nonzero rational space and rational even-degree vanishing with a separate integral torsion computation. They type-check with placeholder proofs; they are future mathematical acceptance tests, not completed executable calculations. The two planets, **Finite-type arithmetic Q-space** and **Rational S-integer comparison**, identify the central theorem package and construction.

The stage targets are covered by the seven nodes and six retained parent endpoints. A complete target-level pass and a planned stage are justified. Closure is not: the connected CW-type H-space simplicity/finite-type theorem still has no assigned early supplying node. It must permit nonzero π₁. RS-33 H.3 owns plus constructions and H.6 owns spectra/completion, so neither existing stage is an honest direct request for this theorem. The Part II proposal and parent-edge reconciliation remain an explicit ownership gap. H.1, general K and the integral K₂ test retain their own supplier proof/review boundaries. No implementation status was advanced.

## Corrections and maintainer follow-up

Changes made in place:

1. Replaced the historical active review with this accepted per-node review; preserved the earlier review object in `reviewHistory` and its original report.
2. Corrected four dependency snapshots: Borel R.1, finite-field L.1 and LowDegrees U.4 now have accepted owner reviews; the K₂ integer test now depends on T.3's specific `G-monomial-kernel` ownership gap rather than the obsolete unread-Milnor description.
3. Corrected the construction proof/source attribution: functoriality proves the toField map equality. All-prime localization separately proves rational bijectivity, using torsion rather than finite infinite residue sums.
4. Added this review's precise reading provenance, renewed E25/E26 verdicts under this job ID and expressed the spelling finding in our own words.
5. Reconciled the reader's status, supplier boundaries, test dependency and field-map explanation with the corrected packet.

No baseline citation, node ID, node count, API entry, test, planet, stage status or Lean signature changed. No files outside the authorized deliverables and this job's handoff were edited.

The maintainer/assembly must assign the early H-space finite-type extension and reconcile the parent's obsolete H.6 edge, consolidate the sibling proof interfaces, and replace the concrete supplier prototypes with implemented owner imports. The integral K₂ test awaits its supplier's monomial-kernel contract. These are recorded next actions, not reasons to reject the sound plan or to claim stage closure.

Validation: `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheory--N.3.json` reports **0 errors, 0 warnings**. The shared source-issue/version validators report no errors. `lean-check research/blueprint/suggested/ArithmeticKTheory--N.3.lean` exits **0** at the pinned Mathlib, with **46 declaration-uses-sorry warnings** and no other warnings. Available memory exceeded 20 GB. The suggested file is unchanged after this successful run; no repeat compilation was needed. No language server, package update, library build or promotion was run.
