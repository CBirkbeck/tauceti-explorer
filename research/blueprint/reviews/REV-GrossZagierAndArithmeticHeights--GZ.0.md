# Independent review: Gross–Zagier formulas and arithmetic heights, GZ.0–GZ.7

Job `REV-GrossZagierAndArithmeticHeights--GZ.0`, issue #421. Reviewer: Codex, session `codex-iY9eXt`, 7 October 2026. The input was written by session `codex-6xAnoq`; this reviewer did not write that plan.

**Verdict: `needs_changes`. This is a completed independent review, not a checkpoint.** Clear corrections are applied to the packet and suggested file. Acceptance is withheld for publication/excerpt checks and packet/suggested-file correspondence, together with the specific supplier-contract refinements below. An `unverifiable` node can contain a mathematically sound outline and applied corrections: its verdict records an unmet review requirement, not an assertion that its theorem is false.

The packet remains a `complete` target-level planning pass. All eight stages remain `planned`, with no stage `closed`. Its 241 targets are present and their prerequisite routes end at a library input, a requested supplier or a recorded gap. Protocol §0 allows these precise gaps in a planned stage. The negative verdict is not a demand to finish every future implementation or to expand beyond the node budget.

## Counts and review coverage

| Item | Result |
| --- | --- |
| Nodes | 241: 25 definitions, 39 constructions, 2 lemmas, 7 comparisons, 168 theorems |
| Per-node decisions | 5 corrected, 2 verified, 234 unverifiable; 0 added |
| Node/source references | 279 inspected: 55 verified, 224 unverifiable as literal/publication evidence |
| Pinned baseline entries | 44 confirmed; 0 removed; 2 added |
| API and unit tests | 64 objects; 267 API items; 197 mathematical tests; each object has at least 3 |
| Planets | 33; per-stage counts 4, 2, 6, 5, 4, 3, 5, 4 |
| Requests and gaps | 65 requests, 9 gaps |
| Source mistakes | 86 entries: 85 confirmed, E47 rejected; E86 added |
| Suggested Lean omissions | 208 named signatures/tests removed or omitted with reasons |

The packet’s `review.checked` contains exactly one independent decision for every node. Each node/source reference also contains its own `independentReview` decision, at the actual locator. Every source mistake has a `review` verdict by this job. These ledgers are part of the deliverable; inherited extraction verdicts and `sourceInspection` entries without this reviewer’s `by` field are not independent certifications by this session.

The full packet, all 64 API/test outlines, the suggested file, all 85 inherited source mistakes, the five specified red-team findings and their accepted verifier records were inspected. The audit for GZ.0–GZ.9 in `data/library-coverage.json` was read. The nearby upstream Jacobian and StableReduction documents were read as scope references; neither was edited or replanned.

## Corrections applied

1. x-height: distinguish absolute and relative normalizations; qualify torsion converse by Northcott; cite the two pinned height statements.
2. BSD pairing: remove the reversed dependency/request on its BSD.5 consumer; qualify the positive-height non-example.
3. BSD regulator: retain the 2^r identity, but require nonzero regulator for strict inequality.
4. Rational height: qualify the nonlinear non-example by Northcott.
5. Elliptic Poincaré comparison: correct the Pic⁰ sign for pullback by translation x↦x+P; distinguish it from the Abel–Jacobi identification.
6. Twist period: disambiguate the identity-component periods from the full BSD period.
7. `GrossZagierAndArithmeticHeights:GZ.6/classical-absolute-convergence`: Qualified the convergence bound by weight: Re(s)>k+1/2, specializing to Re(s)>3/2 at k=1. Distinguished the derived general extension from the explicit weight-two source statement and requested the missing coefficient/convergence estimates.
8. `GrossZagierAndArithmeticHeights:GZ.7/classical-cm-genus-orbits`: Corrected the proof’s count: the relevant fibre is a fibre of squaring, of size #Cl(K)[2], rather than a genus-quotient fibre.
9. `GrossZagierAndArithmeticHeights:GZ.6/classical-coefficient-functional-equation`: Corrected the reflection parameter in the proof sketch to 2−2k−s, agreeing with (4.1) and the node statement.
10. `GrossZagierAndArithmeticHeights:GZ.7/colmez-vertical-pseudo`: Removed the obsolete equivariant-lift gap: the corrected node already uses the direct t₁,t₂-dependent kernel from p. 623 and does not invoke the invalid component-invariance argument.
11. `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sigma-identity`: Used |n| in the proof sketch’s ideal norm count, agreeing with the statement and the negative-index source branch.
12. `GrossZagierAndArithmeticHeights:GZ.7/classical-norm-one-generators`: Removed the unsupported converse from numerical norm solutions alone; retained the defining quaternionic lattice and congruences.
13. `GrossZagierAndArithmeticHeights:GZ.7/classical-new-hom-intersection`: Restricted the coarse tangent/new-Hom self-intersection identification to u=1 and distinguished Conrad’s modified all-stabilizer pairing.
14. `GrossZagierAndArithmeticHeights:GZ.7/colmez-norm-shells`: Removed the unrelated RP.2 norm-density request and consolidated it into the existing AL.1 local quadratic-density request.
15. `GrossZagierAndArithmeticHeights:GZ.6/classical-genus-sign-function`: Replaced the vacuous n=±1 example by the explicit n=±3 sign-sensitive divisor values. The proposed extra hypothesis on multiplicativity was withdrawn after the discriminant-factor calculation.
16. `GrossZagierAndArithmeticHeights:GZ.3/manin-integrality-and-p-unit`: Replaced FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4 with the exact existing supplier node FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-uniqueness; removed the obsolete broad request. A planned supplier node is not a claim of implemented proof.
17. `GrossZagierAndArithmeticHeights:GZ.5/half-weight-waldspurger-value`: Replaced AutomorphicSpectralTheory:AS.1 with the exact existing supplier node AutomorphicFormsOnReductiveGroups:AF.3/maass-cusp-forms; removed the obsolete broad request. A planned supplier node is not a claim of implemented proof.
18. `GrossZagierAndArithmeticHeights:GZ.6/classical-disjointness,GrossZagierAndArithmeticHeights:GZ.0/classical-cm-action-conventions,GrossZagierAndArithmeticHeights:GZ.7/classical-cm-kernel-invariants,GrossZagierAndArithmeticHeights:GZ.7/classical-cm-genus-orbits,GrossZagierAndArithmeticHeights:GZ.2/classical-archimedean-height-sum,GrossZagierAndArithmeticHeights:GZ.7/classical-cm-eisenstein-sum,GrossZagierAndArithmeticHeights:GZ.7/classical-finite-intersection-height,GrossZagierAndArithmeticHeights:GZ.5/classical-definite-period-announcement`: Routed the actual CM-point/Hecke construction to HE.1; HE.0 remains only an order/class-field/reciprocity supplier. The Hodge-only dependence of HE.1 on GZ.3 needs finer contracts to avoid a stage cycle.
19. `GrossZagierAndArithmeticHeights:GZ.4/normalized-toric-integral`: Made the simultaneous unitarizability of the pair explicit, matching the CST absolute-convergence hypothesis.
20. `GrossZagierAndArithmeticHeights:GZ.3/manin-constant`: Qualified the multiplication test by n≠0, keeping the modular parametrization nonconstant.
21. `11 test metadata entries`: Normalized value/comparison/extensionality test kinds to computation/compatibility/characterisation, as required by Protocol §12.
22. `GrossZagierAndArithmeticHeights:GZ.7/cm-tensor-stabilizer-height`: Corrected the published Conrad locator from pp.105–107 to pp.123–126; author-copy pagination remains separate.
23. `sourceCoverage entries 18 and 33`: Synchronized HE.1 construction ownership and marked the BSD prediction as an out-of-scope consumer, following the prerequisite corrections.
24. `GZ.1/coefficient-valued-height, GZ.3/composition-pairing, GZ.2/arithmetic-intersection-gluing`: Added the missing additive coefficient/composition interfaces and symmetric arithmetic-intersection interface, with honest generic algebraic Lean prototypes and the required trace/symmetry hypotheses.
25. `GZ.0/artin-map-convention`: added HE.0 and HE.1 as direct prerequisites and synchronized their requests. A generic homomorphism inversion identity does not construct the asserted CM-point action.
26. Replaced the unrelated GZ excerpts for `heegner-unit-index` and `manin-constant` by short literal passages at published I §6 p.230 and V §2 p.310. The remaining OCR/publication-reference limitations are explicitly marked rather than silently certified.
27. Added the independent 241-node and 279-reference ledgers, two gaps for literal excerpts/publication versions and suggested-file correspondence, the EPFL/Edixhoven public source versions, and the completed negative review status. All original nodes and their full mathematical hypotheses remain planned.

Thirty-three existing nodes have a mathematical field, dependency, source passage or test-metadata correction. No mathematical node was added or deleted. The 208 suggested-file removals are signature/test corrections, not deletions of the mathematical targets. Each removed name and reason is preserved in the inventory below and in omission comments in the suggested file.

The proposed extra restriction on genus-sign multiplicativity was withdrawn after checking the discriminant factors: for coprime divisor factors the cross characters occur twice and cancel. It is not a source error or a revision requirement. The n=±1 test was nevertheless vacuous; n=±3 is the sign-sensitive replacement. The conjectured error that the trace-zero quaternion space was being used as a quaternary space was also not sustained; no such error is reported.

## Primary sources and version limits

Public versions are linked in the packet’s `sources` and `sourceVersions`, with byte hashes for the acquired PDFs. Important distinctions:

- [Gross–Zagier, published Inventiones copy](https://wiki.epfl.ch/waldspurger/documents/gross-zagier.pdf): printed pp.225–320, Chapters I–V, read throughout. Formula images were inspected at pp.229, 250–251, 263, 284, 298, 300–302 and 312–313. SHA-256 `8afee839cdc0e2056c6dcbe348e39c0a6aa27344125d8c3b80dd735f2e6d9521`. The separately reacquired W. Stein scan is recorded too. Literal excerpts inherited from the GDZ OCR are often headers or unrelated clipped paragraphs; the primary argument being read does not repair those fields automatically.
- [Yuan–Zhang, published Annals 187 (2018)](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf): §§6–9, pp.578–638, and the relevant introduction hypotheses were checked. The complete earlier Chapters 2–5 were not independently read in this review. Page-opening clips reused for different results are not certified as the required literal excerpts.
- [Conrad, published SLMath copy](https://library.slmath.org/books/Book49/files/05conrad.pdf) and [author final copy](https://math.stanford.edu/~conrad/papers/gzfinal.pdf): author §§8–10, particularly pp.35–48, were checked for the tensor/stabilizer correction and modified self-pairing. Published Theorem 9.2 is on pp.123–125, with Definition 9.5 on pp.126–127; these are not author pp.38–40. The completed proof supports the plus sign in the coordinate-substitution identity. It does not permit dropping the tensor leading coefficient at elliptic or level points.
- [Yuan’s arithmetic bigness manuscript](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf): the acquired document is dated 21 August 2024. All of Appendix A.1–A.6, pp.102–119, was read. Its SHA-256 is `b36f4860cc0f098ef062523e8a5147e8172d1e4e357fc76a63cd7c0d782a813e`. It is not independently certified as the 2026 Annals version. Dividing the canonical-bundle formula by 2g−2 proves the resistance measure only for g>1; a separate genus-one argument is explicitly required.
- [The YZZ author erratum](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/erratum-GZSC.pdf) was reacquired and its corrections checked. The exact 2013 published book was not reacquired and its inherited hash is not independently verified. A public 266-page author preprint dated 6 November 2011, hosted on [ResearchGate](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail), was readable through the browser. Its §§7.1.1–7.1.4 support the relative field weighting, full polarization and negative flat-divisor intersection convention. It has different pagination and cannot certify the published locators. The direct download was unavailable; no hash is asserted for it. The general realization, modularity and bad-place proofs in the published book remain a source gate.
- [Edixhoven, published AIF 40 (1990)](https://www.numdam.org/item/10.5802/aif.1202.pdf), §§1.1.1–1.1.3, pp.34–35, supplies the nonalgebraicity caveat for the naive stack and the ordinary elliptic-point singularities for p>3. Its SHA-256 is `cff6a257adcae5ca95a9859ec7a0319a363718bac3a40fe8afe146e59da5926a`. The p>3 classification is not a certificate for characteristics 2 and 3.
- Müller–Stoll arXiv v2, the LMFDB 37.a1 record and height/real-period knowls, CST arXiv v2 §3.1 and the indicated global formulas, Česnavičius–Neururer–Saha’s 3 November 2022 text (introduction and Lemma 6.5), Jetchev’s introduction, DIT’s published Theorem 4/(5.17), and Gan–Qiu–Takeda’s stated input ranges were checked at the versions recorded in the packet. Their full cited proofs are not all claimed read. In particular the DIT/Baruch–Mao dyadic normalization gate remains explicit.
- The January and December 2022 author Colmez errata were inspected as separate versions. The 2023 published erratum was not reacquired. Its existence is not a license to attribute all later corrections to that publication.

The 224 unresolved source-reference verdicts concern the actual excerpt/version fields. They include sound formulas whose reference is a header or an incomplete adjacent result. Revision should replace these excerpts from the version actually read, and recheck hypotheses at that locator. Do not interpret the count as 224 disproofs of mathematics.

## Source-mistake decisions

All inherited E1–E85 entries were revisited at their locators and given this job’s independent `confirmed` or `rejected` verdict and reason. E86 is the only newly added finding. The complete individual reasoning is in `sourceIssues`; the following points explain the decisions that need particular care.

- **E47 rejected:** the printed sufficient convergence range Re(s)>2 is valid. Showing that Re(s)>0 also suffices does not make the printed assertion a misprint. This is the sole rejected finding.
- **E12 confirmed as a gap:** an O(1) remainder need not have a limit. The stronger o(1) behavior is the missing justification, rather than a contradiction to the printed bounded-remainder statement.
- **E50 qualified:** ordinary elliptic points can be singular on the coarse model, with the checked classification at p>3. No blanket dyadic or characteristic-three classification is inferred.
- **E65:** the printed component-invariance argument is false. The amended `colmez-vertical-pseudo` node uses the direct t1,t2-dependent kernel and avoids that reindexing. The obsolete gap asking for the already bypassed invariance assertion was removed; the source finding remains confirmed.
- **E70/E78:** independent computations distinguish the shifted norm-shell variable from the old q-powers. For the S2 examples the resulting c-terms are c(psi1)=0 and c(psi2)=2 log q; the ordinary term is −1/(1+q+q²) in the recorded standard case, giving −1/7, −1/13 and −1/31 at q=2,3,5. The discrepancy at q=2 is not the same as the odd-prime shortcut. Finite residue computations for q=2,3,5 and k=1,2,3 checked the shell counts used in the reasoning.
- **E60/E72:** (1+i)^4=(1−i)^4=−4 is a genuine signed collision. Distinct positive parameters have distinct absolute values; the Vandermonde repair uses positive sufficiently divisible parameters.
- **E69:** containment of units in the relevant dyadic suborder does not imply containment of the whole integer ring. The gap is at that implication.
- **E71:** the finite Weil action introduces the complementary discriminant character. The unweighted positive-codimension identity requires common complementary character; the actual quaternionic square-discriminant cases retain the intended application.
- **E66/E82:** the finite adjunction argument must distinguish an étale lifted section from the ramification index of the downstairs CM point. The inverse map/lattice direction cannot be inferred merely from effectiveness of the divisor.
- **E39:** the negative-index divisor sum uses the sign-dependent branch. The checked small case has positive sum 0 and negative sum 2; a replacement that suppresses this distinction misses the source error.
- **E55–E57:** inspected printed images confirm the absolute discriminant in the period relation, the V_s(ny) argument, and the missing theta argument in the cusp computation.
- **E86 added and confirmed:** published GZ V §2 p.313 omits evaluation at 1 and the Leibniz factorial in the ordinary m-th derivative of the product. The corrected statement is L^(m)(A,1)=m! times the product of L-prime(f_alpha,1). For m=2, differentiating (s−1)² gives 2 rather than the product 1. The rational-multiple BSD conclusion is unaffected. The published convention was checked against p.231. Searches on 7 October 2026 inspected [Zagier’s publication page](https://people.mpim-bonn.mpg.de/zagier/), [Conrad’s publication list](https://math.stanford.edu/~conrad/) and his final copy; no correction specifically to this display was found in those materials. This is a limited search result, not a universal claim that no correction exists.

## Baseline, closure and ownership

Every one of the original 42 baseline heads was opened at the exact cited commit, and its statement/hypotheses were read. The two additional height statements were checked the same way. Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Names/modules all exist. No baseline entry was removed. Each packet entry’s `checked` field states this reviewer’s check and limits its role to the actual input. A general Filter/Matrix/Measure/QuadraticMap declaration does not supply a spectral kernel, geometric line bundle or CM model. Those identifications remain nodes, supplier requests or gaps.

The two added citations are `Point.canonicalHeight_nonneg` and `Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder`. The latter requires Northcott finiteness. The important convention checks are the half x-height limit, half polarization, Gram determinant scaling, number-field total weight [K:ℚ], and the finite-module/basis hypotheses. `MeasureTheory.lintegral` is an integration primitive, not an elliptic-period theorem. The generated additive descent name is justified by the pinned to_additive source; no duplicate descent theorem is planned.

The internal prerequisite graph is acyclic, all targets resolve, and every external stage dependency has a request. Cross-roadmap statements were read at the stage level and the finer named supplier nodes where used. Exact checked interfaces include AF.2’s adelic/classical bijection and Flath factorization, AF.3’s Maass cusp forms, AF.5’s GL2 passage, AS.2’s automorphic Green kernel, R07.1’s Raynaud uniqueness, and A6’s endomorphism/Hom/trace/degree statements. These planned interfaces are not formalized Lean proofs.

The requests are generally mathematically precise; several stage addresses do not supply the requested theorem. Each such request now has a `reviewNote`, and the gap lists the affected consumers. In particular R14.6 bad-prime patching does not supply an arithmetic Hodge line; R14.4 Ihara/level change does not prove Picard modularity; R07.5 Serre weights do not give CM deformation lengths; AF.1 globalization does not provide all adelic density/growth interfaces; AS.2 intertwining does not construct the GL2 Iwasawa carrier; R16.1 global function spaces do not provide local Jacquet–Langlands or connecting Eichler ideals; ET.6 transfer does not state Tunnell–Saito distinction; R14.2’s Jacobian/Hecke target does not alone construct every integral level model/tensor. Resolve finer owner contracts without replanning another roadmap.

The HE.0/HE.1 distinction is corrected: orders/class fields and actual points/Hecke correspondences are different suppliers. HE.1’s dependence on GZ.3 is a Hodge-class interface; use that finer contract to avoid turning the two stage labels into a coarse cycle. The audited height adapters do not duplicate the existing canonical-height implementation. General heights remain RP.0/RP.1 and arithmetic metrics remain their appropriate supplier interfaces.

## Handed red-team findings and planets

| Finding | Independent result |
| --- | --- |
| RT-AREA-automorphic-1/19 | The coherent Siegel–Weil input is imported from MP.6; GZ.5 owns the toric/Waldspurger comparison. No request feeds the GZ formula back as the proof of its own supplier. Normalization/proof-source gates remain explicit. |
| RT-AREA-iwasawa-1/3 | GZ.1 specifies the pairing/normalization adapter; RP.0/RP.1 own the general height machine. It does not rebuild general heights. |
| RT-AREA-iwasawa-1/12 | The factor-two height/polarization convention is checked against pinned code; Northcott and relative field weighting were corrected in this review. |
| RT-AREA-iwasawa-1/17 | BSD consumers use the GZ pairing/formula. The reversed BSD.5 prerequisite on the pairing was removed. Other BSD or Iwasawa branches are not replanned. |
| RT-AREA-algebraicgeometry/26 | StableReduction remains upstream. GZ.2 owns the admissible metric/Green adapter and imports semistable models rather than reconstructing the upstream layers. The explicit graph measure and genus-one proof gate remain local mathematical needs. |

The reader’s introduction and all five finding treatments were checked against these boundaries. It still needs synchronization with this review’s corrected dependencies, elliptic sign, period/regulator qualifications and source ledgers. The reader document is not an authorized deliverable of issue #421, so it was not edited. Revision/assembly must include it explicitly.

All 33 planet names were inspected: they name central objects or theorems, with at most six per stage. The target-level granularity is retained. No lemma-level expansion is requested as a condition of acceptance.

## API and test assessment

Every definition/construction has a constructor and a usable mathematical API outline with the appropriate compatibility/structure/transport properties. The intended tests generally attack a concrete normalization or construction error. Their count alone is not sufficient: the suggested examples often substitute generic scalar algebra for those actual object tests. The following per-object assessment records the intended mutant and the remaining correspondence problem. The mathematical outlines stay in the packet; no fabricated geometric constructor is asserted.

| Object | Independent API/test assessment |
| --- | --- |
| `GZ.0/x-height-canonical-height` | Tests distinguish the missing factor 2, torsion, doubling and the pinned diagonal pairing; the infinite-order test now assumes Northcott. |
| `GZ.0/bsd-height-pairing` | The diagonal and doubling tests distinguish full from half polarization; the torsion test checks descent. BSD.5 is a consumer. |
| `GZ.0/bsd-regulator` | Rank zero, rank one, basis determinant and positive-rank scaling detect omission of 2^r; strict inequality now requires a nonzero regulator. |
| `GZ.0/canonical-height-rational` | Tensor uniqueness and q² scaling detect a linear extension and an average/trace confusion; positivity in the non-example now has Northcott. |
| `GZ.0/heegner-unit-index` | Gaussian and Eisenstein fields detect missing division by ±1; the general construction must be used with the imaginary-quadratic hypothesis. |
| `GZ.1/neron-tate-height-and-the-poincare-pairing` | Additivity, adjunction and full polarization detect the half-polar convention; the generic cross-effect prototype omits the actual dual variety and biextension. |
| `GZ.1/coefficient-valued-height` | Trace recovery and the quadratic-field trace of 1 detect confusing M-linearity with an unnormalized scalar trace; the geometric coefficient field is absent. |
| `GZ.1/character-height-pairing` | Projector, inverse-character and trace/average tests distinguish opposite eigenspaces and h² scaling; actual Galois eigenspaces are omitted. |
| `GZ.2/arithmetic-intersection-gluing` | Principal and vertical cases and the doubled-complex-place non-example test signs and place weights; generic bilinear maps do not provide arithmetic gluing. |
| `GZ.2/admissible-arithmetic-extension` | Curvature, vertical orthogonality and degree-zero specialization are meaningful tests; the former generic constructor could not impose these normalizations. |
| `GZ.3/normalised-hodge-class-and-xi-parametrised-realisation` | Degree-one and projection tests distinguish unnormalized Hodge classes; scalar division alone omits the logarithmic line and orbifold factors. |
| `GZ.3/rational-xi-realization` | Level transition, zero class and xi-vanishing test the colimit and base point; a generic direct limit omits actual Hom(J_U,A) and the automorphic actions. |
| `GZ.3/composition-pairing` | Level volume, endomorphism and elliptic degree tests catch omission of the volume divisor; bare linear composition lacks the dual isogeny and M-valued identification. |
| `GZ.3/manin-constant` | Pullback, multiplication and the 11a3 value 5 detect c=1 imposed universally; multiplication must be nonzero to remain a parametrization. |
| `GZ.4/toric-hom-space` | Central-character obstruction, zero vector and transport catch the wrong character inverse; generic continuous duals omit the local representation category. |
| `GZ.4/normalized-toric-integral` | Spherical, zero-vector and doubled-measure cases test the bilinear numerator and Haar normalization; the zero-Hom prototype assumes zero integrals instead of proving Hom factorization. |
| `GZ.4/admissible-toric-order` | Intersection, discriminant and conductor-mismatch cases test the order and orientation; freely supplied disc/O functions do not encode actual local conductor data. |
| `GZ.6/special-correspondence-cycle` | Identity, projection and finite-cover multiplicity tests distinguish push-forward from image; generic divisor actions omit the cycle scheme. |
| `GZ.6/cm-degree-zero-class` | Degree zero, component dependence and transport detect subtraction of a single global xi instead of the component class; the CM carrier is missing. |
| `GZ.6/picard-generating-series` | Identity coefficient, multiplicity and w_U tests catch missing stabilizer weights; actual Picard modularity is not supplied by R14.4. |
| `GZ.6/arithmetic-height-kernel` | Bilinearity, inverse characters and trace/average scaling detect wrong height normalization; generic linear maps omit the geometric cycles and rational height. |
| `GZ.7/degenerate-schwartz-classes` | The orbit-zero test distinguishes S² from vanishing at (0,u) alone; S¹ support is a separate condition and Chapter 5 remains a primary-source gate. |
| `GZ.2/arakelov-probability-form` | Genus-one and genus-two mass tests detect omission of 1/g; averaging arbitrary measures omits orthonormal differentials and unitary basis invariance. |
| `GZ.2/archimedean-admissible-metric` | Tensor, constant-rescaling and degree-zero cases detect replacing deg(L)μ by μ; arbitrary curvature functions omit smooth hermitian norms. |
| `GZ.2/admissible-green-function` | Degree-zero, degree-two mass and metric comparison detect missing deg(D) and squared-log conventions; actual logarithmic currents are omitted. |
| `GZ.2/normalized-arakelov-green` | Mean zero, symmetry and the residue test are meaningful; a free ddc cannot guarantee solvability, so the arbitrary-operator constructor was removed. |
| `GZ.2/arakelov-dualizing-metric` | Residue and genus-one/genus-two curvature cases distinguish canonical normalizations; an arbitrary residue map does not give those curvature values. |
| `GZ.2/graph-admissible-measure` | Vertex mass, loop and bridge tests detect missing genus weights or the resistance denominator; graph Green solvability needs a connected metric graph. |
| `GZ.2/real-admissible-descent` | Conjugate norms, real residue and unequal-norm obstruction test real descent; quotient functions and norm(1)=1 do not yet express the actual metric tests. |
| `GZ.6/colmez-pseudo-theta` | Inner/outer and unit-invariance tests distinguish the ambient Weil action from the subspace action; a bare double sum omits quadratic spaces and Schwartz support. |
| `GZ.6/mixed-theta-eisenstein` | Tensor factorization, central vanishing and unit invariance catch the coherent/incoherent mix-up; generic theta times Eisenstein lacks the global Weil datum. |
| `GZ.6/colmez-whittaker` | Zero-index and incoherent-index tests detect the L-factor distinction and product of Weil indices −1; generic scalar normalization omits standard local functions. |
| `GZ.6/colmez-torus-average` | Constant, singleton and three-element cases catch using trace instead of probability average; the finite quotient still needs its CM realization. |
| `GZ.6/colmez-local-k-c` | Pure tensor and standard unramified cases detect a missing derivative correction; the generic pair of derivatives omits the nearby quaternionic kernel. |
| `GZ.7/colmez-test-function` | Boundary valuation cases test the cutoff, including dyadic ramification; actual extended-Weil support is missing from the prototype. |
| `GZ.7/colmez-norm-shells` | Shell examples distinguish signed norm classes and the ramified cutoff; the RP.2 request was replaced by local quadratic density in AL.1. |
| `GZ.7/colmez-omega-self` | Diagonal and projection tests distinguish the self coefficient from disjoint terms; actual CM multiplicity and residue data are absent. |
| `GZ.7/colmez-arch-green` | Finite-part and logarithmic-singularity cases test the kernel and diagonal; scalar placeholders omitted from the final suggested file. |
| `GZ.7/colmez-finite-multiplicity` | Ordinary/supersingular and residue-prime cases detect wrong local lengths and weights; actual deformation rings are needed. |
| `GZ.2/colmez-residue-line` | Coordinate units and the degree-one lattice test catch reversing the residue image inclusion; generic image submodules omit the arithmetic norm and degree. |
| `GZ.7/colmez-s2-assumption` | Orbit-zero and two-split-place tests catch weakening Assumption 7.1; the arithmetic choice of nonzero Schwartz data remains missing. |
| `GZ.7/colmez-rev-archimedean-derivative-kernel` | Projected logarithmic and diagonal cases detect omission of the finite part; arbitrary scalar Green values were removed. |
| `GZ.6/classical-partial-rankin-series` | Character inversion, removed Euler factors and the finite Fourier case catch the all-factor L-function and incorrect averaging; coefficient growth is a separate request. |
| `GZ.2/classical-complex-height-symbol` | Principal divisors, symmetry and marked cusps catch the sign and missing cusp normalization; an arbitrary green equality is not uniqueness from principal laws. |
| `GZ.7/classical-resolvent-kernel` | Residue, cusp and stabilizer cases detect the −2 Legendre normalization; arbitrary kernels cannot supply spectral continuation. |
| `GZ.7/classical-marked-green-kernel` | Puncture and cusp cases detect forgetting the four-term marking correction; actual cusp limits are omitted. |
| `GZ.7/classical-hecke-green-kernel` | Identity and Hecke degree tests detect omission of the cusp correction; free scalar kernel relations were removed. |
| `GZ.7/classical-cm-kernel-invariants` | Atkin–Lehner and Galois transport test invariant (n,A) labels; actual CM points are requested from HE.1. |
| `GZ.2/classical-archimedean-height-sum` | Orbit and conjugation cases detect division by the wrong class number; relative archimedean weights must be retained. |
| `GZ.7/classical-tangent-symbol` | Unit-coordinate and scaling tests detect using a tangent rather than its specified cotangent normalization; the actual local tensor carrier is omitted. |
| `GZ.7/classical-eta-tangent` | Eta and unit-change tests detect the sixth-power normalization; T*T⁻¹=1 in the suggested file does not establish the geometric dual vector. |
| `GZ.7/classical-diagonal-green-kernel` | Stabilizer and self-limit cases detect forgetting elliptic multiplicities; diagonal finite-part geometry is absent. |
| `GZ.7/classical-inert-order-model` | Order discriminant and parity cases detect the wrong quaternion lattice; bare norm equations omit the congruence-defined order. |
| `GZ.7/classical-half-hom-count` | Zero, scalar and paired-sign cases detect missing quotient by ±1; genuine finite Hom sets are required. |
| `GZ.7/classical-new-hom-set` | Lift and b-minus cases distinguish Hom-new from all Hom or b-plus≠0; exact quaternionic lattice membership is required. |
| `GZ.7/classical-self-intersection-tangent` | Parameter scaling and principal compatibility detect omission of the cotangent symbol; all-stabilizer corrections cannot be dropped. |
| `GZ.2/classical-p-height-sum` | Vanishing and residue-log cases detect wrong relative-place normalization; actual intersection lengths remain missing. |
| `GZ.7/classical-inert-hom-lattice` | Norm and connecting-ideal cases detect reversal of the CM ideal correspondence; R16.1 does not state this local lattice theorem. |
| `GZ.7/classical-inert-norm-ideal-map` | Unit multiplicity and norm cases detect a missing \|D\| or reversed ideal; changed test metadata only, without changing the source map. |
| `GZ.7/classical-ramified-order-model` | Conductor and residue-parity cases detect the wrong ramified order; genuine local embeddings are required. |
| `GZ.6/classical-rankin-kernel` | Trace, level and Fourier tests are mathematical tests, but the old signatures used unrelated free coefficients and an empty level predicate. |
| `GZ.6/classical-eisenstein-combination` | Identity, prime and genus sums detect omission of discriminant factors; generic finite sums omit the modular transformation carrier. |
| `GZ.6/classical-genus-sign-function` | The n=±3 example detects sign dependence (positive sum 0, negative sum 2); ±1 was vacuous. Multiplicativity does not need the withdrawn extra restriction. |
| `GZ.6/classical-signed-divisor-sums` | Positive/negative and prime-support cases distinguish σ from σ-prime; freely supplied contribution functions do not encode the source divisor sums. |

## Lean validation and remaining correspondence work

Full `lean-check research/blueprint/suggested/GrossZagierAndArithmeticHeights--GZ.0.lean` did not elaborate: the shared build lacks the compiled `TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight` module. Its Mathlib source/build pin matches the required Mathlib commit, while the available Tau Ceti build is not a usable compiled baseline at the required Tau Ceti pin. Exact pinned Tau Ceti source statements were inspected independently. No build, cache download, Lake update or language server was started.

As a diagnostic only, the Tau Ceti imports and the dependent elliptic/heightConventions sections were temporarily excluded from the same suggested file, checked with `lean-check`, and restored. The final Mathlib-only diagnostic exited 0 with 408 `sorry` warnings and no errors or other warnings. This establishes syntax/elaboration for that subset; it does not establish full-file elaboration, any theorem truth, or agreement with the geometric packet. Available memory was checked before each sequential compilation; no compiler was left running.

The original file contained false universal scalar signatures: for example freely quantified fullPeriod/identityPeriod could give 1=0, arbitrary ddc could demand a Green solution with zero operator and nonzero right side, and the same arbitrary curvature map could be forced to both genus-one and genus-two values. Other signatures were true tautologies unrelated to the claimed theorem. These were removed. Remaining algebraic sketches are explicitly qualified. Examples such as T*T⁻¹=1, norm(1)=1 or 2*x≠x still do not instantiate eta tangent duality, real metric descent or a geometric normalization test. They must be replaced by actual carrier/API/test signatures when the suppliers are available.

## Suggested-signature omission inventory

All 208 names removed/omitted in this review are preserved here. This inventory is required for the next revision; scratch files are not needed to recover it. Grouping several names in a row does not merge their mathematical packet nodes.

| Node | Omitted names | Reason |
| --- | --- | --- |
| `GZ.2/admissible-arithmetic-extension` | `admissibleExtension`, `admissibleExtension_characterization`, `admissibleExtension_add`, `admissibleExtension_pullback`, `admissibleExtension_degreeZero`, `test:admissibleExtension_zero`, `test:admissibleExtension_xi`, `test:admissibleExtension_disconnected` | The constructor only depends on generic restriction and cannot encode the chosen curvature, vertical and Hodge normalizations. |
| `GZ.2/normalized-arakelov-green` | `arakelovGreen`, `arakelovGreen_symm`, `arakelovGreen_mean`, `arakelovGreen_diagonal_metric`, `test:arakelovGreen_constant_shift`, `test:arakelovGreen_degree_zero`, `test:arakelovGreen_local_singularity` | An arbitrary linear ddc operator need not solve the Green equation; compact-curve Green solvability and logarithmic currents are missing. |
| `GZ.0/real-period-components` | `realPeriod_eq_card_components_mul` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.2/arakelov-dualizing-metric` | `arakelovDualizingMetric_curvature`, `arakelovDualizingMetric_diagonal`, `test:arakelovDualizingMetric_genus_one`, `test:arakelovDualizingMetric_genus_two` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.2/graph-admissible-measure` | `graphAdmissibleGreen_laplacian`, `graphAdmissibleGreen_canonical` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.2/colmez-residue-line` | `residueAdjunctionLine_degree` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/colmez-whittaker` | `normalizedWhittaker_zero_value`, `test:normalizedWhittaker_standard_zero` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-test-function` | `colmezTestFunction_biinvariant`, `colmezTestFunction_auxiliary_degenerate` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-rev-archimedean-derivative-kernel` | `archDerivativeKernel_torus_average` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-arch-green` | `regularizedCmGreen_distinct_points` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-resolvent-kernel` | `classicalResolvent_invariant`, `classicalResolvent_laplacian`, `classicalResolvent_converges` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-marked-green-kernel` | `markedModularGreen_cusp_zero`, `markedModularGreen_singularities`, `markedModularGreen_fricke` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-hecke-green-kernel` | `heckeGreen_hecke`, `heckeGreen_fricke` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.2/classical-complex-height-symbol` | `classicalComplexHeight_principal` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-tangent-symbol` | `cmTangentHeight_global` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-inert-order-model` | `inertOrderModel_norm`, `inertOrderModel_discriminant` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-inert-norm-ideal-map` | `inertNormIdeals_classes`, `inertNormIdeals_norm`, `inertNormIdeals_valuation`, `test:inertNormIdeals_nonzero` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.1/elliptic-poincare-comparison` | `elliptic_poincare_comparison` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.2/hodge-index-theorem-and-admissible-arithmetic-extensions` | `faltingsHriljac` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.3/strict-gl2-realization` | `strictGL2_realization` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.3/petersson-composition-comparison` | `petersson_composition_comparison` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.3/manin-integrality-and-p-unit` | `maninConstant_integral_p_unit` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.3/manin-degree-divisibility` | `maninConstant_dvd_modularDegree` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.4/saito-tunnell-dichotomy-and-the-local-toric-functional` | `saitoTunnell` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.4/unramified-toric-value` | `normalizedToricForm_unramified` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.5/coherent-quaternionic-specialization` | `coherentQuaternionicTheta` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof` | `waldspurger` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.5/toric-period-nonvanishing` | `toricPeriod_nonzero_iff` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/arithmetic-theta-lifting` | `arithmeticThetaLift_comparison` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/generating-series-arithmetic-theta-lifting-and-the-kernel-identity` | `arithmeticKernel_projected_identity` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/good-local-arithmetic-identity` | `goodLocal_arithmetic_identity` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/nearby-coherent-orthogonality` | `nearbyCoherent_orthogonal` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/degenerate-schwartz-functions-local-decomposition-and-approximation` | `nearbyQuaternionic_approximation` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.2/admissible-metric-existence` | `admissibleMetric_exists_unique` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.2/explicit-skeleton-measure` | `graphAdmissibleMeasure_resistance_formula` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/colmez-pseudo-comparison` | `colmez_pseudo_comparison` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/colmez-pseudo-automorphic` | `colmez_pseudo_automorphic` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/colmez-pseudo-weight-cancel` | `colmez_pseudo_weight_cancel` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/colmez-projected-derivative` | `colmez_projected_derivative` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-order-sandwich` | `colmez_order_sandwich` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-shell-inert` | `colmez_shell_inert` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-shell-ramified` | `colmez_shell_ramified` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-k-inert` | `colmez_k_inert` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-k-ramified` | `colmez_k_ramified` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-c-arch` | `colmez_c_arch` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-c-finite` | `colmez_c_finite` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/colmez-series-automorphy` | `colmez_series_automorphy` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-arch-proper` | `colmez_arch_proper` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-nonsplit-proper` | `colmez_nonsplit_proper` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-ordinary-pairing` | `colmez_ordinary_pairing` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-split-proper` | `colmez_split_proper` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-height-decomposition-series` | `colmez_height_decomposition_series` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-local-m-inert` | `colmez_local_m_inert` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-local-m-ramified` | `colmez_local_m_ramified` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-local-m-division` | `colmez_local_m_division` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-local-n` | `colmez_local_n` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-superspecial-m` | `colmez_superspecial_m` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-vertical-pseudo` | `colmez_vertical_pseudo` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-vertical-split-zero` | `colmez_vertical_split_zero` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-kernel-schwartz` | `colmez_kernel_schwartz` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-local-cancel-nonsplit` | `colmez_local_cancel_nonsplit` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-local-cancel-split` | `colmez_local_cancel_split` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-nonzero-theta` | `colmez_nonzero_theta` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-adjunction-arch` | `colmez_adjunction_arch` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-small-level-diagonal` | `colmez_small_level_diagonal` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-modified-projection` | `colmez_modified_projection` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-adjunction-finite` | `colmez_adjunction_finite` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-arithmetic-adjunction` | `colmez_arithmetic_adjunction` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/colmez-rev-derivative-of-the-mixed-theta` | `colmez_rev_derivative_of_the_mixed_theta` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/colmez-rev-archimedean-holomorphic-projection-of-log` | `colmez_rev_archimedean_holomorphic_projection_of_log` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/colmez-rev-local-whittaker-series-for-incoherent` | `colmez_rev_local_whittaker_series_for_incoherent` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/colmez-rev-corrected-cm-multiplicity-at-split` | `colmez_rev_corrected_cm_multiplicity_at_split` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-height-green-characterization` | `gz86_height_green_characterization` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-resolvent-residue` | `gz86_resolvent_residue` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-cusp-expansion` | `gz86_cusp_expansion` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-green-constant` | `gz86_green_constant` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-archimedean-height` | `gz86_archimedean_height` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-hecke-archimedean-height` | `gz86_hecke_archimedean_height` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-atkin-lehner-invariance` | `gz86_atkin_lehner_invariance` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-cm-genus-orbits` | `gz86_cm_genus_orbits` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-pair-count` | `gz86_pair_count` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-ramified-congruence-count` | `gz86_ramified_congruence_count` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-prime-discriminant-count` | `gz86_prime_discriminant_count` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-genus-pair-count` | `gz86_genus_pair_count` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-genus-kernel-evaluation` | `gz86_genus_kernel_evaluation` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-orbit-kernel-evaluation` | `gz86_orbit_kernel_evaluation` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-genus-character-filter` | `gz86_genus_character_filter` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-cm-eisenstein-sum` | `gz86_cm_eisenstein_sum` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-disjoint-archimedean-sum` | `gz86_disjoint_archimedean_sum` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-complex-tangent-asymptotic` | `gz86_complex_tangent_asymptotic` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-diagonal-archimedean-height` | `gz86_diagonal_archimedean_height` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-renormalized-self-value` | `gz86_renormalized_self_value` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-self-value-orbit-sum` | `gz86_self_value_orbit_sum` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-total-archimedean-formula` | `gz86_total_archimedean_formula` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-degree-one-intersection` | `gz86_degree_one_intersection` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-supersingular-eichler-order` | `gz86_supersingular_eichler_order` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-split-vanishing` | `gz86_split_vanishing` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-hom-intersection-count` | `gz86_hom_intersection_count` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-hom-quaternion-realization` | `gz86_hom_quaternion_realization` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-endomorphism-congruence-order` | `gz86_endomorphism_congruence_order` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-inert-disjoint-intersection` | `gz86_inert_disjoint_intersection` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-ramified-disjoint-intersection` | `gz86_ramified_disjoint_intersection` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-new-automorphism-length` | `gz86_new_automorphism_length` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-j-tangent-values` | `gz86_j_tangent_values` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-new-hom-intersection` | `gz86_new_hom_intersection` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-inert-total-intersection` | `gz86_inert_total_intersection` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-ramified-total-intersection` | `gz86_ramified_total_intersection` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-split-total-intersection` | `gz86_split_total_intersection` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-level-intersection` | `gz86_level_intersection` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-split-height-sum` | `gz86_split_height_sum` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-inert-height-sum` | `gz86_inert_height_sum` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-ramified-height-sum` | `gz86_ramified_height_sum` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-inert-unit-count` | `gz86_inert_unit_count` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-global-local-archimedean-sum` | `gz86_global_local_archimedean_sum` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-finite-height-sum` | `gz86_finite_height_sum` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-level-reduction-component` | `gz86_level_reduction_component` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-component-orthogonality` | `gz86_component_orthogonality` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-finite-intersection-height` | `gz86_finite_intersection_height` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-prime-to-p-hom-count` | `gz86_prime_to_p_hom_count` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/classical-isomorphism-intersection-count` | `gz86_isomorphism_intersection_count` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.0/classical-rankin-normalization` | `gz86_rankin_normalization` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-absolute-convergence` | `gz86_absolute_convergence` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-entire-functional-equation` | `gz86_entire_functional_equation` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-height-series-cuspidality` | `gz86_height_series_cuspidality` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.0/classical-relative-field-heights` | `gz86_relative_field_heights` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.3/classical-eigendifferential-period` | `gz86_eigendifferential_period` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-disjointness` | `gz86_disjointness` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.0/classical-cm-action-conventions` | `gz86_cm_action_conventions` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.2/classical-local-intersection-height` | `gz86_local_intersection_height` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.0/classical-genus-character-factorization` | `gz86_genus_character_factorization` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-rankin-unfolding` | `gz86_rankin_unfolding` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-trace-adjunction` | `gz86_trace_adjunction` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-mobius-level-decomposition` | `gz86_mobius_level_decomposition` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-rankin-kernel-pairing` | `gz86_rankin_kernel_pairing` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-prime-to-level-detection` | `gz86_prime_to_level_detection` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-eisenstein-transformation` | `gz86_eisenstein_transformation` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-trace-coset-classification` | `gz86_trace_coset_classification` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-ramified-theta-reindexing` | `gz86_ramified_theta_reindexing` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-kernel-u-formula` | `gz86_kernel_u_formula` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-prime-eisenstein-combination` | `gz86_prime_eisenstein_combination` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-kernel-fourier-expansion` | `gz86_kernel_fourier_expansion` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-eisenstein-zero-coefficient` | `gz86_eisenstein_zero_coefficient` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-eisenstein-nonzero-coefficient` | `gz86_eisenstein_nonzero_coefficient` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-kernel-meromorphic-continuation` | `gz86_kernel_meromorphic_continuation` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-integral-kernel-values` | `gz86_integral_kernel_values` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-central-kernel-holomorphy` | `gz86_central_kernel_holomorphy` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-coefficient-functional-equation` | `gz86_coefficient_functional_equation` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-genus-sign-reversal` | `gz86_genus_sign_reversal` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-l-functional-equation` | `gz86_l_functional_equation` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-central-value-kernel` | `gz86_central_value_kernel` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-central-derivative-kernel` | `gz86_central_derivative_kernel` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-different-reindexing` | `gz86_different_reindexing` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-sign-multiplicativity` | `gz86_sign_multiplicativity` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-genus-sigma-identity` | `gz86_genus_sigma_identity` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-logarithmic-prime-decomposition` | `gz86_logarithmic_prime_decomposition` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-prime-coefficient-parity` | `gz86_prime_coefficient_parity` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-single-prime-logarithm` | `gz86_single_prime_logarithm` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.5/classical-weight-two-central-value` | `gz86_weight_two_central_value` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.5/classical-genus-sum-filter` | `gz86_genus_sum_filter` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-holomorphic-projection` | `gz86_holomorphic_projection` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-eisenstein-mellin-asymptotics` | `gz86_eisenstein_mellin_asymptotics` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-boundary-eisenstein-cusps` | `gz86_boundary_eisenstein_cusps` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-boundary-eisenstein-orthogonality` | `gz86_boundary_eisenstein_orthogonality` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-projection-boundary-coefficients` | `gz86_projection_boundary_coefficients` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-rankin-cusp-constants` | `gz86_rankin_cusp_constants` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-rankin-boundary-coefficients` | `gz86_rankin_boundary_coefficients` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-rankin-mellin-regularization` | `gz86_rankin_mellin_regularization` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-projected-derivative-cuspform` | `gz86_projected_derivative_cuspform` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-projected-derivative-coefficients` | `gz86_projected_derivative_coefficients` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.3/classical-modular-period-degree` | `gz86_modular_period_degree` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.0/classical-twist-real-period` | `gz86_twist_real_period` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.5/classical-definite-period-announcement` | `gz86_definite_period_announcement` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.5/half-weight-waldspurger-value` | `halfWeight_waldspurger` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.7/cm-tensor-stabilizer-height` | `cmTensor_stabilizer_height` | The statement lacks the geometric/analytic hypotheses tying its arbitrary inputs to the source objects. |
| `GZ.6/classical-rankin-kernel` | `classicalRankinKernel_trace`, `classicalRankinKernel_fourier` | Arbitrary scalar/function inputs are not tied to the modular, quadratic-character or ideal-count objects; the statement can be false under the displayed hypotheses. |
| `GZ.6/classical-genus-sign-function` | `rankinGenusSign_complement`, `rankinGenusSign_multiplicative`, `test:rankinGenusSign_negative_index` | Arbitrary scalar/function inputs are not tied to the modular, quadratic-character or ideal-count objects; the statement can be false under the displayed hypotheses. The former scalar identity did not test the construction; the packet’s sign-sensitive n=±3 example requires actual quadratic characters. |
| `GZ.6/classical-signed-divisor-sums` | `signedDivisorSums_prime_support` | Arbitrary scalar/function inputs are not tied to the modular, quadratic-character or ideal-count objects; the statement can be false under the displayed hypotheses. |

## Checks and orchestrator follow-up

- `python3 scripts/check_blueprint.py research/blueprint/packets/GrossZagierAndArithmeticHeights--GZ.0.json --index <pinned-declaration-index>`: exit 0, zero errors and warnings. The actual check used the shared index at the exact pinned baseline, not the form-only fallback.
- `scripts/check_errata.py` on a scratch `errata-v1` wrapper containing the packet’s roadmap ID, all `sourceIssues` and `sourceVersions`: exit 0. The wrapper was not submitted as a new deliverable.
- Independent structural assertions check unique node/source-issue IDs, complete per-node review coverage, source-reference verdict coverage, matching reviewer IDs, at least three allowed-kind tests on all 64 objects, internal acyclicity, stage target resolution and external stage requests.
- `git diff --check` and the deliverable-path/private-path audit passed before submission. Full Lean compilation remains unavailable as described above; the PR must say that plainly.

The orchestrator should queue revision of this packet and suggested file, and explicitly authorize the reader document for synchronization. The revision needs a freely readable, version-specific replacement for the unverified published YZZ citations or access to that exact text; retain the detailed proof-source gates instead of transferring old pagination to the 2011 preprint. Resolve the finer supplier contracts, rebuild the actual API/test signatures from them, and recheck the 224 unresolved source references. Decide where the newly confirmed E86 source misprint belongs in the errata queue. The recorded upstream height-text/code discrepancy remains an upstream note for the maintainer, not a change to the upstream roadmap.

No work was promoted, no upstream roadmap was edited, and no second job was claimed.
