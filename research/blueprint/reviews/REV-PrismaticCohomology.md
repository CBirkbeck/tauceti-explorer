# Independent review: PrismaticCohomology

**Job:** REV-PrismaticCohomology, issue #9401. **Reviewer:** Codex, session codex-gbJdB5, 2026-10-13. **Verdict:** needs_changes. This completes the review; it is not a checkpoint. The plan reviewed was submitted by Claude, session claude-K4ORjR, in PR #9495 (commit a24a6792c). This reviewer did not write that plan or either inherited part.

The seven additional targets have been corrected in place. The proposed replacement graph cannot yet be approved: its formal-module and completed-framing interfaces do not cover all consumers, and its log-envelope replacement asserts a supplier that does not supply the required general envelope. The top packet's `imports` records provenance, not executable assembly. Changing the status to `partial` describes these boundaries honestly, but does not validate those proposed replacements.

## Inventory and review boundary

| Artifact | Nodes | Baseline entries | API items | Unit tests | Planets | Gaps | Requests | Source issues |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Corrected top packet | 7 | 7 | 34 | 16 | 0 | 7 | 8 | 0 |
| Retained PR.0–PR.7 part | 290 | 140 | historical | historical | 48 | 25 | 105 | 81 |
| Retained PR.8 part | 79 | 20 | historical | historical | 6 | 3 | 14 | 10 |

The seven top nodes are three constructions and four theorems. Every construction has at least three discriminating tests. There are no added target nodes; the additional work is in hypotheses, proof steps, APIs, tests, supplier requests and explicit gaps. All seven receive `corrected` in the top review record. All nine top-level stages are now partial, with explicit remaining obligations; none is claimed planned or closed by this artifact.

I read the source locators of all seven new nodes, all seven top baseline declarations, the directly cited supplier contracts, the two retained part reviews and their acceptance boundaries, the proposed ownership/repointing records, and the ten relevant confirmed red-team records. The 369 inherited targets and their 91 source-issue entries keep their earlier reviews. This report does **not** certify a new independent reading of those 369 sources or replace those source-issue verdicts. There are no source issues in the top packet to adjudicate. The inherited appendices are historical input, not evidence that every proposed replacement has been proved.

The parts' 54 planets are already six per layer. I added no seventh planet to any layer. The missing consolidation of their planet records is part of the assembly defect, not an assertion that a whole roadmap should have zero planets.

## Corrections at the new targets

**PR.5/quasi-coherent-complexes-on-prestacks.** The category is the coherent infinity-categorical limit over ring-valued points, with derived scalar extension, not a limit of ordinary derived categories. I made the universe/presentability convention explicit. The original E0 `limits-colimits-and-slices` reference only supplied a join construction; it is replaced by `limits-colimits-universal-properties`. The enhanced module coefficient-change/perfect-action contract is included. Pointwise monoidal duality is justified by Higher Algebra Proposition 4.6.1.11 and Remark 4.6.1.12, p.620; perfect/compact modules by Proposition 7.2.4.4, p.1263. The perfect-duality extension is requested from E1 rather than attributed to the existing ordinary derived-category carrier. The empty prestack, affine homotopy category, characteristic-two classifying stack and nonperfect module tests retain genuinely different failure modes.

**PR.5/flat-descent-for-quasi-coherent-complexes.** The sheafification map has orientation X′ → (X′)^fpqc. The quasi-coherent functor carries colimits of prestacks contravariantly to limits. SAG Corollary D.6.3.3 is on p.2177, not p.1943. Its discrete faithfully flat specialization gives the ordinary tensor-power Cech nerve. D0 currently supplies groupoid stackification, so space-valued sheafification/effective epimorphisms are requested explicitly. SF.1's module descent supplies the heart, not the entire unbounded infinity-category. The formal prism-chart instance requires the recorded complete-module interface.

**PR.5/affine-direct-image-and-base-change.** Arbitrary affine maps on **ordinary** rings do not satisfy arbitrary derived base change. Take R=Z, B=R′=F_p and M=F_p. The proposed left side is F_p tensor-derived over Z with F_p and has nonzero H^(−1); the right side formed with the ordinary fibre B tensor_Z R′=F_p is concentrated in degree zero. I restricted the theorem to flat affine morphisms and added this acceptance counterexample. SAG Proposition 6.3.4.1 and Corollary 6.3.4.3, pp.505–507, are spectral statements with derived fibre products; they do not prove the discarded ordinary-ring assertion. All bounded prism maps to WCart are affine (BL Corollary 3.2.10, p.43), but flatness needs transversality (Corollary 3.2.9, pp.42–43). The acceptance example is restricted accordingly. Global sections are independently the right adjoint of tensor with the unit when the category is presentable; their Cech-totalization formula does not require each atlas map to be affine. I added the exact E3 adjoint-functor prerequisite.

**PR.6/framed-q-automorphisms.** The stated sufficient variant now assumes ordinary and derived I-completeness, ind-etale reductions, a discrete completed polynomial source, completeness of the quotients needed for divisibility and regular tX_s, where t=q−1. Inverting q uses the completed source and P; q need not be a unit in the uncompleted coefficient ring D. The delta extension also needs p-torsion-free P and completeness of P/pP; the outline constructs the completed Frobenius and detects its mod-p reduction explicitly. I added the inverse API and replaced the invalid q=1 input by reduction of a valid regular input modulo t. The Frobenius example uses the actual completed polynomial algebra. The merely p-complete localization example still detects the false lifting claim. This is a sufficient corrected variant, not a proof covering the inherited general consumers.

**PR.6/q-derivations-and-their-koszul-complex.** The automorphisms must fix D and q. The individual exact quotient derivatives then are D-linear and commute; the finite cochain Koszul differential squares to zero by commuting operators and wedge signs. I added the coefficient API/test and Lean signatures. Infinite coordinate sums require continuity and summability, which an arbitrary family of exact quotient operators does not imply. Coordinate injection alone is not enough for arbitrary operator data: extra target directions must fix the map's image. Reduction requires the first-order automorphism modulo t² (BS22 Construction 16.19, footnote 21, p.114), not just identity modulo t. Continuous completed forms are requested from DD.2. AI.1's current `koszul-products-and-cohomology` treats its particular automorphism/scalar setting; it does not state the required general commuting divided-endomorphism interface. I requested that interface and kept the finite degreewise decalage proof in the outline. The Laurent example is a derived completed block complex; it does not assume that cohomology is obtained by naive completion of its torsion summands. Scaling examples use Z[q,q^(−1)], where scaling is an automorphism.

**PR.7/beilinson-fibre-square-input.** The AMMN locator is §6.3, pp.44–46, not §6.4. Construction 6.16, Theorem 6.17, Proposition 6.18, Lemma 6.19, Corollary 6.20 and Proposition 6.21 give the stated source input and the nonzero scalar comparison used in the proof of BS23 Proposition 6.8, pp.22–24. Rationalization occurs after the specified completion. A trace-defined syntomic object needs coherent identification with PR.4's prismatic object. DD.4's characteristic-p mod-p PD/de Rham comparison does not by itself supply the integral mixed-characteristic identification A_crys(R/p) with the completed derived de Rham object of R. Both that interface and the trace-theoretic proof remain explicit gaps. A named input is not a lower-tier proof.

**PR.7/fargues-fontaine-slope-zero-input.** I read the freely accessible Fargues–Fontaine author manuscript directly. The statement now distinguishes the schematic curve's slope results from the analytic Frobenius-quotient curve and adds GAGA. The sources are Theorem 8.2.10(1), p.238; Chapter 10's field setup, p.264; Proposition 10.5.6 and proof, p.290; Corollary 11.2.22, pp.327–328; Theorem 11.3.1 and proof, pp.330–331. Definition 1.8.1, p.37, fixes the Robba convention. K is complete discretely valued with perfect residue field, and C is its completed algebraic closure in this application. The current R06.2 packet has finite-extension range; the broader weak-admissibility interface is requested. The ordinary D_K scalar extension and the consumer's Frobenius-twisted filtration must be matched. The P7 Robba node does not itself give the bundle dictionary or identify the constructed modification. BS23 §6.4, p.26, explicitly leaves this matching implicit. The existing AdicSpaces Layer 6 supplies the adic curve, not these bundle theorems, its untilt point, or the dictionary.

## Source and baseline checks

The packet records URLs, exact versions, SHA-256 hashes and the review's scoped readings. All source-derived assertions are paraphrases with statement/page locators; no source excerpts were added. Scholze's fetched q-deformation PDF is arXiv:1606.01796v1, 6 June 2016, 18 pages; references to an unsupported v2 were corrected. Higher Algebra was added as an explicit source. The reader's reference list now distinguishes the fresh PDF readings from inherited TeX provenance and earlier part readings.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` the seven cited declarations exist:

| Declaration | What the read declaration supplies |
| --- | --- |
| `DerivedCategory` | Derived category of an abelian category, under `HasDerivedCategory`; the ordinary homotopy-category comparison only |
| `ModuleCat` | Bundled modules over a ring |
| `Module.FaithfullyFlat` | Flatness with faithful residue-field detection |
| `AlgEquiv` | Algebra equivalences fixing the coefficient algebra |
| `Algebra.FormallyEtale` | Ordinary formal-etaleness, not completed ind-etale lifting |
| `KaehlerDifferential` | Ordinary algebraic differentials, not continuous completed forms |
| `ExteriorAlgebra` | Exterior algebra over existing modules, not the missing operator complex |

No baseline declaration was removed. The overbroad `provides` descriptions for formal-etaleness and differentials were narrowed. No prismatic theorem is claimed to be implemented at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

I read the relevant reviewed library-audit entries and the current read-only Tau Ceti library/roadmaps, including AlgebraicVectorBundles, DifferentialGradedAlgebrasInfinity and AdicSpaces. Ordinary vector-bundle/QCoh material already owned upstream is not replanned; the new PR.5 target is the generic derived-prestack extension. The curve carrier is imported, not reconstructed. None of the new nodes is an already implemented prismatic comparison.

## Replacement graph and red-team checks

R1–R7 are now explicitly `proposed_not_applied`. Their descriptions and the reader no longer claim the LP1/QW.6/RT/VB requests or stage edges have already been removed. R1 must distinguish flat affine ordinary charts from nonflat or completed formal charts. R2 must establish the broader completed-framing range and infinite-coordinate construction before removing QW.6. R3–R4 retain proof and construction-matching gaps. R5 concerns the stage edge only; the retained PR.8 node list already has no T6 prerequisite.

R6 has 41 rows describing 39 still-present bare stage occurrences plus two already-resolved entries. All other replacements remain candidate contracts. The following corrections matter:

- Row 5 has no supplier. `regular-prismatic-envelopes` assumes complete flatness and a completely regular kernel; the prelog-envelope consumer asserts existence after general exactification. Animated delta-ring carriers alone do not prove that ordinary universal envelope.
- Row 27 must not replace the existing DD.6 log-QRSP adapter by DD.5's ordinary QRSP definition. Trace its ordinary foundations through DD.6 before deleting the redundant PR.2 reference.
- Rows 30–31 must retain envelope construction. `initial-log-prism-qrsp` explicitly constructs an envelope and invokes BS22 Proposition 7.10; its proof does not dispense with envelopes by citing Proposition 7.2. Its general semiperfectoid existence needs the row-5 gap, and its QRSP regular-sequence reduction must establish the regular-envelope hypotheses.
- Rows 37 and 40 are already resolved in the accepted revision; they are not new edits. The remaining probable rows require the stated log-consumer arguments, especially the group-algebra Hodge–Tate calculation, cosimplicial Frobenius, log q-crystalline site and proper global comparison.

The confirmed red-team contracts are preserved as follows:

| Finding | Checked consumer boundary |
| --- | --- |
| padic-2/4 | Separate R07.4/Kummer-tower lattice comparison, with all-weight/integral and Fontaine-functor matching requests; no cyclotomic substitute |
| padic-2/6 | PR.4 retains the arbitrary p-adic formal-scheme derived etale comparison, not only its smooth corollary |
| padic-2/24 | Arc/arc_p and perfectoidization-descent inputs remain precise external gaps |
| padic-2/25 | Scheme/adic cohomology suppliers and the selected Spec/Spa route remain qualified; arbitrary formal generic-fibre scope is a gap |
| padic-2/26 | PR.1 characteristic-p Hodge–Tate comparison cites DD.3's polynomial Cartier theorem |
| padic-2/27 | PR.1 retains the Witt p-torsion-free hypothesis; PR.3 owns the general later theorem |
| padic-2/28 | Relative twists/Nygaard in PR.3, absolute Nygaard in PR.5, syntomic fibres in PR.4; the PR.5 → PR.4 edge is still proposed |
| padic-2/29 | Formal WCart quotient and complete modules remain distinguished from ordinary stacks; R1 has not discharged their interface |
| padic-2/30 | Lisse v-descent and Kisin matching requests persist; the FF input still has dictionary/classification/matching gaps |
| etale/28 | One intended framing owner, with scope comparison required before R2 can replace the old QW.6 contract |

These are checks of the retained handling records against the proposed moves, not declarations that the findings' external proof obligations are all closed.

## Required revision and orchestrator decisions

A revision should consolidate the 369 retained nodes and seven new nodes into the effective artifact, preserving baseline/source metadata, earlier source-issue verdicts, gaps, requests and six planets per layer. `scripts/promote.py` copies the packet as-is; `scripts/blueprints.py` reads `nodes` and does not resolve `imports`. At this review's baseline only the PR.0 part is in `data/blueprints`; the accepted PR.8 part is not imported by the new top packet. Merely promoting the seven-node packet would not serialize its advertised 376-node whole roadmap. The checker validates the serialized graph; its success does not validate the ownership tables.

For that revision, establish or precisely delimit the formal-QCoh contract, the complete/general/infinite framing contract, and general envelope existence. Then apply only justified R1–R7 changes to actual node prerequisites and the reader. The maintainer should decide whether the FF classification/GAGA and trace-square proofs are to be supplied inside the allowed bundle or kept as explicitly unclosed named inputs, and route the exact E1, D0, DD.1, DD.2, AI.1, R06.2 and P7 requests. This review does not ask for a full proof of every honest gap before a partial plan can be accepted; it asks for removal of false replacement claims and a correct effective consumer graph.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PrismaticCohomology.json`: zero errors, zero warnings after corrections.
- `lean-check research/blueprint/suggested/PrismaticCohomology.lean`: exit 0 at the pinned Mathlib; 22 warnings, all declarations using `sorry`, no other warnings or errors.
- Suggested file: individual module imports, 250 lines, real-bodied light definitions; no sorry-bodied data or invented missing carriers. The two new coefficient signatures match the corrected D-algebra operator contract.
- Intake file check: five allowed files, zero problems; `git diff --check` and the sorry-data check pass.
- Reader: all seven new target blocks and the replacement/gap/request/reference sections synchronized; retained part appendices identify historical provenance.

The handoff lists the concrete next revision tasks. The review verdict deliberately prevents promotion of this unassembled replacement graph.
