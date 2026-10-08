# Independent revision review: complex multiplication and explicit reciprocity

Job `REV-ComplexMultiplicationAndExplicitReciprocity~2`, issue #7059. Reviewer: Codex, session `codex-0QELdx`, 8 October 2026. This session wrote neither the original blueprint (`codex-gkcxOO`) nor its revision (`codex-gwrRMa`). The original independent review and the revision handoff were read in full.

**Verdict: accepted.** Every node has a justified `verified` or `corrected` verdict in the packet. All 19 baseline citations were independently confirmed at the exact pins. The revision repairs the previous rejection grounds; the additional clear defects found here have been corrected in the packet, suggested file and reader. The five recorded gaps remain open, and acceptance does not establish their supplier contracts or constitute an implementation.

| Item | Result |
| --- | --- |
| Nodes | 69: 8 definitions, 12 constructions, 25 theorems, 4 applications, 10 comparisons, 10 lemmas |
| Per-node verdicts | 54 verified, 15 corrected; none added, removed or unverifiable |
| APIs | 75, including 10 promoted API nodes |
| Tests | 61; each of the 20 definitions/constructions has at least three |
| Planets | 29; unchanged |
| Baseline | 19 exact-pin statements confirmed; no citations removed, replaced or added |
| Source references | 95 node references in 20 public source documents |
| Source versions | The 20 PDF hashes and the separately recorded Yuan–Zhang author-erratum hash match |
| Dependencies | 105 baseline, 153 internal-node, 131 supplier-stage and 18 external-node references |
| Requests and gaps | 37 requests; 5 explicit gaps retained |
| Stage coverage | CM.0–CM.5 planned; CM.6 a source-decomposed process layer; no stage closed |
| Source findings | All four independently confirmed at their recorded versions |

## Corrections made in this review

The following table accounts for all 15 corrected node verdicts. The packet's full per-node ledger also records the 54 verified nodes.

| Node suffix | Correction and evidence |
| --- | --- |
| `reflex-type` | Milne's Example 1.28 is on printed p.18; Example 1.19 remains p.14. The inverse-coset and double-reflex statements remain field-scoped. |
| `ideal-lattice-curve` | MIT16's proper-ideal correspondence, Definition 16.9 and Theorem 16.12 on pp.6–7, belongs to §16.4. The source metadata and reader locator now agree. |
| `quadratic-forms-dictionary` | The same MIT16 section correction applies to the proper-class/form dictionary. |
| `polarization-reciprocity-dictionary` | The integral lattice is a Zhat-submodule of the finite adelic Tate space. An Af-submodule would discard the integral lattice information. Scalar multiplication by the idele is now restricted to Zhat before mapping the submodule. Milne Remark 9.11(c) is on p.78; Theorem 9.17 is on pp.80–81. Both polarization multipliers and the transported parameter remain explicit conclusions. |
| `relative-moduli-orbit` | The suggested signature now concludes Artin surjectivity, its exact kernel, the canonical marked-orbit bijection and the relative field degree. It previously assumed surjectivity/kernel and concluded only the degree. The absolute unmarked-moduli adapter remains a gap. |
| `dimension-two-example` | For the product of two Gaussian elliptic curves, full 3-torsion has rank four over Z/3. The suggested carrier is now two copies of `(Z/3)^2`, with multiplication by −1+2i represented by `[[2,1],[2,2]]` on each copy in the `(1,i)` basis. The End0 matrix algebra, squared Frobenius polynomial, degree 25 and Weil multiplier 2 remain present. |
| `class-polynomial` | The root API now includes separability under injectivity of the actual proper-class j function. It retains the root characterization. |
| `integrality` | The signature now concludes integrality of every singular value and descent of the class product to a monic polynomial in Z[X], with separability and class-number degree. Integrality of a complex coefficient alone did not express rationality and integer descent. MIT20 Theorem 20.12 and MIT21 Corollary 21.2 supply the stated route, subject to the independent modular-polynomial input request. |
| `class-polynomial-galois-action` | Inverse-class Artin action, conjugation inversion and trivial individual-root stabilizers are now conclusions, together with polynomial invariance. The actual Artin extensions and CM identification remain explicit omitted supplier conditions. |
| `ring-class-generator` | Restored all-root adjunction, class-number degree, irreducibility over the quadratic field and splitting over the actual ring class field, alongside `K(j)=H`. See MIT21 Corollary 21.2 and Definition 21.3, p.4. |
| `ray-class-values` | Restored general containment in the ray field, the exact Artin quotient and the finite-family joint-stabilizer criterion. Full ray-field equality is a separate maximal quadratic specialization. This follows the scope distinction in Streng Theorem 2.5, Definition 2.7 and §4.5, rather than asserting equality for every higher-dimensional type. |
| `complete-elliptic-example` | The Gaussian fixture now also concludes the unit count 4, degree-five ideal isogeny, trivial action on the singular j root and `K(j)=K`. Its full level-3 value field still has degree two. The isogeny uses an actual scheme morphism with its degree supplier explicitly identified. |
| `cm-hecke-character` | The conductor API now asserts the principal infinity-type law at the least conductor, as well as divisibility of every admissible modulus. Minimality alone did not assert admissibility. |
| `class-polynomial-height-bound` | Added the analytic part of the existing target: for the actual reduced CM arguments, `|j(tau)| ≤ exp(pi*sqrt(|D|)/a)+2114567/1000`, followed by the coefficient ceiling. Negative discriminant and positive leading coefficients are explicit. The reduced-form and normalized-j supplier identifications are documented omissions. Sutherland CRT Appendix 1, Lemma 8, pp.31–32, supplies the constant. The elementary symmetric-product estimate remains separate; neither correctness nor this bound uses GRH. |
| `class-polynomial-api-roots` | The promoted API copy now agrees with the corrected separability conclusion. |

No mathematical node was added: the quadratic ray specialization and analytic height signature spell out parts of targets already represented in the packet. Other changes update the 19 baseline check records, all four source-finding reviews, the top-level review ledger, source metadata and the reader's confirmation/signature prose. The reader's statements, hypotheses, proof sketches and acceptance properties agree with the packet after these corrections.

## Previous rejection grounds

The earlier review's 50 `unverifiable` verdicts concerned agreement between the plan and its suggested signatures/tests. They have been checked against the revision, rather than accepted from its handoff.

| Earlier requirement | Independent check |
| --- | --- |
| Full named conclusions | The suggested declarations retain actual End/Picard classification, lifting and graph conclusions; the self-twist is an intertwining isomorphism; Cartan containment is a conclusion. Both algorithms assert existence of an accepted output and correctness. Order verification determines the full conductor. The additional omissions discovered in this review are repaired above. |
| Complete definition APIs | Selected reflex-factor fractions, type stabilizers, double-reflex primitive cores, algebraic End identifications and independent seed/order validation have native typed signatures. No new truth-valued object substitutes for an unavailable definition. |
| Tests exercise their objects | The tests use the lattice-to-curve constructor, polarized lattice pairing, tensor/Lie carrier, regular CM evaluation and actual value field. Certificate and algorithm fixtures bind the proposed computations. The unvalidated-oracle test concerns an uncertified approximation to an integral CM root. Exact order, conductor-prime-power and torsion tests distinguish plausible wrong definitions. |
| Reader corrections | Field primitive-core scope, the comparison multiplier, relative reflex discriminant, prime-power certificate, conductor tests and corrected source locators agree with the packet. |

The previous mathematical repairs are also preserved. A product CM algebra does not acquire a field primitive core; its trace reflex field uses a common Galois CM overfield of the factors. Yuan–Zhang §2.2, p.546, gives a relative discriminant, which is the unit ideal in the selected quadratic factor even for the Gaussian order of absolute discriminant −36. The natural Galois pairing multiplier and the comparison multiplier remain distinct. Endo Corollary 4 handles every prime power above 3; exact valuations at 2 and 3 use certified climbing. CRT termination directly depends on independent order verification and complete finite searches, with heuristic complexity kept separate. The local Euler comparison retains the covariant arithmetic-Frobenius versus cohomological geometric-Frobenius duality and finite-inertia adapter.

## Baseline, suppliers and ownership

All cited declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No approximate name search was used as confirmation of a statement.

| Confirmed declarations | Scope checked |
| --- | --- |
| `NumberField.IsCMField`, its `complexConj`, `complexEmbedding_complexConj`, `complexConj_apply_apply`, `complexConj_eq_self_iff` | CM field structure; conjugation has the cited integrality hypothesis and the claimed embedding/involution/fixed-field laws. |
| `FractionalIdeal` | Submodules of a localization with a common denominator. Invertibility is additional and uses the unit carrier. |
| `IntermediateField.adjoin`, `adjoin_le_iff` | Generated intermediate fields and their actual universal property. |
| `TauCeti.AlgebraicGeometry.AbelianVariety`, `.End` | Proper geometrically integral group objects and additive-wrapped algebraic endomorphisms under composition. Geometry-to-analytic adapters remain supplier work. |
| `TauCeti.Isogeny`, `.degree` | Weierstrass coordinate pullback preserving infinity; degree is the full function-field extension degree. |
| `WeierstrassCurve.j` | The native j invariant requires invertible discriminant. |
| `ClassGroup`, `ClassGroup.mk`, `CommRing.Pic`, `ClassGroup.equivPic`, `CommRing.Pic.mapAlgebra` | Invertible fractional-ideal classes, invertible modules and base change; nonmaximal orders reuse these carriers. |
| `NumberField.RingOfIntegers` | The integral closure of Z in the number field. |

The reviewed CM library-audit rows and accepted RS-04 review were checked. Two complete nearby upstream roadmaps, Multiquadratic and InductionRestriction, were read as density and structure references. The 37 requests were checked against the actual supplier-stage statements. The 18 finer external-node references represent ten distinct inputs, whose full statements were read: A2 Rosati; A6 polarized automorphisms, characteristic polynomials and endomorphism degree; R11.5 local Euler factors and Néron–Ogg–Shafarevich; CN4 complex-box denotation and unique integer recovery. A reference to a supplier plan does not assert that its export is built or independently accepted.

The broader contracts remain precise requests. In particular A0/A1 do not already supply the entire Serre-tensor construction; R12.6's general descent is not itself the full regular CM-value separation theorem; V8's modular-tower interface requires the stated Siegel-function refinement. The independent level-one j package includes a prime diagonal modular-polynomial integrality contract, without introducing a CM dependency into the upstream construction. GN2 needs integral quaternion orders in addition to the quaternion algebra supplied by QFI Layer 2. These refinements remain imports or gaps, rather than duplicated definitions.

Ownership follows RS-04: D3 owns generic reflex fields, V4 type norms, V5 the main reciprocity theorem, GN9 Hecke characters, GN11 order arithmetic and CN4 generic validated numerics. CM.0 remains before V5; CM.2 specializes V5. CM.6 remains a process layer, with its mathematical examples assigned to CM.0, CM.2 and CM.3.

The assigned **RT-AREA-computational/14** is satisfied: CM.5 directly imports CN4's enclosure and integer-recovery nodes and requests a proved-tail arbitrary-precision j evaluator and outward product/precision propagation. The complex algorithm uses those contracts. The CRT algorithm uses independent finite-field searches and exact reconstruction; sharing CM.5 does not make it depend on the analytic evaluator. Generic interval arithmetic is not planned a second time.

## Source scope and findings

All node locators, hypotheses and proof outlines were compared with their cited passages. Reading was targeted to those passages and their needed context; it was not a complete proof extraction of all 20 documents. Gross–Zagier printed pp.257 and 261 were inspected visually where the scan defeats text extraction. Deuring's classification/realization and lifting passages on pp.197–200 and 258–262 were checked, while its complete primary proof remains a recorded gap. Kato §§15.10–15.11, pp.260–262, retains the infinity-type and period conventions; Kings–Sprang §1.2, pp.8–11, retains both pairings and the covariant/de Rham distinction. BKO pp.950–953 and Yang pp.1–2 retain the canonical-character discriminant restrictions.

The packet records URLs, version kinds and SHA256 values. The independently retrieved bytes match all 20 source records and the additional Yuan–Zhang author erratum. The latter's pp.1–2 concern the original Theorem 2.7 and Néron exactness, separately from the §2.2 trace-order definition used here. Published Kings–Sprang and Burungale–Tian texts, the Endo journal version and the 2023 Yuan–Zhang journal erratum have not been collated; the review does not extend preprint findings to those versions.

| Finding | Independent verdict |
| --- | --- |
| E1, Tsimerman §5 p.386 | Confirmed domain misprint: the ideal is in the reflex field, so its rational absolute norm is taken from that field. |
| E2, Tsimerman Lemma 4.1 proof p.384 | Confirmed proof issue: an infinite-order CM unit has a nontrivial power congruent to 1 modulo 3. Full level alone does not rigidify an unpolarized CM surface. Polarization is needed for the finite-automorphism argument. This does not refute the lemma's field-of-definition bound. |
| E3, MIT21 Theorem 21.14 p.10, Fall 2023 | Confirmed missing ordinary split-reduction condition. For D=−23 and inert p=5, the principal prime splits over the quadratic field in its Hilbert class field and gives norm 25, yet the exact class polynomial reduces to X³. The norm condition alone cannot ensure distinct roots. The coefficient fixture agrees with the Sage primary documentation example. |
| E4, Endo arXiv v2 §3.2 p.7 | Confirmed only for this preprint's unqualified certificate-construction scope. With v=25 and u=5, the displayed first comparison requests separation of the same order. Ordinary trace data q=p=641, t=8, D_K=−4 permit this case. Corollary 4, pp.5–6, supplies the prime-power repair; 2/3-adic climbing is separate. A valid certificate's conditional soundness and the heuristic running-time results are not disputed. |

All four `sourceIssues.review` entries name this job and give fresh confirmation reasons. No additional source finding was added.

## Validation and follow-up

- `python3 scripts/check_blueprint.py research/blueprint/packets/ComplexMultiplicationAndExplicitReciprocity.json`: zero errors, zero warnings.
- Source-issue and source-version validator functions: zero errors.
- Declaration/API/test-name coverage, reader agreement and exact PDF-hash checks pass. All 69 per-node verdicts are present exactly once.
- `lean-check research/blueprint/suggested/ComplexMultiplicationAndExplicitReciprocity.lean`: exit 0, 243 warnings, all `declaration uses sorry`. Memory availability was checked before compiling.
- The shared build has the exact Mathlib pin. Tau Ceti `End.Basic` and `Isogeny.Degree` build objects are unavailable, so the documented Tau Ceti imports remain commented. Their source statements were checked at the exact pin. Elaboration checks the displayed Mathlib signatures, not these unavailable imports or the omitted supplier identifications. Every implementation status remains `unchecked`.

**Questions for the orchestrator:** no further revision is required for this review. Retain the existing five follow-ups: absolute/unmarked moduli descent, the canonical Gross primary construction, full Deuring proof/quaternion-order carriers, certified j evaluation and complete finite-field search, and the listed native-carrier/omitted-condition supplier adapters. Collate the Endo journal version before extending E4 beyond arXiv v2. No upstream roadmap edit, mathematical promotion or extra proof-lemma job was performed here.

**Summary (under 250 words).** Accept the revised 69-node target-level plan. The earlier signature, API, test and reader failures are repaired; this review corrected 15 further nodes, chiefly integral lattices, rank-four product torsion and missing field/reciprocity/height conclusions. All 19 baseline declarations were read at the exact pins. All four source findings are independently confirmed, with publication limits retained. Packet checks pass, and the suggested file elaborates with 243 `sorry` warnings in the Mathlib-pinned shared build. Five honest supplier/source gaps remain; none is presented as implemented. The packet, reader and suggested file agree, ownership follows RS-04, and the CN4 numerical dependency addresses the assigned red-team finding.
