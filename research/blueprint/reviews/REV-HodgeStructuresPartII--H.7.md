# Independent review: HodgeStructuresPartII H.7

**Verdict: accepted.** This is a completed target-level conditional plan, with seven explicit gaps and unchecked implementation. It is not a claim that H.7 or its suppliers are proof-closed. Reviewer: Codex, GPT-6, session `codex-7rvISB`; job [#7064](https://github.com/CBirkbeck/tauceti-explorer/issues/7064); 8 October 2026. The input plan was another worker's job, BP-HodgeStructuresPartII--H.7 (#6946), submitted in PR #7321 by session codex-UCIlJ6.

The [packet](../packets/HodgeStructuresPartII--H.7.json), [reader](../readmes/HodgeStructuresPartII--H.7.md) and [suggested file](../suggested/HodgeStructuresPartII--H.7.lean) agree on 31 nodes, eight definitions/constructions, 32 API entries, 24 discriminating examples and six planets. Every node has a source locator or an explicitly authored deduction, required hypotheses and a prerequisite route. The acceptance is conditional on the documented supplier and signature boundaries.

## Changes made during review

1. Corrected the stale assertion that H.3 has no finer nodes. Linked polarized-compact-dual, represented-complex-orbit, mt-orbit-open, monodromy-descent and orbit-hodge-tensors where their statements apply. Updated request 1, G2 and audit records. These are plans, not newly implemented or accepted supplier proofs; finite real charts, metric/Cartan adapters, arithmetic morphism factorization and generic tensor/drop classification remain requests.
2. Promoted ordered-sector permutation cover, half-open logarithm surjectivity and flag filtration refinement from API entries to three standalone lemma nodes with `addedBy: REV-HodgeStructuresPartII--H.7`. Linked them to the deep/positive-height cover, local period graph and Gram formula consumers. The Lean names remain the original API names, so no duplicate definition or theorem is introduced.
3. Added Hodge-form addition in both arguments and conjugate-right scalar multiplication, with matching packet, reader and Lean signatures. This completes the operations consumed by entrywise Gram and sum arguments. Existing three tests distinguish convention, zero and native diagonal.
4. Corrected the compact-target proof step: neatness makes quasi-unipotent monodromy unipotent; cocompactness then makes it trivial. Torsion-freeness alone does not imply the first assertion.
5. Reworded all 33 source assertions and the inherited quoted/first-person explanations in our own words. Retained exact locators, authored corrected mathematics, catalogue identifiers and historical reading receipts. Added a confirmed review with a separate reason to every source issue. Clarified the modular-quotient injectivity condition in the outer-boundary counterexample, made the changing-order example's two low subspaces explicit, and aligned the all-positive-height repair with retained interior parameters.
6. Added independent reading receipts, exact-pin baseline checks and top-level review verdicts. Updated reader counts, dependencies, source discipline, G2 and validation limits. No atlas, integrated data, upstream roadmap, source PDF or source passage is changed or copied into the repository.

## Source and library checks

All six public PDFs were independently downloaded to ephemeral scratch and their SHA-256 values matched the packet. No restricted library source was needed. The independent read boundaries are:

- **BKT20**: Independent review 2026-10-08: §§1.3–1.4, §§2.1–3.2 and complete §§4.1–5 at published pp.920–934; rendered pp.931–933 collated for formulas and symbols. All H.7 locators checked; cited Schmid/CKS/reduction proofs remain supplier work.
- **BKT-author**: Independent review 2026-10-08: bytes/hash verified and §§4–5 corresponding passages compared with publication; no claim to independently reread its entire Appendix A.
- **BKT23**: Independent review 2026-10-08: complete four-page erratum, §§1.1–1.6 and examples.
- **Ka85**: Independent review 2026-10-08: §§1.8–1.9 pp.859–861; Lemma 2.4.1 proof pp.863–864; Theorems 3.4.1–3.4.2 p.870 (rendered formulas), §4.1 and beginning §4.2 pp.870–873. Complete asymptotic proof not reverified.
- **K17**: Independent review 2026-10-08: §§2.4–2.6 pp.8–9 and §§3.3–3.5 pp.11–13, including Definitions 3.12–3.13. Cited André/Pink proofs remain supplier obligations.
- **PS09**: Independent review 2026-10-08: Theorem 4.4/Corollary 4.5 and their proofs, draft p.12; Theorem 6.1, remarks and proof, draft pp.16–18. Earlier analytic-geometric and projective Chow inputs not independently reverified.

BKT20 §§4–5, pp.928–934 support the route from buffered local lifts through norm/Gram/reduction comparisons to individual special pullbacks and the countable exceptional union. BKT23 §§1.1–1.6 supplies fixed-K and Cartan-compatible corrections. All source locators in the 28 original nodes were checked. The extra lemmas are elementary deductions tied to the same source constructions, with their complete finite sorting, logarithm and span arguments stated in the packet. Cited Schmid, CKS, André/Pink and general reduction-theory proofs are still supplier work; their names are not treated as newly verified declarations.

Read the four HodgeStructures rows of `data/library-coverage.json`: pure theory, polarization and period points are built; mixed categorical theory is partly built. H.7 has no direct audited layer row. Read the upstream HodgeStructures and UniversalCovers reader conventions. Inspected each of the following actual declarations at the packet's full pins, using the existing shared checkouts rather than copying a repository. The audit reuses fibrewise Hodge theory and does not plan a replacement.

| Exact declaration | Statement and fit checked |
| --- | --- |
| `mathlib:Set.Definable` | A subset of a finite Cartesian power of a first-order structure is given by a formula with parameters from A. This is a coordinate-level baseline, not an o-minimality or finite-atlas theorem. |
| `mathlib:Complex.norm_exp` | For z complex, the norm of exp(z) is exp(Re z). Applied to 2πiz this bounds the punctured-disc coordinate away from its outer circle. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn` | A decreasing exhaustive opposed filtration on a complex module with specified conjugation, of integral weight n; separatedness is derived. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn.piece` | The submodule H^{p,n-p}=F^p intersect conjugate F^{n-p}. A type-(0,0) subspace in nonzero weight is zero, not simply the p=0 piece. |
| `tauceti:TauCeti.Hodge.Polarization.hodgeForm` | Native conjugate-first Hermitian form h_N(u,v)=Q(C(conjugate u),v), on an abstract integral complexification. H.7 reuses it fibrewise. |
| `tauceti:TauCeti.Hodge.Polarization.hodgeForm_eq_conj` | h_N(u,v)=conjugate(Q(Cu,conjugate v)); supplies the BKT conjugate-second convention exactly. |
| `tauceti:TauCeti.Hodge.Polarization.hodgeForm_self_pos` | A polarization has strictly positive Hodge-form diagonal on every nonzero complex vector. Zero must be excluded from two-sided monomial estimates. |
| `tauceti:TauCeti.Hodge.tate_piece` | The only nonzero piece of Z(m), weight -2m, has first index -m and is the whole complex line. |
| `tauceti:TauCeti.Hodge.tate_hodgeForm_apply` | The native Hodge form of the polarized Tate line evaluates to conjugate x times y. |
| `mathlib:TopologicalSpace.NoetherianSpace.finite_irreducibleComponents` | Every Noetherian topological space has finitely many irreducible components; apply to a closed algebraic subset with its Zariski topology, not its ordinary complex topology. |
| `mathlib:AlgebraicGeometry.finite_irreducibleComponents_of_isNoetherian` | A native Noetherian scheme has finitely many irreducible components. The complex-point/analytification comparison is still supplied externally. |

The pinned Tau Ceti name/body search found no H.7 period-definability, rough-polynomial or Hodge-locus theorem. This is a scoped negative search, not a proof that no differently named result exists. `Set.Definable` supplies coordinate formula semantics, not o-minimality or manifold atlases. Noetherian finiteness applies to Zariski spaces, not ordinary complex topology.

## Every node checked

| Node suffix in HodgeStructuresPartII:H.7 | Verdict | Check and qualification |
| --- | --- | --- |
| `bounded-sector` | verified | Width and height are separate; closed inequalities, empty coordinates and reindexing are consistent with the actual definition. |
| `ordered-sector` | corrected | Weak descending order includes ties; its finite-permutation API is now a standalone downstream prerequisite. |
| `sector-uniformization` | corrected | The pinned exponential norm gives the q-buffer; half-open logarithm surjectivity is now a standalone prerequisite, including the angular seam. |
| `sector-lift-definable` | corrected | Buffered holomorphic extension and polynomial nilpotent action give the intended conditional graph statement. Exact current H.3 orbit/compact-dual inputs are linked; finite real charts and LD.6/H.6 conditions remain requested. |
| `hodge-form-function` | corrected | The native form is conjugate-first. Its conjugate gives the linear-first BKT convention with unchanged positive diagonal; addition and conjugate-right scalar APIs were completed. |
| `hodge-adapted-flag` | corrected | Initial basis spans have the stated ranks and endpoints. The sorted-label filtration API is now a standalone Gram prerequisite; the homogeneous I-basis remains an H.6 input. |
| `gram-determinant-formulas` | corrected | Equations (4.2)–(4.4) yield the cleared cross-Gram formula with Δ_(j−1)Δ_j and phase i^(2p_j−k). Nonzero pivots require pure filtration adaptation. The refinement dependency is now explicit. |
| `flat-norm-rough-monomial` | verified | Kashiwara supplies splitting-independent squared-norm comparison in the cited regime; nonzero homogeneous vectors and exterior powers are required. Fraction-algebra membership is separate. |
| `moving-norm-rough-monomial` | verified | The negative-Lie correction requires large smallest height and H.6 compatibility. Absolute exterior B-determinants equal positive Hodge determinants; no arbitrary positive-height comparison is asserted. |
| `hodge-entry-rough-polynomial` | verified | Polynomial-size monomial denominators support the localization ring law after clearing the Gram pivots. Arbitrary roughly monomial fractions cannot supply this ring. |
| `determinant-weight-bound` | verified | Centered determinant weights sum to zero. Rational adapted bases are sufficient; ordering is not needed for the diagonal-product bound. |
| `curvewise-reducedness` | verified | Rational positive-slope initial-block curves use one-variable estimates. Constants may depend on the curve; AA.3 transfer needs the determinant-product bound. |
| `uniform-reducedness` | verified | Off-diagonal transfer uses the repaired wider-strip curve lemma. Diagonal sorting yields finitely many orderings, so the false fixed-basis claim is avoided. |
| `deep-siegel-containment` | corrected | The finite metric cover transfers by the corrected AA.3 rational inverse-Siegel theorem with Cartan compatibility and a faithful represented group. Coordinate sorting is now an explicit dependency. |
| `positive-height-siegel-cover` | corrected | The full positive-height statement needs finitely many partial-boundary charts and uniform nondegenerating parameters. The added sorting dependency does not close those H.3/H.6 gaps. |
| `local-period-definability` | corrected | The local statement is buffered and retains interior parameters. Seam-inclusive logarithms and current H.3 holomorphic descent are now explicit dependencies; G1 still supplies the quotient atlas. |
| `global-period-definability` | corrected | A smooth connected quasi-projective base admits the requested finite buffered SNC cover. Current H.3 descent is linked; finite chart gluing and level descent remain explicit supplier obligations. |
| `special-hodge-image` | verified | All compatible rational Hodge-morphism images, including identity, are defined by their range. Definability, analyticity and strict exceptional indexing are separate assertions. |
| `special-image-definable` | verified | Erratum Corollary 1.3 applies to canonical Cartan-compatible Hodge morphisms. General fixed-K tame quotient theory remains G1. |
| `special-image-closed-analytic` | verified | Kernel/image factorization precedes the requested proper arithmetic immersion and analytic proper-image theorem. No inference from definability alone or properness of an arbitrary source morphism is made. |
| `tensor-hodge-locus` | corrected | The pure weight-zero guard agrees with native pieces and the Tate weight −2m. The zero vector is allowed; untwisted nonzero-weight vectors are excluded. Current H.3 tensor transport is linked. |
| `exceptional-hodge-locus` | verified | The universal-cover tensor union excludes generic invariants and uses monodromy saturation. Constant CM/Tate variations have empty exceptional locus in their own generic datum. |
| `local-tensor-locus-analytic` | corrected | A real rational weight-zero tensor is Hodge exactly when it lies in F⁰, giving a holomorphic quotient-section zero locus. Current H.3 orbit/flag plans are linked; the C0 analytic carrier stays requested. |
| `exceptional-special-preimage` | verified | Strict rational subdata are taken relative to the generic full-torus datum. The H.3 stabilizer/drop contract must be proved independently of H.7 algebraicity. |
| `rational-special-countability` | verified | Rational tensor constructions, rational subdata and arithmetic level choices give countable indexing. Noetherian finite component decomposition is used only in the algebraic Zariski topology. |
| `special-pullback-algebraic` | verified | One special pullback is definable and closed analytic, hence algebraic by the requested quasiprojective definable-Chow adapter. Reduced structure and complex-point comparison remain conclusion omissions in Lean. |
| `hodge-locus-algebraicity` | verified | Countable strict special pullbacks and finite irreducible decomposition give proper closed irreducible algebraic subvarieties. The whole union is not asserted closed or definable. |
| `compact-target-period-definability` | corrected | Compact target, compatible neat level and quasi-unipotence give trivial boundary monodromy; the H.6 extension into D and buffered compactification yield the stronger R_an statement conditionally. Corrected the proof step to use neatness rather than torsion-freeness for quasi-unipotent monodromy. |
| `ordered-sector-permutation-cover` | added | Promoted finite sorting lemma from the existing API; its proof handles tied heights and dimension zero, with no new supplier theory. |
| `sector-uniformization-half-open-surjective` | added | Promoted logarithm-surjectivity lemma from the existing API; argument zero and the strict radius/height relation are retained. |
| `hodge-adapted-flag-refines-filtration` | added | Promoted filtration-refinement lemma from the existing API; antitone labels identify the cardinality-defined initial segment, including endpoints. |

## Prerequisites, API and atlas choices

The local dependency graph is acyclic and all external references resolve to pinned declarations, current plans or named stage requests. Current H.3 is only a partial match for the four contracts; H.6 and LD.6 still have no exact nodes supplying the four requested contracts each. Read the actual AA.3 real-Siegel, Cartan/forward/inverse containment, reduced-form/basis-transfer and cocompact-no-unipotents statements, and the relevant ShimuraData D1/D3 statements. They do not supply generic fixed-K quotient atlases or the missing proper arithmetic immersion. C0's analytic infrastructure and C4's proper algebraic GAGA statements do not automatically give a noncompact proper analytic image theorem. R09.7d states SNC compactification and polydisc charts, but finite buffered chart gluing still needs its exact adapter.

G1 appropriately requests materializing the already routed ArithmeticQuotientDefinability extension of ArithmeticLocallySymmetricSpaces. It does not invent resolved node ids or identify general M⊂K with the symmetric case M=K. The C4 analytic-image extension is recorded as a rescope request. H.7 is a continuation of upstream fibrewise Hodge theory with unchanged part scope; generic reduction, o-minimal algebra, analytic images and resolution remain with their owners.

Each of the eight local definitions/constructions has an API and at least three tests. Tests cover empty coordinates, tied heights, seam/radius behavior, native versus BKT conjugation, zero-rank flags, identity/empty/point ranges, weight-zero/nonzero Tate tensors and generic-versus-exceptional unions. The empty special-image test is explicitly a test of the underlying range operation, not an assertion that an empty connected Hodge datum exists. All API/test names have corresponding signatures or labeled examples; promoted API facts share one Lean declaration each. The six planets are mathematical objects/results and remain within the cap: rough polynomiality, finite Siegel containment, period definability, Hodge locus, algebraicity of special pullbacks and algebraicity of Hodge loci.

## Every source issue checked

All verdicts are independently confirmed for the specified version and locator. Published correction searches are limited to the recorded versions and full official erratum; no fresh exhaustive arXiv/Crossref search is asserted. Classification and impact retain the existing programme catalogue conventions; the reason records distinguish a false literal statement from a routine intended repair or an unclosed proof step.

| Record | Locator | Verdict | Independent reason |
| --- | --- | --- | --- |
| EH7-01 | Theorem 4.1, JAMS p.928; reduction in §4.2, p.929; author pp.13–14 | confirmed | The Cayley-exponential example has infinitely many isolated fibre points approaching the outer circle; smaller buffered discs avoid this obstruction. |
| EH7-02 | Lemma 4.5 proof, JAMS p.930; author p.15 | confirmed | For c≥1 the substituted first real coordinate is outside the original strip. Width-dependent hypotheses are required before induction. |
| EH7-03 | §4.5, JAMS p.933; author p.18 | confirmed | Reversing a diagonal basis of diag(1,T) contradicts a uniform ordering constant. Sorting gives the finite-permutation repair. |
| EH7-04 | Theorem 1.1(1), JAMS p.919; Definition 2.5 and Proposition 2.7, p.924 | confirmed | Confirmed by the complete erratum, Theorem 1.2(1) and §1.6.1. |
| EH7-05 | Theorem 1.1(2), JAMS p.919 | confirmed | Confirmed by the complete erratum, Theorem 1.2(2), Corollary 1.3 and §1.6.2. |
| EH7-06 | §4.5, JAMS p.932; author p.17 | confirmed | Confirmed by erratum §1.5; the AA.3 rational pullback statement retains its forward-containment hypothesis. |
| EH7-07 | Theorem 1.5, JAMS p.921; also Theorem 1.5, p. 921, line after the display of H^n_{R,η}; same in author copy p. 5 | confirmed | Theorem 1.5 quantifies R and η; neither C nor the mismatched summation index is bound. |
| EH7-08 | §4.2 after Remark 4.3, JAMS p.929 | confirmed | The quotient-projection property is part (1); fixed K remains required by the erratum. |
| EH7-09 | Proof following Theorem 4.8, JAMS p.931 | confirmed | Lemma 4.7(1) states the diagonal assertion; Proposition 4.6 has no numbered part (1). |
| EH7-10 | §5, JAMS p.933 | confirmed | The published theorem has two parts. Erratum Corollary 1.3 is the appropriate Hodge-morphism input. |
| EH7-11 | §5, JAMS p.934, definability of Φ_S | confirmed | Theorem 1.3 supplies period definability; Theorem 1.1 supplies quotient geometry. |
| EH7-12 | Lemma 4.7(1),(2) and Theorem 4.8(1),(2), JAMS p.931 | confirmed | A zero squared norm has no positive monomial lower bound. The planned estimates explicitly require nonzero vectors. |
| EH7-13 | Lemma 4.7 proof, JAMS p.931, definition of B | confirmed | Alternating Q in odd weight makes B skew-Hermitian; multiplication by i^k restores Hermitian parity. |
| EH7-14 | Lemma 4.5 proof, JAMS p.930, finite difference F_m | confirmed | Degree one already gives the negative leading coefficient. The sign disappears in the required absolute-value estimates. |
| EH7-15 | §4.5, first sentence, p. 932 (𝔖^b_𝔥); Claim, p. 933 (H_ℚ) | confirmed | Rendered published pp.932–933 confirm the superscript and rational-space slips; the lattice issue is EH7-26. |
| EH7-16 | §1.3, p.920; §4.2, p.928; §4.4, p.931; §4.5 second paragraph, p.932 | confirmed | The central element −I of SL₂ acts nontrivially on its defining representation. H.7 requests the faithful derived-group adapter. |
| EH7-17 | §5, p. 934, lines 1–3 | confirmed | Identity is a Hodge morphism, so the literal union is the whole target. Strict images relative to the generic datum repair the exceptional union. |
| EH7-18 | §4.1, JAMS p. 928 | confirmed | Finite buffered SNC charts supply definability; keeping interior parameters or relative graph closure retains their centres. |
| EH7-19 | §4.3 Definition 4.4, pp.929–930; §4.4 correction lift and Theorem 4.8, p.931 | confirmed | H.3 negative-chart-local is only local; Kashiwara Theorems 3.4.1–3.4.2 require their specified neighborhood and height regime. |
| EH7-20 | §4.2, JAMS p. 929 | confirmed | The exponential of x+iy for 0<x<1 omits argument zero. A half-open strip includes it. |
| EH7-21 | Definition 4.4, JAMS pp. 929–930 (author p. 14) | confirmed | The displayed k∼1 counterexample gives two admissible printed fractions whose difference cannot have a monomial-size denominator. Polynomial denominators repair closure. |
| EH7-22 | Lemma 4.5 proof, JAMS p. 930 | confirmed | The expansion only binds j. Its normalization also carries the independent EH7-14 sign. |
| EH7-23 | §4.4 first paragraph, JAMS p. 930; author p. 15 | confirmed | Bilinearity would give an isotropic diagonal on noncentral Hodge pieces; formulas (4.2)–(4.4) instead use the conjugated pairing. |
| EH7-24 | Proof of Lemma 4.7(1), JAMS p.931; application to (2) through Lemma 4.10, pp.931–932 | confirmed | Kashiwara Definition 1.9.3, Corollary 1.9.2 and Theorems 3.4.1–3.4.2 supply splitting-independent comparisons. The H.6 exterior/parameter adapter stays requested. |
| EH7-25 | §4.4, JAMS p. 931 | confirmed | The rendered p.931 formula has n filtrations and the mismatched r index. |
| EH7-26 | Definition 4.11 (p. 932) and definition of T_{e,C} (p. 933), against the Claim (p. 933) | confirmed | Clearing denominators gives a finite-index sublattice, not necessarily the original lattice. Rational bases and commensurability suffice. |
| EH7-27 | Lemma 4.10 proof, p. 932, displayed transversality condition | confirmed | The chain rule contributes 2πi to the derivative term alone; at q_i=0 that term vanishes, preserving the argument actually used. |
| EH7-28 | Lemma 4.10 and its proof, p. 932 | confirmed | Bounding only the smallest height leaves other heights unbounded. The omitted remainder is not compact in several variables. |
| EH7-29 | Lemma 4.10 (p. 932), used to finish Lemma 4.7(2) (pp. 931–932) | confirmed | The estimate must cover nonzero graded vectors of the compatible I-splitting and its exterior powers, rather than only J-components. |
| EH7-30 | End of proof of Lemma 4.7, p. 932 | confirmed | Substitution of (4.3) into (4.4) yields the cleared denominator Δ_(j−1)Δ_j used in the packet and suggested determinant formula. |
| EH7-31 | §4.5, first paragraph, p. 932 (proof of Theorem 1.5, p. 921) | confirmed | All η>0 needs finite buffered partial-boundary charts with nondegenerating parameters and fixed-compact transport; that supplier uniformity is explicitly open. |
| EH7-32 | §5, p. 933, second sentence | confirmed | Image factorization and compatible finite-level changes are needed before the semisimple quotient presentation. Erratum Corollary 1.3 supplies definability directly. |
| EH7-33 | §4.5, Claim and proof of the Claim, p. 933 | confirmed | The six monomial norm exponents on (Y,Y) and (Y³,Y) force the first three fixed reduced basis vectors into an intersection of dimension two. Finite orderings preserve the theorem. |

## Validation and remaining obligations

`python3 scripts/check_blueprint.py research/blueprint/packets/HodgeStructuresPartII--H.7.json` reports zero errors and zero warnings. Its default declaration TSV is absent in this environment, so reference-form checks are supplemented by the independent exact-pin source reads above. A separate consistency check verifies all node/API/test names, all 31 per-node verdicts, all 33 source-issue verdicts, the acyclic local graph and the six-planet cap.

The full `lean-check` stops before checking any declarations because the shared build lacks the compiled `TauCeti.Geometry.Hodge.HodgeForm` import. Its Mathlib pin is exact, while its Tau Ceti checkout is newer than the packet pin. A freshly extracted Mathlib-only slice, excluding Forms, TensorLoci, GramFormula, RoughForms and localTensorLocus_analytic, elaborates with only the expected proof-placeholder warnings. No library build, cache retrieval or language server was run. The native Hodge-dependent signatures were inspected against pinned source; they are not claimed to have elaborated.

Deliverable intake validation reports five files and zero problems; `git diff --check` passes.

G1–G7 remain completion obligations. In particular the suggested closed-analytic and local tensor-analytic results only type closedness until the analytic carrier arrives; special-pullback and final locus prototypes omit reduced algebraic structures and complex-point transport, retaining the stated Zariski-set conclusions. The reader and packet keep the full mathematical conclusions. Arbitrary received sets/subrings/maps are documented omitted-interface data, not local definitions of those theories or arbitrary Prop placeholders. Final full pinned elaboration and exact supplier hypotheses/conclusions are required before implementation closure. These honest omissions do not invalidate this finished review pass under PROTOCOL §0.
