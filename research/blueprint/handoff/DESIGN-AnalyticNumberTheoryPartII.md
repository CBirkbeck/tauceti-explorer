# DESIGN-AnalyticNumberTheoryPartII — #4970

Codex, session codex-Ejos7R. This is the completed target-level design pass for one claimed job. The claim was confirmed by the swarm bot. The deliverables are the roadmap definition, blueprint packet, reader document, suggested Lean file and this note. No implementation is claimed.

## Scope and coverage

The packet has 39 nodes: 8 definitions and 31 theorem targets, with 45 API items, 31 unit-test examples, 27 planets and 27 checked baseline declarations. All six stages ECN.0–ECN.5 are **planned**. None is closed. Packet status is **complete**, in the PROTOCOL section 0 sense that every routed endpoint has a node and every prerequisite chain ends in a checked library declaration, an existing supplier node/stage plus its request, or a precisely recorded gap. Two gaps and twelve supplier interface requests remain. Two requests explicitly record existing upstream interfaces without proposing new work on them. Independent review must assess them; completion of this pass does not assert mathematical closure.

The six routed Gross–Zagier items are 39 (139 rank-three curve), 40 (effective technical principle), 41 (effective logarithmic lower bound), 42 (explicit prime-count constant and its asymptotic), 44 (5077 rank-three curve), and 45 (the sixteen class-number-three fields).

## Work completed

- Read the pinned declarations rather than relying on name matches. Native class numbers, field discriminants, genus divisibility, intrinsic elliptic Euler coefficients, finite analytic order, canonical height, point group modulo torsion, Liouville, Mellin inversion and residues are imported.
- Checked current upstream Completed/EffectiveBounds, Completed/ContourIntegration and Completed/Multiquadratic, the elliptic roadmap and current Tau Ceti. Searched the nine roadmaps newer than the atlas snapshot for the effective lower-bound targets. Existing general bounds, heights, genus theory, quadratic twists and contour theory are not replanned. No build was run in the current read-only environment.
- Defined eight genuinely new objects for this continuation, each with an API and distinguishing unit tests. Gave every target its exact hypotheses, source locator, proof route, prerequisites and acceptance criteria.
- Kept arithmetic rank independent of analytic rank. Specified complete descent, independent-point and saturation checks; an analytic rank result cannot replace an arithmetic certificate.
- Separated the Montgomery–Weinberger interval 10^12 through 10^2500 from the Lehmer–Lehmer–Shanks interval above 907 and below 10^12. Both are necessary for the final cutoff.

## Two precise gaps

1. **E₁₃₉ arithmetic certificate.** Gross–Zagier I Proposition (7.4) states rank three, but the inspected source passages do not print three independent rational points and a complete two-descent upper-bound certificate for the chosen model. Existing elliptic Layer 6 supplies general explicit two-descent, ED.3 supplies its finite local-image and saturation refinement, and CN.3 integrates certificate verification. Produce and check the curve-specific finite witnesses, or read a primary proof giving them, and transport through a checked isomorphism or isogeny. This gap affects the arithmetic-rank and rank-three-139 targets.
2. **Constants 7000 and 55.** Oesterlé gives the C1–C4 comparison and reports these constants, but the inspected texts do not give a complete rational dataset proving the c₁,c₂,c₃, corrected bad factors, scales, λ inequalities and finite cutoffs at the exact constants. Regenerate the numerical comparison certificates for every ramified case, retaining a strict prime-discriminant margin below 55. This gap affects ECN.3 and all downstream bounds.

## Requests to prerequisite roadmaps

The requests are recorded in the packet with their complete consumer lists; they have not been sent as separate issues or messages.

1. GN.3: proper ideal-class/reduced oriented form bijection and completeness; the squarefree-radicand bridge for the pinned genus hypotheses; integrated nonaxial form counting.
2. AN.4: primitive quadratic characters including ramified and 2-adic values; exact normalized partial-zeta decomposition and nonnegative coefficients; the parent Siegel comparison theorem.
3. AL.3: motivic symmetric-square/Liouville identity, all finite bad factors, gamma shifts, nonzero Petersson value and quantitative strip bounds. The accepted unitary Rankin–Selberg pole node does not supply this exact interface.
4. CN.3: verification adapters importing existing elliptic Layers 4 and 6, R29.4 and ED.3; modular-unit/CM checks through the modular-form and modular-curve owners. Curve-specific numerical and descent witnesses remain here.
5. CN.4: arbitrary-level weight-two newform derivative boxes with Fricke signs and all bad factors, beyond the accepted level-one export; validated BGZ kernels, exp/log/π/gamma, heights and Petersson scales; primitive-character Hardy signs. Existing interval arithmetic and Dirichlet-L boxes are imported.
6. CN.1: complete prime/factorization certificates and segmented residue/primality coverage certificates.
7. CN.2: complete bounded character-pattern enumeration, or the exact class-group machinery combined with GN.3’s reduction bridge.
8. AN.2: zero-based nth-prime PNT and the weighted prime-sum consequence for the stated asymptotic.
9. R29.5: the intrinsically normalized conductor-37 modular parametrisation/Jacobian quotient needed by the vanishing Heegner trace.
10. ED.3: complete finite local-image and saturation certificates refining existing elliptic two-descent.
11. Existing elliptic Layer 4: minimal-equation reduction and Tate-algorithm correctness; the actual conductor identification is imported from R29.4. This records an existing upstream interface, not new planning.
12. Existing elliptic Layer 6: explicit two-descent and its rank bound, independent-point/height interfaces and good-odd-prime torsion reduction. This records an existing upstream interface, not new planning.

General descent is explicitly imported from the existing elliptic roadmap; ED.3 owns local-image/saturation refinements. The current upstream Layer-6 README height convention disagrees by a factor two with the actual native definition; this is recorded in upstreamNotes for the maintainer. No cross-tier ownership move or restructuring is proposed. No other roadmap’s files were edited.

## Mathematical details to preserve

- The chosen E₁₃₉ coefficients are (0,−1,1,−64403,−6220110), with discriminant 37·139^6 and conductor 37·139². The source coordinate map is x=(4X+462)/(−139), y=(8Y+4)/139². Oesterlé 1988 p. 66 uses the isogenous model (0,−1,1,−450823,112971139), with discriminant 37³·139^6. Do not treat those models as identical or report a source misprint.
- The conductor-37 source form has Fricke eigenvalue −1 and root number +1. Its −139 twist has root number −1. The Heegner trace for discriminant −139 uses the η-quotient divisor from GZ83 Corollary 6; class number three for this field is checked directly, avoiding a dependency on the final enumeration.
- When 139 divides d, the corrected factor is (1+4ε·139^−s+139^(1−2s))^−1, with ε the associated **primitive** product character’s value at 139. For 139 not dividing d it is 1. Both signs are present in Oesterlé’s formula. A naive pointwise product of the ramified characters vanishes at 139 and cannot supply ε.
- The completion is F=Λ_EΛ_Eχ/d. C1 is coefficient-wise domination. Ψ has a simple zero independently of the elliptic rank. C3 requires a plus product sign; a rank-three curve alone does not remove the local-sign condition.
- In the technical cutoff U=(√d/2)^(1/m), m²+m≥h/2; h=4 uses m=3/2. The first tail contains |log(dM/U)|. The second tail coefficient is 2π⁴/3.
- The BGZ derivative sum has a_n/n and factor 2r!. Exact first-derivative vanishing precedes use of the third-derivative formula. BGZ’s numerical heights equal twice the native (O)-height.
- For the 5077 height-gap route choose the native twist `quadraticTwistOf` with trace 1 and norm 2, discriminant parameter −7. Its conductor is 248773, χ_{−7}(5077)=1, and its central value can be certified in (4,5) using 2048 terms and tail <10^−8. A scratch floating check was about 4.4767571678; that check is not a certificate. The full generator-height enumeration yields the native gap δ=1/4. The GZ constant and all local conditions need their supplier checks.
- The elementary majorant is smooth; the floor-based factors themselves are not monotone. The rational κ witness is 2^−(46+ceil(256(1−q)/q)) for 0<q<1. At q=1/2 this is 2^−302 and gives the explicit integer cutoff 2^(2^605 H²).
- MW needs existence of a critical-line zero in each certified interval, not GRH, simplicity, or proof that the zero is first. Its two exceptional phase windows must be covered by the third character. LLS sieve certificates must prove exhaustive coverage.

## Sources read and missing

Read GZ86 I §§7–8, pp. 230–232; GZ83 Theorem 1 and Corollaries 2–6, pp. 85–87; Oesterlé’s Bourbaki exposition, introduction and §§1–5, pp. 309–323; Oesterlé 1988 §§6–9, pp. 56–67 through publisher page images; BGZ85 §§1–5 and note added in proof, pp. 473–481; MW74 theorem and §§2–5, pp. 529–542; LLS70 introduction, sieve tables and class-number-three discussion, pp. 433–434 and 438–451; Goldfeld 1977 §§1–5, pp. 219–225. URLs, publication versions, printed locators and available PDF hashes are in the packet and reader.

The Brumer–Kramer two-descent article referenced by BGZ was not successfully obtained; its proof is not claimed as read. Oesterlé 1988 was read in publisher page images, not a downloaded PDF. No uncleared book was used or copied. No verbatim source passage or section-by-section source digest is committed. No source erratum is asserted. The model, height and historical interval distinctions above are explicit source comparisons.

## Validation and resume point

The packet checker reports zero errors and zero warnings. All packet definition/API/test names occur in the reader and suggested file, and each layer has at most six planets. Exact scratch arithmetic independently checked the sixteen fundamental discriminants through 907, the −243 filter, the three reduced forms at −907, weight tests, discriminants of both 139 models and the 5077 model, the source coordinate identity, good-reduction counts 7 and 10, and the three LLS iteration thresholds.

The suggested file elaborated with `lean-check` at the pinned baseline; its only warnings are declarations using `sorry`. These are signatures and examples, with no implementation claim. Certain future supplier objects cannot yet be typed: the suggested file explicitly limits the corresponding prototypes to native local coefficients, the local residue formula, single-measure/quantitative comparison, completion reflection and analytic consequences. The reader’s full targets remain definitive. It introduces no empty proposition carrier for those missing types.

Resume with independent review of the complete pass. To close stages, discharge the supplier requests, regenerate the two gap certificates, generate the MW Hardy-sign/phase certificates and the LLS exhaustive pattern certificates, and verify all stated normalizations. The scratch directory is disposable; no follow-up requires its files. All durable source locators, exact target statements and resume instructions are in the five deliverables.
