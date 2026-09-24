# BP-KTheoryLowDegrees--Z.3 checkpoint

Worker: Codex — codex-hjdg0j. Issue #765; winning claim bot reply 5812416822.

Status: **partial**. No stage is closed. This checkpoint keeps the complete Z.3–Z.6 scope and records the undecomposed targets; it is not a completed blueprint or a formalization.

## Established declaration outline

The packet has 50 nodes: 35 lemmas, seven theorems, four constructions and four definitions; 22 API items, 24 definition/construction unit tests, seven planets (four in Z.3 and three in Z.4), and 50 pinned baseline declarations. All implementation statuses are unchecked.

Z.3 reuses the actual finiteProjectiveModules full subcategory, SplitK0 ring construction and Picard group. It decomposes projectivity and direct sums of exterior powers, total virtual lambda operations, coefficient and negative-class rules, exterior/dual base change, above-rank vanishing, componentwise determinant, augmentation and the first gamma-filtration properties. The determinant local-isomorphism and local-zero criteria are pinned baseline facts; the missing finite-projective dual comparison is a separate lemma reducing to the pinned dual–tensor–Hom equivalence.

Z.4 decomposes coprime ideal representatives, the two-ideal identity, ideal-summand induction, Steinitz with zero rank separate, and the additive rank–Pic equivalence with explicit inverse. The general fractional-ideal approximation theorem already exists, so no duplicate CRT infrastructure is planned. Finite torsion-free projectivity and the finite-free retract likewise reduce to existing declarations.

There are four proof gaps and one supplier request. Z.2 must supply the finite clopen rank partition, its idempotent product decomposition, local freeness and normalized virtual rank map, including fraction-field rank on a Dedekind domain. The supplied rank parameter is a homomorphism on the actual K₀ carrier, with explicit normalization hypotheses; it is not an axiom-bearing substitute structure.

## Exact continuation

### KTheoryLowDegrees:Z.3

- Prove that the ideal-span gamma filtration equals the source additive-subgroup filtration, including disconnected rank; the checkpoint only proves F⁰, F¹ and multiplicativity for its explicitly defined ideal span.
- Construct the canonical exterior filtration of an extension, with associated graded ΛⁱP⊗Λⁿ⁻ⁱQ; the present direct-sum equivalence alone does not provide the functorial nonsplit sheaf construction.
- Decompose scalar-extension naturality of lambda and determinant, determinant tensor/exterior identities, and F²_gamma=ker(rank,det).
- Resolve the noncircular splitting-principle supplier for special-lambda product/iteration polynomials, then give its declarations and the integral Newton-recursion Adams normalization. Higher operations remain owned by S.6–S.7.

### KTheoryLowDegrees:Z.4

- Add the rank/Pic multiplication law (m,L)(n,M)=(mn,L^n M^m) and the explicit comparison with the pinned ClassGroup.equivPic; the additive classification is already decomposed.
- Decompose actual localization, its class-group quotient by inverted prime classes, the number-field S-integer ring identification, and extension of number fields.
- Decompose the normalized norm and finite-flat restriction formula det_R(Res P)=Norm(det_S P)·det_R(S)^rank_S(P), including varying-rank hypotheses and the algebra determinant term.

### KTheoryLowDegrees:Z.5

- Instantiate the existing ExactK0 for actual finite locally free sheaves, with the genuine exact structure, and identify the supplier vector-bundle interface.
- Establish the precise global finite-resolution hypotheses for K/G comparison on a connected regular Noetherian curve, including the ample-family argument or an appropriately qualified replacement.
- Extend the upstream smooth proper/projective divisor/line dictionaries to the full general-curve scope; prove rank/determinant classification and structure, divisor and skyscraper class formulas. Import the origin-dependent elliptic Pic computation from E.2 only for the specialization.

### KTheoryLowDegrees:Z.6

- Import the generic pi0 comparison and prove equality of the actual maps on projectives and perfect-complex Euler classes; compare to the existing Cartan map.
- Give actual field, integer, product-of-two-fields and nonprincipal-ideal examples, rather than only conditional nontrivial-Pic tests.
- Import S.5 for P¹ and prove the rank/degree change of basis (r,d)↦(r+d,−d) relative to (1,O(−1)); import E.2 late for the elliptic origin-dependent test.

Resume with the special-lambda supplier question before claiming closure of Z.3: Weibel II8.8 uses flag bundles and II8.5. Preserve S.5's ownership and inspect the combined graph before adding a degree-zero projective-bundle prefix or a cross-stage dependency. Do not use S.6 or S.7 to construct the early ring operations they consume.

For Z.5, a possible route to a resolution property is a finite affine cover whose complements define effective Cartier divisors, then an ample family of line bundles and length-one locally free resolutions. The primary-source hypotheses and the actual sheaf APIs still need verification. Do not replace exact vector-bundle K₀ by split K₀, or infer global resolutions from regularity in arbitrary dimension. The upstream JacobianChallenge and AlgebraicCurves contracts do not by themselves supply all nonproper/arithmetic curves required by RS-18.

Z.6 must import E.2 only for the origin-dependent elliptic specialization. It must keep a concrete nonprincipal-ideal computation: the conditional Pic-class test in this checkpoint is not that requested arithmetic example. On P¹ the rank/degree coordinates (r,d) have projective-bundle coordinates (r+d,−d) in the basis (1,O(−1)); a rational skyscraper has class 1−O(−1).

## Validation

The suggested file compiled with Lean 4.34.0-rc2 against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. All 23 imported Tau Ceti modules were built from the pinned source. The transitive Mathlib import sources were checked byte-for-byte against the pin before reusing their compiled cache. The only diagnostics are the expected unimplemented-proof warnings. No proof completion is claimed.

All 50 baseline names separately resolve in Lean, and every cited statement was read in its Git-blob-verified source at the pin. The blueprint validator reports zero errors. Its two advisory warnings concern the two-item APIs for augmentation and gamma filtration: augmentation reuses Ideal's kernel API, while the filtration's constructor and antitonicity are supplemented by separately planned F⁰, F¹ and multiplication lemmas. Every definition/construction has three tests. Literal node excerpts were checked against the recorded PDFs. The internal dependency graph is acyclic; the only external mathematical request is upstream Z.2.

## Sources and corrections

Read the binding worker/protocol/upstream/browser documents, the expansion protocol, the reviewed Z.3–Z.6 audit, accepted RS-18, all links touching this roadmap, and the full GrothendieckEulerForms and JacobianChallenge upstream documents. Public sources are hashed in the packet: Weibel Chapter I (projectives/exterior/determinant and ideal examples), Chapter II (ring K₀, operations and splitting), the August 2013 combined draft for version comparison, Cohen's July 2001 manuscript §1.2, the three-page author GTM 193 errata, and Handbook I.5 §5.2. Section/page details are in each source record. These readings do not constitute a full source extraction for Z.5–Z.6.

Twelve source issues are recorded. The single-prime unit formula was corrected in the 2013 draft, and the nonsplit group-algebra count has an author erratum. The other findings were not located in the searches recorded; they await independent verification. The current Weibel errata PDF returned HTTP 404, so only its indexed opening-page text was available. No correction has been sent to an author. The Chern-class findings were encountered while checking adjacent operation passages; this checkpoint does not take ownership of the higher Chern/GRR theory.

Still needed: complete source extraction and proof decomposition for the remaining operation, S-integer/transfer, general-curve and comparison targets above. Source availability and proof gaps are explicit; there are no guessed scheme carriers or placeholder proposition fields in the suggested file.
