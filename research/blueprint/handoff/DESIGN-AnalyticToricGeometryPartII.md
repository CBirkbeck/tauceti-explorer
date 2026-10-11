# DESIGN-AnalyticToricGeometryPartII — completed target pass

Issue: #4583. Author: Codex (GPT-6), session `codex-BtPquw`.
Claim confirmed by the swarm bot in [comment 6104246181](https://github.com/CBirkbeck/tauceti-explorer/issues/4583#issuecomment-6104246181).

The design pass is complete. The packet has 29 nodes: 10 constructions, two definitions, 16 theorems and one application. It contains 52 API items, 36 discriminating tests, 28 planets, eight inspected baseline declarations and eight precise supplier requests. All node implementation statuses are unchecked. All seven stages are **planned**; none is closed. There are no unexplained local mathematical gaps. The eight requested supplier contracts and the explicitly recorded prototype limitations prevent a closed-stage claim.

The five issue deliverables are present. The reader has approximately 10,900 words and agrees with the target packet. `routeCoverage` accounts for all 16 extracted Scholze items: imported cone/fan and arbitrary-ring scheme items remain with their owners; fan classification is excluded because every target takes a fan as input. No classification theorem is used implicitly.

## Coverage and prototype ledger

The suggested file elaborates at the pinned baseline with `sorry` as its only warning. This verifies signature syntax and types, not proofs or the full geometric hypotheses. All 29 named target signatures, all 52 API names and all 36 example labels appear. Twelve definition/construction targets each have three packet tests.

| Stage | Nodes | API | Tests | Planets | Coverage |
|---|---:|---:|---:|---:|---|
| NT.0 | 6 | 18 | 12 | 6 | planned |
| NT.1 | 3 | 8 | 6 | 3 | planned |
| NT.2 | 4 | 18 | 12 | 4 | planned |
| NT.3 | 7 | 5 | 3 | 6 | planned |
| NT.4 | 2 | 0 | 0 | 2 | planned |
| NT.5 | 3 | 0 | 0 | 3 | planned |
| NT.6 | 4 | 3 | 3 | 4 | planned |

The fully stated parts are the integral ray inequalities and character support modules, native point-divisor coefficient maps and injectivity, coefficient-linear lattice power formulas, the arithmetic weight/cone calculations, discrete c₀ coefficient tests and finite-support dense-field approximation, finite balancing kernels, and the inverse-limit evaluation map given an actual homeomorphism. The neighbourhood signature includes its actual compactness, closedness, monotonicity and common-zero-intersection hypotheses in the constructible topology. No empty proposition field represents a missing condition.

The geometric limitations are precise:

- NT.0: the native scheme-divisor and linear-equivalence carriers are used, but their identification with C0's fan scheme is omitted. The class-relations signature states the native linear-equivalence kernel, with geometric ray identification and the field-independent quotient presentation omitted. The support modules lack their global sheaf comparison and tensor base-change isomorphism. Integral Cartier models give character frame data; the invertible sheaf and completion are omitted. Tests of P¹ section ranks and character divisors give coefficient portions rather than full geometric identifications.
- NT.1: the unit-space constructor and chart maps use native topological gluing. Adic structure, completed field base change and the disc/P¹ fixture identifications are omitted. The power map is fully coefficient-linear on the character algebra; gluing and divisor pullback remain coordinate fragments.
- NT.2: the discrete c₀ carriers are stated. Perfectoid ring structures, integral plus rings, glued divisor sheaves, the Banach piece isometry and monomial-compatible tilt are omitted. The named product is convolution, with a native ultrametric-field hypothesis; the pointwise multiplication on the c₀ carrier is never identified with the desired convolution. Descent and graded-algebra tests include weight portions; only the stated infinite-family exclusion tests assert the full c₀ condition.
- NT.3: comparison signatures give underlying spaces and actual small-site sheaf categories. The tilde-limit density clause, identification of the named toric diagrams, the geometric-morphism adjunction/left-exactness, projective coordinate quotient and toric stratum associations are omitted. The affine-line object is full analytification via P¹ minus infinity; it is never identified with the positive-ray unit disc.
- NT.4: torsion modules and maps are abstract supplier values. Prime p, prime ℓ≠p and m≥1 are typed; their identification with toric étale cohomology and its geometric pullbacks is omitted. Invertibility differs from identity: the reader specifies multiplication by p on P¹ top cohomology.
- NT.5: the dense-field coefficient-truncation step is fully stated. The homogeneous sharp estimate, integral-section domain identification, line-bundle power and algebraic zero scheme need the supplier types. The topological neighbourhood lemma is fully stated for its constructible-space inputs; deriving those inputs from the toric equations remains in the mathematical target.
- NT.6: the finite integer balancing kernels and three matrix examples are fully stated. Extraction of their rows and displacement indices from the native fan, operational Chow evaluation, refined support, positive degree and the descended reduced subvariety carrier are omitted.

These limitations are not claims that the full geometry has compiled. Each stage's `remaining` list specifies the exact strengthening required. A follow-up instantiates the supplier types and strengthens those signatures and tests against the definitive mathematical statements; it does not replace the roadmap by the available coordinate fragments.

## Ownership and supplier requests

The parent is the first prerequisite. Its current Layer 0 and the current library were read: lattices, cones, rays, finite fans, dual semigroups, Gordan finite generation and complex schemes are imported. C0 already owns whole finite-fan scheme gluing over arbitrary commutative rings, including nonnoetherian K°. Nothing here rebuilds those schemes. General perfected-cone Banach algebras, their tilt and the homogeneous approximation induction stay in P2; this roadmap supplies the divisor cone and its toric application.

- `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`: Import Layer 0 dual semigroup σ∨∩M and Gordan finite generation, cones/fans/primitive rays and the complex fan scheme; use the current main additions rather than replanning them. The invariant divisor conventions must use its same lattice/fan carrier.
- `ShimuraCompactifications:C0`: Export, for the finite-fan scheme of C0/arbitrary-ring-toric-charts over every commutative ring A, regular-fan smoothness and complete-fan properness over Spec A, with integral Cartier character gluing and compatibility at A=C with the parent fan scheme. The accepted RS-32 general-base owner includes XΣ,A; these properties are needed also when A=K° is nonnoetherian.
- `PerfectoidSpaces:P2`: For a finite-rank lattice L and rational polyhedral cone C⊂L_R, construct K⟨C∩L[1/p]⟩ with its coefficient-Gauss integral subring, prove perfectoidness and monomial-compatible tilt K♭⟨C∩L[1/p]⟩, including cones with lineality. For a Z[1/p]-valued linear grading whose degree-zero part is K, prove the homogeneous analogue of Lemma 6.5: integral homogeneous f of degree d, rational c≥0 and ε∈Z[1/p] with 0<ε<1 admit an integral homogeneous g of degree d with |f(x)−g♯(x)|≤|ϖ^{1−ε}(x)|max(|f(x)|,|ϖ^c(x)|) at every Spa point, hence equality of bounded maxima. Assume K perfectoid, ϖ=(ϖ♭)♯, ϖ^p|p. General perfected cone algebras and approximation induction remain in P2; NT.2 supplies only its toric specializations and the identification for C_D.
- `SchemeAndStackFoundations:SF.0`: Supply the lattice-basis Laurent polynomial UFD calculation for the split torus and its divisor class triviality; effective Cartier divisors/zero sections and dimension/height facts for smooth Cohen–Macaulay varieties, including regular-sequence intersections and dimension after generic hyperplane cuts over an infinite coefficient field.
- `SchemeAndStackFoundations:SF.2`: Smooth proper base change for Z/ℓ^m cohomology over an arbitrary rank-one valuation ring with algebraically closed fraction field, ℓ invertible, and topological invariance of the étale site under universal homeomorphisms. Preserve naturality for the coefficient-linear toric power morphism.
- `SchemeAndStackFoundations:SF.5`: Integral Chow groups and operational Chow groups, Chern classes of invertible sheaves, the Kronecker evaluation duality for complete schemes with a split connected solvable group acting with finitely many orbits (the general theorem applied in Fulton–Sturmfels Proposition 1.4, p. 6), refined intersection support/projection/excess formulas, positivity of ample degree on a nonzero effective cycle, and general ample-hypersurface cuts over infinite fields that remain nonempty in positive dimension. No connectedness premise or conclusion is used. NT.6 owns the toric fan computation and field-independence application.
- `ClassicalAdicEtaleCohomology:H5`: Proper algebraic/adic comparison for the smooth proper toric variety with constant Z/ℓ^m coefficients, ℓ≠p, natural for φ_p; no inverse-limit upgrade to Z_ℓ is assumed.
- `ClassicalAdicEtaleCohomology:H0`: Ordinary torsion étale cohomology, functorial pullback along geometric morphisms and its cup-product compatibility, with the P7 perfectoid-limit continuity supplying the tower comparison.

Exact finer nodes are used for R2 formal generic fibres and section-valuation domains, P2/P3/P7 localization/tilting/limits/étale descent, and A1's étale site. The C0 and PerfectoidSpaces packet review records remain open; their use is a declared supplier contract, not a claim of acceptance or formalization.

The extraction calls this direction `AnalyticToricGeometryNonarchimedeanPartII`; the queue requires `AnalyticToricGeometryPartII`. Accepted RS-32 gives the arithmetic toroidal continuation to `ShimuraCompactifications`. The two subtitles distinguish their directions; the maintainer reconciles final Part II/III numbering. Consumers are `DeligneWeightsAndPurityPartII` and `MotivesAndAlgebraicCyclesPartII`, never prerequisites. A consumer requiring a geometrically irreducible variety must select a component and address its field of definition: Corollary 8.8 does not supply that stronger conclusion. The disconnected type-(2,0) divisor on P¹×P¹ is recorded as an acceptance example.

## Sources and checks

All source statements are written in our own words. No source file or excerpt is included. The primary PDFs were read on 11 October 2026; exact URLs and SHA-256 hashes are recorded in the packet:

- Scholze, *Perfectoid spaces*, published IHÉS 116 (2012), pp. 245–313: Theorem 1.5 (p. 247), the introductory approximation/complete-intersection statements (pp. 249–251), Proposition 5.20 (p. 280), Lemma 6.5 and Remark 6.6 (pp. 288–290), the limit results of §7 (pp. 302–303), and all of §8 (pp. 303–307). Numbering uses the published version. Independently confirmed extraction correction `PAPER-SCHOLZE-12/E11` is incorporated: the denominator-cleared equation is a section of O(p^N D).
- Fujino–Sato, *On non-projective complete toric varieties*, author version 0.27 dated 12 July 2025: Example 4.1 (pp. 7–8). The complete regular nonprojective threefold tests the distinction between properness and projectivity.
- Fulton–Sturmfels, *Intersection theory on toric varieties*, arXiv:alg-geom/9403002v1 dated 1 March 1994: Proposition 1.1 (p. 4), complete degree map (p. 5), Proposition 1.4 and Theorem 2.1 (p. 6), Corollary 2.4 (p. 7), Proposition 3.1 (p. 10) and Theorem 3.2 (p. 11; proof pp. 12–13). Preprint pagination is explicit. The generic finite-orbit duality theorem belongs to the SF.5 request; the toric integer presentation and displacement application belong here.

No source needed for the toric target statements is missing. Generic supplier proofs and their own source closure are required by the stated contracts. No uncleared book was used.

Validation: `python3 scripts/check_blueprint.py research/blueprint/packets/AnalyticToricGeometryPartII.json` reports zero errors and zero warnings. `lean-check research/blueprint/suggested/AnalyticToricGeometryPartII.lean` exits successfully with only declaration-uses-`sorry` warnings. A name audit checks 29 target declarations, 52 API names and 36 test labels; per-layer planet counts are at most six. Internal prerequisite chains are acyclic and terminate at the cited baseline, supplier nodes or requests. The submission changes only the five authorized deliverables.

The pinned baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Duplication checks also read TauCetiRoadmap main 070dc2becd74419e76303ede84b465ed4a69461f and Tau Ceti main a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The read-only environments were not built or changed. There is no handoff dependency on the disposable scratch directory.
