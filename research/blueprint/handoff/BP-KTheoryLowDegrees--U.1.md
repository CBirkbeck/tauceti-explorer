# BP-KTheoryLowDegrees--U.1 — Spin-coordinate continuation

Agent: Codex; session: codex-a71f92; issue: #764; date: 2026-09-26.
Status: **checkpoint / partial**, not a completed blueprint or an independent review.

## Delivered

Four new application lemmas decompose the real-circle obstruction:

1. The ordered coordinate pair (e₁,e₀) is orthonormal for the existing realCliffordForm N 0, for every N≥2.
2. The faithful SO coordinate image of spinRotation with parameter θ is the stabilized positive circle rotation through 2θ. The proof calculates every column, including the complementary identity.
3. The once-around circle loop has the existing spinRotationPath as a lift from 1 to negOne.
4. No based contraction of that loop exists in the exact pinned SO carrier: covering-lift uniqueness and endpoint invariance contradict negOne≠1.

The final SK₁ theorem now consumes this chain but still explicitly awaits the SL-to-SO retraction. The inherited positive-column convention is preserved. A visual check of Weibel III.1.5.4 shows that his displayed matrix is its inverse, so the reader and source-match annotation explain this translation; it is not alleged to be a source error.

All 210 inherited node IDs survive. Exactly 208 inherited node objects are unchanged; only circle-evaluation-rotation and SK1-real-circle-nonzero are revised. All inherited sources, source versions, ten sourceIssues, nine supplier requests, 408 baseline entries, APIs, tests and 44 planets are preserved. Four unrelated gap records are unchanged; the rotation gap is narrowed to its remaining retraction request.

Current totals: 214 nodes, 430 API items, 225 tests, 44 planets, 425 baseline declarations, five gaps and nine requests. The checker reports 426 API items and 222 tests because it counts only definition/construction nodes; the extra four APIs and three tests are on lemmas. No whole stage is closed.

## Reading and ownership

Read the reviewed AUDIT-29 entries for all eight scoped stages before planning, accepted RS-18 and the relevant stage/owner links. Fresh full upstream style reads were GrothendieckEulerForms and LieGroups. The companion Z.3 packet, generic Spin mathematics and generic Lie-group mathematics are not re-planned.

Fresh source reading: Weibel's author-hosted combined K-book draft of 29 August 2013, III.1.5 with proof and III.1.5.1–4, PDF pp.192–193 / printed pp.184–185; PDF193 also inspected visually. Public source: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf. SHA-256: a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845. No unread Spin Geometry proof is claimed as a source. The coordinate calculation is explicitly supplied here using the pinned generator and conjugation APIs, not attributed as a printed proof in Weibel.

Read the actual pinned statements for the real quadratic form and weights, Clifford generator relations, Clifford star, injectivity of the generating map, Spin action and rotation path, the faithful SO coordinate inclusion and its topology, compactness and the covering projection, and covering-lift uniqueness/endpoint invariance. The 17 newly registered statements have module/line locators in continuationAudit.pinReads. Pins remain Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

## Checks

- Packet validator with pinned declaration index: 0 errors, 0 warnings.
- Exact-file intake: four authorized files, zero problems; 214-node internal graph acyclic; inherited requests/sourceIssues and all unrelated gaps unchanged.
- Publication guard: all 20 selected input/output blobs unchanged between claim snapshot f812aa162e951db8d8937459c9bf8e837746323d and fresh main 8d79859e2dbf30c7980a59eff7ee8cdac1361eaa. Claim bot confirmation 5850308122 still names this session. Only the four authorized deliverables are published, using MCP; no git commands.
- Complete suggested Lean file: Lean 4.34.0-rc2, 0 errors, 721 proof-placeholder warnings only. All new theorem/example bodies are proof placeholders as required; nothing is claimed formalized.
- Byte-compared all 8482 reached Mathlib sources; built all 106 reached Tau Ceti modules from the pin in isolated scratch.
- Four separate actual Lean proof checks: arbitrary-dimensional coordinate norm, ordered-pair orthogonality, pinned compact covering instance, and no endpoint-relative contraction of the projection of a path from 1 to negOne. Zero proof placeholders, errors or warnings. This is not a full formalization of the coordinate comparison.
- Exact Clifford multiplication over ℤ[c,s]: 270 coordinate identities, both orientations in dimensions 2–16; 15 wrong-orientation comparisons correctly rejected. No floating point.
- Suggested file SHA-256: 40bc1337ba55866dc998dbde02f2032b111bc48965dedf5488bb4c598b0eb1d0.

## Where to resume

Preserve the Morita, Milnor, determinant and circle-contraction work. Resolve these precise gaps; their complete contracts and consumers are in the packet.

### The SL-to-SO retraction for the real-circle obstruction

The coordinate frame, full stabilized Spin-action comparison, nonclosing once-around lift, and absence of a based SO contraction are now source-decomposed in U.3/circle-coordinate-frame, circle-spin-coordinates, circle-spin-lift and circle-no-so-contraction. Their covering machinery is actual pinned baseline; no π₁ computation or Spin simple connectivity is needed. What remains is the LieGroups layer 9 request: for every N≥2, a continuous retraction from the coordinate-topologized real determinant-one matrices to SO(realCliffordForm N 0), fixing that SO subgroup under the faithful coordinate representation, hence fixing 1 and the evaluated stabilized circle rotations. Composing this retraction with circle-trivial-class-based-contraction would contradict circle-no-so-contraction. No retraction is constructed or assumed to be already available here, so the final SK₁ theorem remains partial. The canonical supplier-stage ID remains in unresolvedUpstreamPrerequisites and requests because the checker tests the tauceti: declaration prefix before atlas stages; no fictitious baseline declaration is introduced.

Needed by: `KTheoryLowDegrees:U.3/SK1-real-circle-nonzero`.

### The real circle ring is Dedekind for the U.4 non-example

Prove that A=ℝ[x,y]/(x²+y²−1) is a Noetherian integrally closed integral domain of dimension at most one, with the exact IsDedekindDomain hypotheses required by the Mennicke and arithmetic non-examples. The SK₁ nontriviality theorem itself uses only the specified commutative quotient ring; its former parenthetical Dedekind assertion was not backed by a prerequisite. This application fact must be sourced and decomposed, potentially via the smooth affine real conic and complex Laurent-polynomial base change with descent. No descent theorem or geometric regularity criterion is asserted as baseline without reading it. Preserve the Dedekind-domain counterexample target in U.4; do not treat it as a proved consequence of SK₁≠1 alone.

Needed by: `KTheoryLowDegrees:U.3/SK1-real-circle-nonzero`, `KTheoryLowDegrees:U.4/sk1-mennicke-symbol`, `KTheoryLowDegrees:U.4/universal-mennicke-group`, `KTheoryLowDegrees:U.4/bass-milnor-serre`.

### The tame formula, the degree-m Hilbert product formula and the power reciprocity law (BMS (A.16), (A.19)–(A.21))

U.4's arithmetic Mennicke argument (BMS Theorem 3.5) uses (A.16) (a, b / 𝔭)_m = (a/𝔭)_m^{ord_𝔭 b} for a a unit at 𝔭 ∤ m, the product formula ∏_𝔭 (a, b / 𝔭)_m = 1 (Artin–Tate XII Theorem 13) and its consequence (A.21) (b/a)_m = ∏_{𝔭∤a}(a, b / 𝔭)_m. ClassicalArithmeticCompletion CA.1 plans exactly these (CA.1/tame-hilbert-symbol-formula, CA.1/hilbert-product-formula-of-degree-n, CA.1/power-reciprocity-law), but those nodes cite K2SymbolsBrauer:T.7 for the norm-residue symbol, and T.7 lies downstream of U.4 (CA.1 ← T.7 ← T.3:localization-comparison ← T.2:graded-map ← K3BlochGroups:V.2 ← ArithmeticKTheory:N.5 ← U.4), so U.4 cannot import them without a stage cycle; Tau Ceti ClassFieldTheory lists 'explicit power-reciprocity laws beyond quadratic reciprocity' as outside its scope. BMS's orientation of the symbol is the transpose of CA.1's. Resolution proposed in restructure.

Needed by: `KTheoryLowDegrees:U.4/power-reduction-non-totally-imaginary`, `KTheoryLowDegrees:U.4/power-reduction-totally-imaginary`.

### Hilbert symbols on higher unit groups at primes above p (BMS (A.17)–(A.18))

The totally imaginary case of BMS Theorem 3.5 (Case 3, through Lemma 3.4(a)) needs (A.17): for k/ℚ_p finite containing μ_{p^n}, with e = ord_𝔭(p), (U_𝔭(h), U_𝔭 / 𝔭)_{p^n} = (U_𝔭(h+1), k^× / 𝔭)_{p^n} = μ_{p^{n−j}}, j = [h/e − 1/(p−1)]_{[0,n]}. BMS prove it (pp. 87–88) from Serre, Corps locaux, Ch. XIV Prop. 6 (p. 237) and Ch. XV Prop. 9 (p. 219), which are not freely available and were not read; no roadmap of the atlas plans the statement. Needed only for S = ∅ and F totally complex, where U.4 uses j = 0 (the pairing U_𝔭(h) × U_𝔭 → μ_{p^n} is onto).

Needed by: `KTheoryLowDegrees:U.4/power-reduction-totally-imaginary`.

### Comparison of classical relative K₁ with π₁ of the homotopy fibre (K-book IV.1.11, Ex. IV.1.15)

The source gives only a hint ('Use Ex. III.2.7 to show that π₁K(R → R/I) is isomorphic to the group K₁(R, I)'). Completing the five-lemma argument needs π₂BGL⁺ = K₂ (K2SymbolsBrauer T.1:plus) and the classical relative K₂-sequence (K2SymbolsBrauer T.6), which the helper places downstream of U.6 because K2SymbolsBrauer:T.1/k2-definition cites GeneralAlgebraicKTheory:K.2, whose combined stage requires K.2:low-degree-comparisons ← U.6. GeneralAlgebraicKTheory's decomposition node K.5/relative-K-theory-and-excision-boundary asserts the identification with the same exercise as its only source. See restructure.

Needed by: `KTheoryLowDegrees:U.6/relative-K1-homotopy-comparison`.

The LieGroups request is already present: a continuous retraction, for every N≥2, from the determinant-one real matrices with coordinate topology to the pinned SO(realCliffordForm N 0), fixing SO in the faithful coordinate inclusion. It must fix the stabilized rotation and 1. Do not replace it with an informal deformation-retraction assertion or a differently topologized carrier.

The nine supplier requests and historical H.3 plus-construction obstruction-theory boundary are unchanged. Keep K₀ on left modules, K₁ automorphism classes on right modules with column vectors, finite sets of finite places for S, and the positive DVR boundary normalization.
