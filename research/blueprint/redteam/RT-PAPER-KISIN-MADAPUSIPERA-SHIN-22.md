# Red team: Kisin–Madapusi Pera–Shin, Honda–Tate theory

Agent: Codex. Session: `codex-rtOQ9t`. Issue: #4181. Target: `PAPER-KISIN-MADAPUSIPERA-SHIN-22` at `244c699`. Status: complete.

The audit reports four findings: three high and one medium. They concern the active extraction and its design instructions; they do not assert that the main mathematical theorems are false. Proposed repairs remain subject to independent verification.

## Source and scope

The source actually read is the [41-page Berkeley author copy](https://math.berkeley.edu/~swshin/HT.pdf), created 27 January 2021, freshly downloaded on 1 October 2026 with SHA-256 `fd22990bc3eff8a726375cf8f0c9015828c39f1c32b0717347a9ef23ce9b52db`. All pages, Appendix A and references were read; the images on pp.26, 28, 30 and 31 were checked. Page numbers below refer to this copy. The [published article](https://doi.org/10.1215/00127094-2021-0063) is Duke Mathematical Journal 171 (2022), 1559–1614. Its download endpoint returned HTML, so the published text was not collated.

The fresh correction search checked [Crossref metadata](https://api.crossref.org/works/10.1215/00127094-2021-0063), the author publication links, [Shin's errata list](https://math.berkeley.edu/~swshin/errata.pdf), and bounded title/author/erratum searches. No relevant correction was found. The two-page errata list concerns other papers. This bounds finding 3 to the identified author copy and the extraction that uses it.

The current extraction has 244 items: 16 library, 38 planned and 190 missing. All item statements and classifications, definition API/test specifications, proof outlines, six route briefs and 30 prerequisite records were inspected. All 25 distinct cited library declarations were read at the pinned commits. The current review was read; older handoff certificates were not adopted as fresh evidence. All 190 missing items are routed once; the additional 13 routed planned items are permitted source contributions. The item graph has no dangling prerequisites or cycle. The 27 distinct existing planned-stage IDs resolve; new Part II IDs remain design proposals.

This is a section 16 extraction audit, not a demand that its future design jobs already contain recursive proof closure, compiled APIs or complete supplier-paper extractions. In particular, Noot metadata and the uses in KMPS were inspected, but no new full-text verification of all supplier papers is claimed.

## Findings

### 1. library-claim — high

**Where:** `research/blueprint/papers/PAPER-KISIN-MADAPUSIPERA-SHIN-22.result.json: items L14, T26; source route to AbelianSchemesAndArithmeticModuli:A6`.

L14 is marked library although its current statement defines a rational Hom scheme and coefficient-algebra isogenies, whereas its pinned declarations concern finite, surjective morphisms of abelian varieties over a field.

**Evidence.** At Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:54–68 defines IsIsogeny on f : A ⟶ B in AbelianVariety K and proves the finite-and-surjective criterion. Neither declaration constructs Hom_Q as a scheme over Q or its points over a coefficient Q-algebra R. The author PDF §2.3.1, pp.30–31, uses precisely those coefficient points. For example (1+epsilon) id_A over Q[epsilon]/(epsilon^2) is invertible with inverse (1-epsilon) id_A; it is not an ordinary morphism over the original characteristic-p field. L14 still has geometric finite-surjective, composition and field-base-change API/tests. T26 already assigns the rational isogeny scheme to the missing mathematics.

**Repair.** Restore L14 to the actual geometric isogeny predicate supplied by the pinned declarations, retaining its library status only for that predicate. Put the Hom_Q representability and coefficient-algebra isogeny definition in the existing T26 construction and its A6 source route (or a separately routed missing prerequisite of T26 if needed). Keep geometric base change separate from coefficient extension, and add a dual-number coefficient test. Reconcile counts and cross-references if splitting an item; do not create a second owner for T26.

### 2. error — high

**Where:** `research/blueprint/papers/PAPER-KISIN-MADAPUSIPERA-SHIN-22.result.json: items T18 and T19, especially T19 strict condition (ii); ShimuraVarietiesHondaTatePartII brief`.

The positive-multiplicity requirement in T18 conflicts with the universal central-character quantifier in T19. It rejects every type-D^R candidate having an absent central weight, including the Hodge-type cases the construction is supposed to handle.

**Evidence.** The freshly read author PDF §2.2.6, p.26, defines admissibility using “a multiple” of a listed representation; it does not insert positivity. T18 inserts positive multiplicity. T19 then asks that V_chi be admissible for every algebraic character chi of Z_G over Qbar. A finite-dimensional representation has finitely many central weights, whereas the Hodge weight supplies a scalar torus in Z_G and hence infinitely many characters. For any absent chi, V_chi=0, which is not a positive multiple of any nonzero standard or spin representation. In fact the trivial-character part is zero when the nontrivial scalar weight acts on all of V. Thus this is a defect introduced by combining the extraction statements, independently of any ambiguity in the paper.

**Repair.** Make the zero-weight-space convention explicit and consistent: either permit multiplicity zero in T18 when used for character parts, or quantify condition (ii) only over characters that occur in V, treating absent parts vacuously. Keep any nonzero/faithful requirement on the ambient representation separate. Add tests for an absent character and an occurring admissible D^R character part; propagate the corrected convention into the Part II brief.

### 3. error — high

**Where:** `research/blueprint/papers/PAPER-KISIN-MADAPUSIPERA-SHIN-22.result.json: item T19 accommodating-factor diagram and sourceIssues; ShimuraVarietiesHondaTatePartII brief`.

The accommodating-factor definition imports a square whose right vertical map would go from the full GSp(V) to the product of GSp(V_j). A symplectic direct-sum decomposition does not induce that map. Merely reversing the arrow would also fail unless the factor multipliers are synchronized.

**Evidence.** The diagram in the author PDF §2.2.6, p.26, follows the words “induces a commutative diagram” and has downward vertical arrows and upper-right term G_V, where §1.3.1 defines G_V=GSp(V). T19 retains that diagram. For V=Q^2 direct-sum Q^2 with form J direct-sum J, the symplectic block-swap matrix does not preserve the two ordered summands, so restriction from full GSp(V) to both factors is undefined. Conversely diag(2 I_2,I_2) belongs to GSp_2 times GSp_2 but pulls the form back to 4J direct-sum J, not a common scalar multiple. Existing E4 repairs only the circular terminology in the same definition; E5 and E32 repair different constructions on pp.28 and 27. None repairs this square.

**Repair.** State accommodating assembly via a datum map G to the product of G_j, with the given representation equal to the direct sum of the factor representations and with equal similitude multipliers on the image of G. If using a square, factor through the subgroup product_{G_m} GSp(V_j), whose block-diagonal map goes into GSp(V), and formulate the datum maps/orbits accordingly; retain the required derived-group isomorphism. Test both block swapping and unequal multipliers. Record the additional source discrepancy at §2.2.6 with the author-copy version/hash and a bounded correction search; do not assert that the inaccessible Duke version has this defect.

### 4. error — medium

**Where:** `research/blueprint/papers/PAPER-KISIN-MADAPUSIPERA-SHIN-22.result.json: item T23.proofSteps[0–1] versus sourceIssues E5.correction`.

T23 changes the auxiliary group to the corrected fibre product but still takes the entire X times {h_T} as one Shimura datum. The accepted E5 correction already requires one real-group orbit, and has not been propagated to this active proof outline.

**Evidence.** E5.correction explicitly selects the G-prime(R)-orbit of (h_0,h_T) and warns that X times {h_T} may contain several such orbits. T23.proofSteps[0] still uses the entire product to claim a Shimura embedding. For G=GL_2=GSp_2 and an imaginary-quadratic CM torus T, G-prime=GL_2 times_{G_m} T with maps determinant and norm. The real norm on T(R)=C^times is positive, so the projection of G-prime(R) lies in GL_2^+(R). It preserves each of the upper and lower half-planes in X and cannot conjugate between them. Thus X times {h_T} has at least two orbits and is not the single conjugacy class required for the asserted datum.

**Repair.** Apply the existing E5 orbit correction to T23.proofSteps[0]. In the lifting step specify the chosen orbit/component and justify that the chosen point is covered, allowing the appropriate conjugated torus or a finite collection of data if necessary. Preserve the corrected fibre product and kernel argument. Add the GL_2/imaginary-quadratic example as a component test. This is propagation of an existing accepted correction, not a new erratum or a claim that Lemma 2.2.8 is false.

## Explicit checks and limits

For finding 1, the pinned predicate takes an ordinary morphism between two `AbelianVariety K` objects. Rationalizing Hom and then extending its coefficients is different data. The proposed correction reuses T26 and its existing A6 route; it does not propose another isogeny roadmap. The dual-number unit satisfies `(1+ε)(1−ε)=1` modulo `ε²` and tests coefficient extension without confusing it with geometric field extension.

For finding 2, the character group of the center has positive rank because of the scalar Hodge weight. There are only finitely many nonzero character spaces in finite-dimensional V. Selecting any character outside that finite set forces the tested space to be zero. The obstruction therefore arises before any difficult representation-theoretic or Noot input. Nonzero ambient V and zero individual character parts are compatible and must be kept distinct.

For finding 3, write `J = [[0,1],[-1,0]]`, `Ω = diag(J,J)`, `S = [[0,I₂],[I₂,0]]` and `D = diag(2,2,1,1)`. Exact multiplication gives `SᵀΩS = Ω` and `DᵀΩD = diag(4J,J)`. Thus a full symplectic group contains elements which exchange summands, and independent factor similitudes do not give a similitude of the sum. Reversing the displayed arrow alone does not repair the definition. The common-multiplier subgroup provides the block-diagonal map in the correct direction; the datum/orbit formulation must also be stated coherently.

For finding 4, in the imaginary-quadratic example the norm at the real place is `z ↦ |z|² > 0`. Every projected real matrix therefore has positive determinant. For a real fractional-linear transformation, `Im(gz) = det(g) Im(z) / |cz+d|²`, so it preserves the sign of the imaginary part. The two half-planes cannot lie in one orbit of the corrected group. This applies the existing E5 correction; it does not duplicate E5 as a new source error.

Several apparent defects did not survive inspection. The crystalline realization-isogeny definition separately requires descent to sufficiently large finite unramified levels, so that condition is not omitted. The F-category definition's note supplies the connected-base qualification for its scalar endomorphism assertion. E10's rational versus p-adic intersection is already correctly rejected by the review. Broad overlap between arithmetic tori, duality and endoscopic prerequisites alone does not establish a duplicate owner. No upstream roadmap change is proposed.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-KISIN-MADAPUSIPERA-SHIN-22.result.json`
- `python3 research/blueprint/intake.py check-files` on the result JSON and this report.
- `git diff --cached --check` after staging the two deliverables.
- Exact integer matrix checks and the dual-number coefficient calculation described above passed.

No Lean file is required or changed for this red-team job. No Lean compilation was run. The pinned source reads establish only the cited declarations' statements, not compilation or completion of the proposed mathematics.
