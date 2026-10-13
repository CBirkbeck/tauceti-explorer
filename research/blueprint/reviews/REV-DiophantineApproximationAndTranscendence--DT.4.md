# Independent review: DT.4 effective applications

Accepted as a completed planning pass with the eight explicit gaps listed in the packet. This acceptance verifies the corrected statements and dependency accounts; it does not assert that those gaps have been formalized or that the supplied explicit source contracts have all been derived from the pins.

Reviewer: Codex, session codex-qnrRdS, 2026-10-13. Review issue #9280; the input blueprint was Claude’s #9322, so this is independent of its author.

The review checked all 49 original nodes and added one key theorem: 50 verdicts, comprising 45 corrected, four verified and one added. “Corrected” includes updated source-version locators as well as mathematical edits. All 71 original pinned baseline declarations were checked; two exact interfaces were added, for 73 total. The packet now has 29 API items, 21 discriminating tests, five planets, eight gaps and three NumberFieldArithmetic supplier records. One of those supplier records is already implemented in current Tau Ceti and is marked supplied-current. No target is marked closed.

## Mathematical corrections

- The variable-exponent proof now retains the class-number product in (5.19), the factor n lost after the exponent-height estimate, and the infinite-place value N(v)=2. It proves that its logarithmic form is nonzero, uses the auxiliary field’s height cutoff, and supplies the full numerical absorption to `(10n²s)^{46ns}|D_K|^{8n}P_S^{n²}exp(15ndĥ)`. The corrected formula is conditional on the explicitly listed quantitative inputs, not on an unstated repetition of the source’s final calculation.
- The archimedean Baker adapter now uses admissible parameters containing `d·h(α)` and correctly compares them with the source constant. Its finite-place constant remains a Yu 2007 gap; Yu 1994 gives the separately stated effective adapter. The latter now has the actual valuation-transport prerequisite and permits the nonunit argument used for padding a one-logarithm form.
- The sharp S-unit basis constant is proved with the primitive lattice flag and coefficient rounding; the weaker supplier basis bound is no longer said to preserve it. A determinant expansion supplies the inverse-matrix estimate.
- The exact small-representative bound now uses independent ordinary units and the Loher–Masser height-product theorem. It is distinguished from the generic estimate for an arbitrary fundamental S-unit system. The new key theorem records the shifted-height counting and Blichfeldt inputs that still need a supplier.
- The compositum discriminant proof now follows Stark’s local primitive-element/derivative argument and exposes the missing formal bridge. A trace-dual manipulation is no longer presented as sufficient.
- The uniform Thue count handles linear/linear, linear/quadratic and quadratic/quadratic factors separately. Its Lean statement asserts finiteness as well as an ncard bound; infinite sets have ncard zero and must not pass the intended contract.
- The kernel/lattice proof uses nonnegative valuations, converts relative Northcott height to absolute height, and cites the rank theorem for the full hyperplane. Applications over ℤ still have auxiliary fields of degree greater than one.
- Added the nonmonic root-height comparison actually used by the superelliptic arguments. The recovery of h(y) uses factorization; it no longer omits the archimedean evaluation term.
- The Thue and Pell reductions clear denominators before using integral ideal representatives. Their explicit constants now cite the publicly available Győry–Yu proof and identify the low-height floor and rank-zero comparison that BEG’s short deduction leaves unresolved.
- The torsion multiplier in the variable-exponent decomposition has the corrected sign. Pairwise root ideals are kept over the splitting field; only the symmetric final inclusion descends. The biquadratic Pell example counts all four real places.
- Tijdeman’s q>p case now contains both the three-logarithm comparison and the distinct two-logarithm normalization, with sign and nonvanishing checks. The admissible real logarithms omit zero terms.

## Sources and baseline

Read the relevant locators independently in the arXiv and published BEG versions, Tijdeman, Voutier, both Bugeaud–Győry papers, Yu 1994, Evertse’s lecture notes, ESS, Tzanakis–de Weger, Győry–Yu, Loher–Masser and Stark. The packet records public URLs, exact-version hashes and read ranges; BEG published pages equal the arXiv page numbers plus 726. Győry–Yu’s publisher PDF is public, resolving the previous source-access claim.

Matveev’s primary PDF could not be retrieved afresh (publisher requests returned HTTP 503/403). The reviewed DT.3 supplier’s precise Corollary 2.3 statement and parameter conventions were read instead; the record explicitly distinguishes that from a fresh primary reading. Friedman, Louboutin, Lewis–Mahler and Rosser–Schoenfeld are still indirect source inputs with honest existing gaps. No cleared private book or source passage was copied into the repository.

No original baseline citation was removed: each declaration exists at the pin. Corrected `HeightOneSpectrum.adicAbv`’s description because its real base is arbitrary; `FinitePlace.mk` supplies the norm normalization. Corrected the description of relative-height Northcott and added its absolute-height conversion supplier. Documented that the pinned `Ideal.sum_ramification_inertia` uses the primed ramification/inertia API and is deprecated but present. Added `NumberField.Units.finrank_eq` and `HeightOneSpectrum.valuation_liesOver` with their full conventions and hypotheses. The suggested file imports `TauCeti.relDiscr` directly instead of copying its definition.

Checked the reviewed library audit, the current read-only Tau Ceti library and the current upstream roadmap tree, including the roadmaps absent from the atlas snapshot. Current Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 already provides `TauCeti.multiplicity_relDiscr`; its Layer 5.10 supplier record is now fulfilled, while the pinned baseline still cites that verified roadmap layer. No duplicate implementation target was added.

Read the cross-roadmap contracts for GN.0’s primitive flag, GN.1’s minimum witnesses, basis and Minkowski bounds, and NumberFieldArithmetic’s Layers 4.2, 5.10 and 6.4. Read the internal DT.0, DT.2, DT.3 and main DT.4 suppliers used by this follow-up. The remaining two NumberFieldArithmetic requests ask for exact contracts, not new versions of their layers. The local compositum-different bridge is separately recorded as a gap in the owner’s direction.

## Source findings

E701–E704 are confirmed against both BEG versions. E705 is rejected as a source error: Tijdeman’s omitted mirror case is routine, and the reader now supplies it explicitly. Added and confirmed E706 (lost n), E707 (rank-zero c₃ comparison) and E708 (infinite-place norm bound). Thus eight findings have independent verdicts: seven confirmed and one rejected. The rejected finding is retained for history, with its reason. Version history and the available publisher/journal records supplied no linked correction. These findings are expressed in our own words.

## Validation

`python3 scripts/check_blueprint.py` with the pinned declaration index: **0 errors, 0 warnings**. `lean-check` at Mathlib 082e2d3 and Tau Ceti f790474: **exit 0**, **101 warnings, all declaration uses sorry**, no other diagnostic. The 823-line file has only real-bodied light definitions over pinned carriers. `scripts/check_sorry_data.py` passes. The reader contains all 50 targets, with matching statements, hypotheses, dependencies, source locators, API and tests. File-scope, local-path and JSON validation and `git diff --check` pass.

## Per-node verdicts

| Target | Verdict | Review note |
| --- | --- | --- |
| `separated-height-logarithmic-form-bound` | corrected | Replaced the insufficient cutoff 0.69 by log 2 and verified the nonzero rational logarithm parameters. |
| `catalan-reduction-to-prime-exponents` | verified | Checked the source contract, hypotheses and proof route against its direct suppliers; no change needed. Recorded source-input gaps, when present, remain explicit. |
| `catalan-exponent-two-cases` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `cassels-type-factorisations` | verified | Checked the source contract, hypotheses and proof route against its direct suppliers; no change needed. Recorded source-input gaps, when present, remain explicit. |
| `tijdeman-smaller-exponent-bound` | corrected | Checked and corrected admissible logarithm parameters and the mirror-case comparison. |
| `tijdeman-larger-exponent-bound` | corrected | Supplied the full q > p two-logarithm normalization, sign and nonvanishing argument rather than an unsupported symmetry assertion. |
| `tijdeman-catalan-effective-finiteness` | verified | Checked the source contract, hypotheses and proof route against its direct suppliers; no change needed. Recorded source-input gaps, when present, remain explicit. |
| `primitive-binary-form-linear-factor-ideal` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `uniform-bound-for-thue-equations` | corrected | Repaired the mixed linear/quadratic case and strengthened Lean cardinality bounds with explicit finiteness. |
| `voutier-height-lower-bound` | corrected | Made the ambient-degree reduction explicit and removed the false claim that applications over ℤ need only the rational height cutoff. |
| `yu-bound-in-a-number-field` | corrected | Added the actual valuation-transport theorem and checked the permitted nonunit padding against Yu 1994. |
| `baker-bound-at-a-place` | corrected | Replaced the invalid Matveev parameter calculation with a degree-correct comparison; retained the separate Yu 2007 gap for the exact finite-place constant. |
| `s-norm` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `s-regulator` | corrected | Added rank and analytic-lower-bound prerequisites and the empty-determinant test. |
| `class-number-and-regulator-bounds` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `fundamental-s-units-of-bounded-height` | corrected | Supplied the sharp primitive-flag basis argument and elementary minor bound needed for the exact constants. |
| `small-representative-modulo-s-unit-powers` | corrected | Separated the generic covering estimate from the exact BEG constant and supplied its ordinary-unit and finite-prime proof. |
| `minkowski-cofactor-for-ideals` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `principal-generators-of-class-group-powers` | verified | Checked the source contract, hypotheses and proof route against its direct suppliers; no change needed. Recorded source-input gaps, when present, remain explicit. |
| `s-logarithmic-map-kernel-and-lattice` | corrected | Corrected the valuation sign, absolute/relative Northcott conversion and full-span dependency. |
| `s-unit-rank` | corrected | Replaced an inference from the rank definition with the actual Dirichlet finrank theorem. |
| `content-ideal-gauss-lemma` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `coefficient-height-of-polynomial` | corrected | Added API and three independent tests for the second bundled height definition, and the absolute-height conversion dependency. |
| `polynomial-height-versus-roots` | corrected | Added the nonmonic root-height estimate actually used by the consumers and a valid evaluation bound. |
| `discriminant-size-bound` | corrected | Made the positive-degree domain of the local discriminant estimates explicit. |
| `lcm-of-first-integers-bound` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `polynomial-discriminant-in-relative-discriminant` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `relative-discriminant-exponent-bound` | corrected | Added valuation_liesOver for orders; confirmed the current Tau Ceti implementation of the Layer 5.10 supplier and marked that request supplied rather than replanning it. |
| `relative-discriminant-of-compositum` | corrected | Replaced the unsupported trace-dual proof with Stark’s local derivative proof and exposed its missing formal bridge. |
| `kummer-extension-unramified-criterion` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `discriminant-of-root-field-bound` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `discriminant-of-kummer-compositum-bound` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `thue-equation-over-s-integers-effective` | corrected | Added the denominator-clearing step required to apply ideal divisor representatives. |
| `thue-equation-over-s-integers-explicit` | corrected | Read the primary theorem and proof, supplied its reduction and replaced the unavailable-source gap by precise low-height and rank-zero constant gaps. |
| `pell-system-over-s-integers-effective` | corrected | Added the denominator-clearing step required to apply ideal divisor representatives. |
| `pell-system-over-s-integers-explicit` | corrected | Verified the connected rank-three factor graph, primary proof and corrected the real biquadratic place count; exposed the same constant-comparison gap. |
| `superelliptic-factor-coprimality` | corrected | Distinguished splitting-field pair ideals from the symmetric product that descends to the root field. |
| `superelliptic-ideal-power-decomposition` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `superelliptic-power-decomposition` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `superelliptic-power-decomposition-height-bound` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `superelliptic-reduction-to-thue-equation` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `hyperelliptic-reduction-to-pell-system` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `superelliptic-effective-finiteness-over-s-integers` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `beg-superelliptic-height-bound` | corrected | Repaired the height estimate for y using factorization and the nonmonic root bound. |
| `beg-hyperelliptic-height-bound` | corrected | Statement and proof verified unchanged; corrected the source locator to identify the independently checked published BEG version. |
| `superelliptic-variable-exponent-decomposition` | corrected | Corrected the torsion multiplier sign and specified the refined Győry–Yu input behind the individual height constant. |
| `large-place-estimate-for-variable-exponent` | corrected | Corrected the missing degree factor n in the consequence of the basic exponent-height inequality. |
| `beg-schinzel-tijdeman-bound` | corrected | Recomputed the corrected constant completely, including nonvanishing, the factor n, the auxiliary-field height floor and the infinite-place factor 3. |
| `schinzel-tijdeman-effective-over-s-integers` | corrected | Separated computable structural data from the explicit constants and corrected the higher-degree height and logarithmic-form requirements. |
| `multiplicatively-independent-height-product-lower-bound` | added | Verified Győry–Yu Proposition 1 and Loher–Masser Theorem 3; quantitative counting/Blichfeldt input is recorded as a precise gap. |

## Assembly notes

No question blocks this review. The orchestrator should retain all eight gaps, route the quantitative height-product input to this layer and the compositum-different bridge to NumberFieldArithmetic, and preserve the explicit/effective distinction. Repoint the main packet’s Baker, Schinzel–Tijdeman and Catalan consumers as listed in the reader’s assembly notes; do not introduce a cycle back through the main theorem being proved. Move the higher-tier S-unit rank consumers to this owner. The analytic bound remains here as a recorded lower-tier need; do not cite the higher AN.4 layer.
