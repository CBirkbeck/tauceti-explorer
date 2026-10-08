# BP-ArithmeticGaloisRepresentations~3

Agent: Codex, session `codex-tiSCll`; issue #7488, 8 October 2026.

This is a complete budgeted revision pass. The packet is `complete` at 300 nodes; **G7 and R01.1–R01.6 are all `partial`**. No stage is closed and no implementation is claimed. All 300 input node IDs, the historical independent-review object, and the source-finding verdicts are retained. The next independent review must replace that historical verdict.

## Revision result

| Item | Count |
|---|---:|
| Definitions / constructions | 30 / 28 |
| Lemmas / theorems / comparisons / applications | 84 / 145 / 9 / 4 |
| Total nodes | 300 |
| API items / unit tests / planets | 540 / 287 / 40 |
| Pinned baseline declarations / sources | 420 / 53 |
| Gaps / supplier requests | 37 / 61 |
| Source findings / restructuring entries / upstream notes | 47 / 8 / 6 |

The two blockers of [REV-ArithmeticGaloisRepresentations~2](../reviews/REV-ArithmeticGaloisRepresentations~2.md) are addressed as follows.

**Canonical nilpotent filtration.** Accepted RS-17 O20 assigns its construction, uniqueness, scalar invariance, primitive decomposition and tensor/dual theory to LPV.1. The retained ID `R01.2/monodromy-filtration` is now a lemma proving Weil–Deligne stability from the supplied kernel/image formula, with its direct WD prerequisite. Its 10 generic API items and five generic tests are removed from Arithmetic. The rank-square identity remains an application inside the pure-graded proof. The special-WD-block graded-dimension test remains with purity; it tests the imported filtration on an Arithmetic object. The suggested file identifies the LPV data stub explicitly as an external export rather than an Arithmetic target.

The exact LPV request and gap now name purity, pure-graded purity and Frobenius-semisimple classification as consumers. They require a pure linear-algebra export independent of the geometric finite-monodromy logarithm, a bridge between the primitive indexing conventions, and the characteristic-zero SL₂ weight/complete-reducibility supplier from LieHighestWeight, Part II. The current LPV packet imports Arithmetic through its logarithm; adding a reverse stage edge would create a cycle. No foreign packet or atlas edge was edited. The orchestrator must apply the supplier separation before resolving this request.

**Typed counterpart parity.** The previous review's Appendix B lists 92 API entries and 51 tests over 30 nodes. Each now has a typed declaration, or a labeled typed `example`, under the exact packet name. A comment-stripped namespace/declaration scan checked all 143 names and found no remaining omission. Across the whole packet, all 540 API names are declarations or four generated structure projections, and all 287 test names have labeled typed examples. This is correspondence evidence, not proof certification or a fresh semantic audit of every inherited test. In particular the inherited nonfree-trace test still distinguishes its general typed half from its concrete ideal example.

The additions use actual representations and coefficient maps; finite Galois/valuation ramification data; roots-of-unity inverse limits; coinduced and tensor-induced actions; Hopf-algebra points and matrix Zariski closure; and the actual geometric abelian-variety carrier. Local constants include a dimension-zero induction ratio and explicit Haar/additive-character normalizations, rather than unrestricted induction equality. Residual coefficient twists include the residue-square, inertia, Frobenius-lift and semisimplification comparisons. Tensor induction includes cycle trace/characteristic-polynomial formulas and actual transitivity/base-change maps. Restriction of scalars uses split coefficient components, distinct from group induction.

The geometric section constructs geometric points as sections of the base-changed scheme, torsion as its killed subgroup and the Tate module as the compatible inverse limit. Its requested dual, polarization and finite pairing are supplier data on this carrier. Tate maps, pairing projections, Rosati adjunction, rational pairings, local Euler factors on the dual Tate module, endomorphism coefficients, λ components and their residual action are typed. Integral pairing perfectness excludes primes dividing the polarization degree; rational perfectness does not. The good-reduction example uses the actual curve y²=x³−x over Q₅ and distinguishes 1+2X+5X² from the covariant geometric-Frobenius polynomial. Its coefficient-prime, inertia and Frobenius assumptions are explicitly included in the example signatures. The global conductor example uses raw torsion of the actual curve y²+y=x³−x²−10x−20: its prime-to-5 conductor is the unit ideal and its prime-to-3 conductor is (11). This curve is distinct from the raw-versus-semisimplified example y²+y=x³−x².

The reader is synchronized with every changed node, the requests, gaps and coverage worklists. Source matches and finding descriptions use our own words; inherited quoted passages were removed. The historical review remains unchanged.

## Appendix B correspondence index

The following counts exhaust the previous review's omissions. Locations are line numbers in [the suggested file](../suggested/ArithmeticGaloisRepresentations.lean); API and test locations may lie in separate blocks. All are typed counterparts; geometry locations require the full pinned build.

| Node suffix | API | Tests | Typed locations |
|---|---:|---:|---|
| `R01.1/reduction-and-residual-semisimplification` | 2 | 0 | 11217, 11243 |
| `R01.1/coefficient-frobenius-twist` | 1 | 1 | 11273, 11286, 11312 |
| `R01.2/decomposition-group-at-a-place` | 1 | 0 | 11426 |
| `R01.2/local-restriction` | 3 | 0 | 11162, 11177, 11346 |
| `R01.2/unramified-and-ramification-set` | 0 | 1 | 11195 |
| `R01.2/ell-adic-tame-character` | 2 | 1 | 11373, 11394, 12616 |
| `R01.2/tame-inertia-and-fundamental-characters` | 2 | 2 | 11406, 11440, 11456, 11469 |
| `R01.2/grothendieck-monodromy-and-the-weil-deligne-functor` | 2 | 2 | 11501, 11521, 11589, 11602 |
| `R01.2/frobenius-semisimplification` | 1 | 1 | 11557, 11571 |
| `R01.2/local-epsilon-factor` | 5 | 1 | 12480, 12492, 12513, 12528, 12550, 12597 |
| `R01.3/breaks-and-swan-conductor` | 3 | 2 | 11633, 11677, 11697, 12700, 12716 |
| `R01.3/artin-conductor-with-its-wild-part` | 2 | 2 | 11654, 11729, 12328, 12340 |
| `R01.3/conductor-of-a-weil-deligne-representation` | 0 | 1 | 12354 |
| `R01.3/global-conductor-and-prime-to-p-conductor` | 0 | 1 | 13645 |
| `R01.6/tate-module-of-an-abelian-variety` | 14 | 5 | 12768, 12777, 12790, 12796, 12799, 12808, 12812, 12823, 12827, 12838, 12844, 12852, 12863, 12866, 12871, 12876, 12880, 12899, 12912 |
| `R01.6/weil-pairing-on-tate-modules` | 12 | 5 | 12948, 12951, 12956, 12960, 12965, 12971, 12979, 12982, 12993, 13007, 13013, 13021, 13026, 13032, 13078, 13559, 13566 |
| `R01.6/local-euler-factor-of-an-abelian-variety` | 8 | 5 | 13064, 13094, 13110, 13117, 13126, 13130, 13134, 13139, 13147, 13152, 13196, 13718, 13724 |
| `R01.6/tate-module-with-endomorphism-coefficients` | 11 | 4 | 13365, 13409, 13420, 13449, 13465, 13473, 13500, 13505, 13528, 13580, 13586, 13654, 13663, 13675, 13683 |
| `R01.6/galois-generic-abelian-varieties` | 8 | 4 | 13251, 13254, 13267, 13270, 13274, 13282, 13306, 13314, 13321, 13327, 13333, 13342 |
| `G7/symmetric-and-exterior-powers` | 0 | 1 | 11758 |
| `G7/tensor-induction` | 5 | 2 | 11772, 11789, 11814, 11831, 11855, 11867, 11876 |
| `G7/restriction-of-scalars` | 1 | 2 | 11913, 11935, 11945 |
| `G7/operations-on-polarized-representations` | 1 | 0 | 11969 |
| `G7/clozel-harris-taylor-group` | 1 | 1 | 12123, 12158 |
| `G7/gsp4-and-symplectic-induction` | 1 | 1 | 12293, 12311 |
| `G7/strong-irreducibility` | 2 | 2 | 12017, 12026, 12034, 12043 |
| `G7/zariski-closure-and-monodromy-groups` | 2 | 1 | 12001, 12052, 12084 |
| `G7/enormous-image-and-its-coefficient-extension-invariance` | 0 | 1 | 12220 |
| `G7/characteristic-zero-enormous-subgroups` | 2 | 0 | 12196, 12206 |
| `G7/vast-tidy-and-enormous-gsp4-subgroups` | 0 | 2 | 12273, 12279 |

## Validation and Lean limit

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticGaloisRepresentations.json`: zero errors and zero warnings.
- `source_issues.check_issues` and `check_errata.versions_checked` on the packet: zero errors, including the new CHT author-copy record.
- Additional checks: retained identifiers and order; unchanged historical review and source-finding verdicts; every definition/construction has API, uses and at least three tests; all implementation statuses unchecked; own-node DAG; exact reader statement/hypothesis/proof/API/test/source/request/gap/coverage correspondence; Appendix B typed-name correspondence.
- `git diff --check`: passed. Only this issue's four deliverables are changed.

**The full suggested file was not compiled at both pins.** The available shared build has the pinned Mathlib but a different Tau Ceti revision and no compiled abelian-variety imports. A source checkout of pinned Tau Ceti exists, but its existing build uses a different Mathlib and toolchain. Under WORKERS.md no library build, cache fetch, substitute carrier or new Lake project was made. The geometric block is therefore unelaborated and must be checked by the next reviewer with a genuine build containing both pins.

The Mathlib-only prefix completed with **938 admitted-proof warnings, zero errors and zero other warnings**, including individual declaration checks for every nongeometric API in Appendix B. To reproduce that limited check: extract the suggested file before its `Revision 3: geometric Tate-module interface` marker into scratch; remove its four Tau Ceti import lines; append declaration checks for the nongeometric Appendix B API names; run `lean-check` on that scratch file. This intentionally excludes every geometric declaration and proves none of the examples. The actual geometric imports are Hom.BaseChange, Product, End.Basic and Isogeny at Tau Ceti f790474. Their source statements, including the actual morphism carrier, base change, products, endomorphism algebra and isogeny predicate, were read at that pin. Available memory exceeded 20 GB; each check was serial and finished within twenty minutes. Nothing is left running.

## Sources read and sources still missing

The seven scoped reviewed library audits and the upstream EllipticCurves and RepresentationTheory/InductionRestriction documents were read, together with the accepted monodromy ownership decision and its LPV supplier statements. This revision retains the 420-entry reviewed baseline register; it does not claim a new independent read of all 420 statements or all 53 source works.

Passages read for the new interfaces include Deligne, *Les constantes des équations fonctionnelles des fonctions L*, §3.4 printed p. 528, §3.12 p. 533, Theorem 4.1 pp. 535–536, §§5.5.3, 5.6.1 and 5.7.1 printed p. 549 (page image), and §8.12 p. 572; Milne, *Abelian Varieties*, polarization §11 p. 53 and §13 pp. 57–58, Lemma 13.1 and Proposition 13.2; Newton–Thorne 2023 Definition 2.23 and Lemmas 2.25/2.28, p. 23; and CHT §2.1 pp. 9–10. The CHT χ-polarized induction construction follows Lemma 2.1.2; it is not attributed an invented numbered induction lemma. Its obtained author copy, URL, access date and SHA-256 are recorded in `sourceVersions`. Existing edition-specific primary citations and the independent source-finding verdicts remain intact.

Public retrieval was used only in scratch. Retrieval alone is not a claim to have read a work. Several original URLs could not be retrieved in this run, including Brumer–Kramer, Liu, Conrad–Taylor, the GHTT appendix and the older Serre conductor works; the original CHT URL was replaced for reading by its recorded author copy. Existing original-source/proof gaps remain open. Saito/Ogg, Larsen, Serre/Larsen–Pink independence, Carayol, Nekovář/Boston–Lenstra–Ribet, Gan–Takeda and the modular-cohomology/classification inputs are not certified here. No restricted book was copied or used to close a gap, and the handoff has no dependency on deleted scratch materials.

## Exact follow-up work

The authoritative complete worklists are the packet's seven `coverage.remaining` arrays, 37 gaps and 61 requests, all rendered in the reader. Follow-up proceeds at those consumers rather than reconstructing this run's scratch.

| Stage | Nodes | Status | Remaining entries | Next work |
|---|---:|---|---:|---|
| R01.1 | 59 | partial | 17 | Split carrier/operation, lattice, semisimplification and reductive-model bundles. Obtain Larsen's building input and general reductive pseudocharacter reconstruction; preserve the direct GLₙ proof. Instantiate residual coefficient automorphisms using the local-field suppliers. |
| R01.2 | 27 | partial | 31 | Coordinate the acyclic LPV export; finish local, WD, purity and ε-factor declaration splits. Instantiate the real local Weil and tame-character interfaces and establish classification and the global input to local constants. |
| R01.3 | 62 | partial | 28 | Split conductor operations/induction. Supply arbitrary-perfect-residue-field ramification, potential-good inertia, the dyadic p-group estimate and Ogg–Saito arithmetic-surface inputs. Keep raw residual torsion separate from its global semisimplification. |
| R01.4 | 31 | partial | 19 | Complete Dickson, exceptional and dyadic proof lemmas, automorphism and Dickinson inputs, and precise cyclotomic restriction hypotheses. |
| R01.5 | 53 | partial | 14 | Complete recognition/descent and curve/gluing splits; replace stage requests with exact exports; establish minuscule semisimplicity and analytic Haar-null inputs. Keep the direct symplectic lifting lemma and unit-group baseline import. |
| R01.6 | 18 | partial | 27 | Elaborate the actual geometric interfaces at both pins, reconcile supplier exports, and split torsion/Tate/pairing/isogeny/local-factor bundles. Resolve downstream A6 characteristic-polynomial and coefficient-freeness ownership before importing; locate scheme Frobenius and independence/connectedness proof inputs. |
| G7 | 50 | partial | 66 | Split operation/polarization/monodromy/image bundles; establish algebraic-group, modular-cohomology and finite-enumeration inputs. Keep adequate, enormous, vast and tidy distinct; apply the proposed split isolating Hodge-theoretic consumers. |

`RT-AREA-langlands-1/6` remains handled by R01.3's wild conductor and Ogg–Saito comparison, importing the algorithm, actual Tate module, minimal regular model and component comparison. Its I₀* count is five on the proper regular special fibre. The dyadic and primary-proof gaps are retained; no stage closure is asserted.

`RT-AREA-langlands-1/17` remains handled by R01.1's classical Brauer–Nesbitt/image-algebra proof, with characteristic-polynomial rather than unrestricted trace recognition and perfect-field descent. IHG determinant reconstruction imports that theorem; no reverse dependency was introduced.

The next independent review should inspect the narrowed ownership application, every new typed counterpart against the corresponding packet statement, and the geometric elaboration limit. It should then replace the historical review object. Source/proof and granularity work outside this revision remains exactly in the worklists above.
