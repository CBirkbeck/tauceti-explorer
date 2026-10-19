# Independent review: Modularity of abelian surfaces (DESIGN-BCGP25)

**Verdict: accepted, with corrections made in place.** Reviewer: Claude (Opus 5.5), session `claude-y5zAkQ`, issue #908. The design was written by Claude session `claude-CyimJQ` (PR #10431, commit 8a30ee0df), so the review is independent. Review date: 2026-10-19.

Files reviewed and corrected: `research/blueprint/packets/AbelianSurfacesModularity.json`, `research/blueprint/roadmaps/AbelianSurfacesModularity.json`, `research/blueprint/readmes/AbelianSurfacesModularity.md`. The suggested file `research/blueprint/suggested/AbelianSurfacesModularity.lean` was checked and needed no change.

## Counts

| | Before | After |
| --- | ---: | ---: |
| Nodes (definitions / constructions / theorems / applications) | 46 (4 / 3 / 37 / 2) | 46 (4 / 3 / 37 / 2) |
| Verdicts | — | 22 verified, 24 corrected, 0 added, 0 unverifiable |
| API items / unit tests / planets | 49 / 31 / 23 | 49 / 31 / 23 |
| Baseline declarations | 12 | 12 (all confirmed) |
| Requests | 21 | 17 |
| Bare-stage prerequisites | 44 | 32 |
| Prerequisites on other roadmaps' nodes | 82 | 110 |
| Gaps / source findings | 6 / 3 | 6 / 3 (all confirmed) |
| Stages planned | 9 of 9 | 9 of 9 |

`scripts/check_blueprint.py` with the pinned declaration index reports 0 errors and 0 warnings after the corrections. A build test (`scripts/build.py` `assemble`, with the promoted blueprints plus this packet, reader and definition) succeeds: the roadmap enters with its nine layers and 23 planets.

## Sources read

- BCGP25, arXiv:2502.20645v1 (the only version; SHA-256 51d7eacc…5da4e95c, identical to the file the design read), fetched 2026-10-19. Read at every node locator: §1.1 (pp. 2–4), §§1.8.9–1.8.25 (pp. 10–16), §§5.2–5.3 (pp. 117–120), §6.4 (pp. 149–151), the statement of Theorem 7.5.11 (p. 179), §8 (pp. 179–186), §9 (pp. 186–209) and §10 (pp. 209–222). Printed page numbers equal PDF page numbers.
- The reviewed extraction `PAPER-BOXER-CALEGARI-GEE-PILLONI-25` (findings E001–E075), for the corrections the packet carries.
- Every supplier node the packet cites, in its packet under `research/blueprint/packets/`, and the Tau Ceti layers cited (AlgebraicCurves layer 10, PolynomialGaloisGroups layers 0 and 4, EllipticCurves layers 3 and 4, StableReduction layer 0) in the atlas snapshot and the TauCetiRoadmap checkout.

No source text is quoted in the packet, reader or this report.

## How the checks were done

1. **Statements against the source.** Each node's statement, hypotheses and proof route was read against the cited pages. The statements are faithful. The corrections the packet carries from the extraction (E028, E037–E041, E043–E046, E048–E051, E053, E069, E071, E073) were checked at their locators and are used correctly.
2. **Independent computations** (plain Python scripts, scratch only), which reproduce part of the finite certificates of gap 3:
   - the ordinary Weil quartics of weight one: 16 for p = 2 and 40 for p = 3; Table 9.2.5 row by row, with its reductions mod 3;
   - the enumeration of Lemma 9.1.6 over F₂: 2¹¹ equations, 768 smooth genus-two curves, 384 ordinary and 384 non-ordinary. The distribution of Q mod 3 matches every count in the lemma; the split between 6G and 6H needs the degree-27 resolvent and was not reproduced;
   - the enumeration of Lemma 9.3.1 over F₃: 1296 smooth, 864 ordinary, ten with Q a square, none of them with a rational Weierstrass point. Columns 3–5 of all 40 rows of Table 9.3.3 are reproduced exactly;
   - the Frobenius polynomials at 2 of C₁, C₂, C₃ (Lemma 9.1.4), and Q₂ = x⁴ + 2x² + 4 for the conductor-797 curve (E041 confirmed);
   - Q₃ for the ten curves of the table at 3 in the proof of Lemma 10.3.6: nine are ordinary and not squares, and the [2,2,2] curve has Q₃ = (x² + 2x + 3)² (E053 confirmed). For the replacement Res_{F₉/F₃}E with t = i, E is ordinary (j = 2 ≠ 0 in F₉), so the Weil restriction is ordinary, and an ordinary Q = x⁴ − ax² + 9 cannot be a square, so it is 3-distinguished;
   - the isomorphism ι of Lemma 8.1.3: the Gram matrix of r₁ − r₂, r₃ − r₄, r₃ − r₅, r₁ − r₆ is J, the three matrices of the lemma are reproduced with columns the images of the basis vectors, and so are the matrices of Remark 5.2.8 and Lemma 8.2.4. The two matrices printed on p. 203 are the images of the inverse permutations (E2 confirmed);
   - the remaining finite algebra in the proofs: the sizes in Lemma 9.1.3 add up to 25920; the squares of lifts in the classes 2C and 2D (E037); (x² ± x + 2)² mod 3; ψ = φ² + 1 with ψ^∨ψ = [6] in Lemma 9.2.12; the Siegel parabolic centralizing ι((12)(34)(56)); 5551/46656; Q(1) mod 9 for the five classes of Remark 9.3.8; and the order-8 argument of Theorem 9.5.5.
3. **Baseline.** All twelve declarations were read at Mathlib 082e2d3 and Tau Ceti f790474 (`Matrix.symplecticGroup`, `Matrix.J`, `Matrix.charpoly`, `Matrix.IsSymm`, `Equiv.Perm`, `alternatingGroup`, `MulAction.stabilizer`, `groupCohomology.H1`, `Representation`, `Polynomial.aroots`, `TauCeti.AlgebraicGeometry.AbelianVariety`, `TauCeti.schurMultiplier`). Each exists under the cited name and module and provides what the packet says. None was removed. Neither library has a GSp₄ with multiplier, an S₆ ≅ Sp₄(F₂), Weil polynomials, Honda–Tate or thin sets, so nothing planned here is in the libraries.
4. **Suppliers.** A Sonnet subagent tabulated all 82 consumer–supplier node pairs: what the consumer takes and what the supplier states. I then read each of the 43 pairs it flagged (3 mismatches, 23 partial matches, 17 unclear) and every bare-stage request against the supplier's existing nodes. The corrections below come from that pass. Most "unclear" rows were suppliers cited only in a prerequisite list; they are not errors.
5. **Duplication.** No other atlas roadmap or TauCetiRoadmap roadmap plans BCGP25 §6.4 or §§8–10. Nodes elsewhere that cite BCGP25 are imported, not restated: R01.5 (Lemma 10.2.3), ET.7a (Lemma 10.2.4), ML.0 (Lemma 10.4.1), AP.0 and AP.7 (Theorem 1.8.17, §9.2.1, Lemma 9.3.7), A3 and A4 (§8.1.1, Lemmas 9.3.4 and 10.3.1) and R11.6 (Lemma 9.1.8). PolynomialGaloisGroups places thin sets and Hilbert irreducibility outside its scope, so IG.2 is their owner. One partial duplication was found and removed: AM.6/thin-set-approximation re-proved what IG.2/general-hilbert-local-approximation already plans (see below).
6. **Lean.** `lean-check` on the suggested file at the pins: it elaborates, and its only warnings are the four proof placeholders (lines 147, 177, 182, 187). The `decide` proofs of the S₆ facts agree with my independent computation of ι. The 0-indexed permutations in `exists_iota` give (12)(34)(56), (12) and (12345). The file follows the 2026-10-12 shape: light real-bodied definitions, statements and examples only, and no data left as a placeholder.

## Corrections made

### Suppliers re-pointed to exact accepted nodes

- **Global Godement–Jacquet.** In AM.0/modular-of-gsp4, entire continuation and the functional equation came from AL.2/godement-jacquet-functional-equation, which is the local functional equation of zeta integrals, and from AL.2/standard-order-one, which assumes entireness. Both are replaced by AL.2/global-godement-jacquet.
- **General type.** ET.4/gsp4-gl4-transfer goes in the descent direction (GL₄ to GSp₄). The step "π is of general type and has a transfer Π" now cites ML.4/non-general-type-reducible (BCGP21 Lemma 2.9.1, which covers weight (2, 2): a π not of general type has reducible Galois representations) and ML.4/gsp4-discrete-spectrum-types (general type is defined by the existence of Π). The proof step was rewritten with the Chebotarev and Brauer–Nesbitt argument.
- **Near adequacy.** BCGP25 Definition 5.3.3 is PotentialAutomorphyInfrastructurePartII:PL.4/relaxed-adequacy (Thorne's adequacy with H¹(H, ad₀) = 0 relaxed to H¹(H, ad) = 0, as in Boxer–Calegari–Gee). AM.2/a5-near-adequate now cites it. The GlobalGaloisDeformations:G7 request is narrowed to White's reasonableness, and gap 6 no longer lists near adequacy.
- **Bare-stage requests that accepted nodes already meet.** These requests were removed:
  - NeronModelsAndSemistableAbelianVarieties:R11.5 (local factors, ℓ-independence, purity, conductors, Néron–Ogg–Shafarevich) is met by R11.5/local-euler-polynomial, R11.5/neron-ogg-shafarevich, R11.5/conductor-import, R11.5/good-isogeny and R11.6/strict-compatible-system-export;
  - LocalGaloisDeformationRings:R08.2 (no eigenvalue ratio 2, so all lifts are unramified) is met by R08.2/unrestricted-away-from-p with R08.2/unramified-lifting-ring. This is exactly the adjoint form of E038;
  - ModularityAndLanglandsExtensions:ML.5 is met by ML.5/cyclic-base-change-gln, ML.5/automorphic-induction-register and ML.3/ramakrishnan-tensor-product;
  - ModularityAndLanglandsExtensions:ML.1 (Khare–Wintenberger for regular odd rank-two systems) is met by ClassicalSerreModularity:R27.6/scope-of-the-final-statement-and-the-compatible-system-export;
  - InverseGaloisAndArithmeticFundamentalGroups:IG.2 is met by IG.2/general-hilbert-local-approximation and IG.2/integral-thin-count (Serre's Theorem 3.4.4 in box form). The one input no IG.2 node gives, the generic mod-3 image of the families in §10.1 and §10.3.5, moved to the AP.7 request.
- **Faltings.** In AM.8/small-sato-tate-automorphy, Faltings's theorems now cite R28.4/semisimplicity-and-the-tate-homomorphism-comparison and R28.4/hom-comparison-for-pairs-and-the-isogeny-criterion. The R28.4 request is narrowed to Zarhin's theorem and the surjective-image deduction. Its unused citations in AM.0/isobaric-modularity and AM.0/modular-of-gsp4 were removed; isogeny invariance is R11.5/good-isogeny.
- **The ℓ = 3 toric filtration.** AM.4/toric-reduction-cases and AM.7/bad-at-two cited R11.6/ordinary-isotropic-filtration, a p = 2 node for principally polarized surfaces. They now cite R11.3/toric-finite-filtration.
- **Honda–Tate for products.** F3/honda-tate covers simple isogeny classes only. ET.5/finite-field-tate-honda (the Frobenius polynomial determines the isogeny class) is added to AM.4/ordinary-weil-quartic and AM.5/genus-two-curves-over-F3, so that the correspondence with all 16 (resp. 40) isogeny classes, products included, has a supplier.
- **Good reduction of curves.** AlgebraicCurves layer 10 treats function fields and does not define good reduction of a curve. Tau Ceti StableReduction layer 0 (families of curves and models over a DVR) is now cited by AM.4/local-two-examples, AM.4/genus-two-curves-over-F2, AM.7/good-reduction-curves and AM.7/theorem-b, with a request entry and a roadmap prerequisite.

### Mathematical and wording corrections

- **AM.0/isobaric-modularity.** The unit test `not_of_potential` asserted that potential modularity does not imply modularity. No example shows this, and conjecturally every abelian surface is modular, so the implication is expected to hold: the test was not a valid non-example. It is replaced by `twist_normalization`, which a wrong normalization of the twist would fail. A hypothesis now records that the Euler-factor-wise equality is equivalent to Definition 1.8.25 over Q, and slightly stronger over a general number field.
- **AM.0/p-distinguished.** The claim that the Galois condition covers semistable ordinary reduction is restricted to the cases used: good ordinary reduction at any p, and semistable ordinary reduction at p = 2. The step from the isotropic filtration to the Borel shape is now spelled out.
- **AM.6/thin-set-approximation.** The node now derives Lemma 9.4.1 from IG.2/general-hilbert-local-approximation. A smooth rational Z satisfies weak approximation, and the complement of a thin set contains a Hilbert subset. The source's counting proof is kept as the alternative route, through IG.2/integral-thin-count. A note in restructure entry 1 records that the node is a corollary, not a second plan.
- **AM.8/mod-two-realization.** AbelianSchemesAndArithmeticModuli:A4/genus-two-jacobian-lifting is stated for odd p and for a Jacobian special fibre. Res_{F₉/F₃}E is geometrically a product with its product polarization, so the lemma does not apply at 3. It was removed. The [2,2,2] bridge now follows the product-seed argument of AP.7/local-three-seeds, which is added as a prerequisite and stays under gap 4. The p = 2 Torelli comparison that the 2-adic step needs is added to gap 5.
- **AM.3/two-adic-modularity and AM.7/fifteen-image-modularity.** AbelianVarietiesIsogenousToNoJacobian:G0/serre-open-image is stated for principally polarized surfaces. It is now applied after an isogeny to a principally polarized surface over a finite extension, which changes neither End(A_{Q̄}) nor the identity component of the Zariski closure.
- **AM.3/residual-a5-automorphy.** The finite-image complex lift is spelled out from the ℓ-adic lifting node.
- **AM.8/potentially-abelian-automorphy.** The dichotomy of Lemma 10.2.4 is attributed to the R01.5 decomposition for n = 2, with ET.7a for the induced case.
- **AM.5/product-fibre-remark.** The parenthesis explaining why E₋₁ × E₂ is not the Jacobian of an ordinary curve was muddled. It now gives the reason: its 3-torsion is a twist of the trivial module, but Q is not a square.
- **AM.4/six-g-construction.** The explicit Calegari–Chidambaram–Roberts formulas are recorded as data of the certificate. AP.7 gives only the rationality of P(ρ̄).
- **AM.7/three-adic-transfer.** The Arthur dependency is now stated in the hypotheses, as in the sibling nodes.
- **Requests.**
  - The AP.7 request now covers local fields of characteristic 0 (Definition 9.2.1 allows them).
  - It also asks for the geometric connectedness of 𝒜₂(3) and 𝒜₂(6) over Q(ζ₃), which gives the generic mod-3 image GSp₄(F₃) used in §10.1 and Lemma 10.3.6.
- **Gaps and coverage.** Gap 3 records the independent reproduction listed above. Gap 6 lists reasonableness instead of near adequacy. The `remaining` lists of AM.2, AM.6 and AM.8 were updated.
- **Source findings.** E1, E2 and E3 carry review verdicts, all confirmed. E1 is a routine omitted step: the unramified quadratic twist by Q₂(√5) = Q₂(ζ₃) keeps good ordinary reduction, the rational Weierstrass point and distinct unit roots. No new source finding was needed. The other slips met in §9 (E043, E044) are already in the extraction.

### Roadmap definition and reader

- **Roadmap definition.** The stage `requires` lists were recomputed from the node prerequisites; they change for AM.0, AM.2, AM.3, AM.4, AM.7 and AM.8. ClassicalSerreModularity and `tauceti:TauCetiRoadmap/StableReduction` were added to the roadmap prerequisites.
- **Reader.** The reader's node sections are generated from the packet. I checked that my renderer reproduces all 46 original sections byte for byte. I then re-rendered the 24 corrected node sections, the imported-nodes and requests tables, the six affected layer dependency lines, the gaps and restructuring sections, and the order-of-work and corrections notes. The reader now agrees with the corrected packet.

## Baseline citations removed or fixed

None. All twelve are confirmed.

## Nodes added

None. The plan's target-level granularity is right: every target of AM.0–AM.8 is a node, and every key result a target needs is a node or an imported node.

## Remaining open items (recorded, not blocking)

- **The lifting theorem (gap 1).** Theorem 7.5.11 belongs to GSp4NonregularModularityLifting, whose design is still pending. Until it has stage ids, the request stays parked at AP.5 and AP.0. It also rests on Theorem 4.12.4, which HigherHidaAndColemanTheory does not plan (checked: its sources are Boxer–Pilloni, not BCGP25 §4), and on Theorems 5.7.14 and 6.3.4.
- **Requests that remain.**
  - Zarhin's theorem, at R28.4;
  - Kisin's local constancy, at R11.6;
  - dyadic Hida theory from parallel weight one, at R21.2;
  - reasonableness and integral enormity, at GlobalGaloisDeformations; DESIGN-GlobalGaloisDeformationsPartII is pending;
  - p-distinguishedness in characteristic zero at p = 2, at L7: L7/gsp4-borel-ordinary-conditions assumes p > 2 and distinct residual characters;
  - Lemma 5.2.7 for general n, at PL.4;
  - products and orthogonal twists with their polarizations, at A2;
  - the properties of P(ρ̄) and the level-3 and level-6 moduli, at AP.7.
- **Other gaps.** The certificates (gap 3, partly reproduced here), the two local repairs of §10.3 (gaps 4 and 5) and Arthur's classification (gap 2).

## Questions for the orchestrator

1. **Duplicate review job.** `REV-DESIGN-AbelianSurfacesModularity` is pending in the queue and reviews the same four files as this job. Its design job `DESIGN-AbelianSurfacesModularity` (#3473) is marked done because DESIGN-BCGP25 delivered those files. Restructure entry 3 asks to close the duplicate design; the duplicate review should be closed with it, so that the packet is not reviewed twice.
2. **The imported BCGP18 roadmap is still under revision.** AbelianSurfacesPotentialModularity is `needs_changes` (REV-DESIGN-AbelianSurfacesPotentialModularity), and its revision `DESIGN-AbelianSurfacesPotentialModularity~2` is pending. This plan imports seven of its nodes: AP.0/weight-two-galois, AP.0/automorphic-compatible-system, AP.0/automorphic-abelian-variety, AP.0/modular-gsp4-representation, AP.6/galois-types, AP.7/odd-theta-cover and AP.7/local-three-seeds. If the revision renames them, these citations must follow, and the AP.7 request should be passed to that revision.
3. **The identification ι.** Two other roadmaps presuppose the identification S₆ ≅ Sp₄(F₂) that AM.2/s6-sp4-identification constructs: AbelianSchemesAndArithmeticModuli:A3/genus-two-two-torsion ("equivariantly under S₆ ≅ Sp₄(F₂)") and the API item `sixWeierstrass_equiv` of AP.7/odd-theta-cover. If A3 goes to Tau Ceti first, the group-theoretic part of ι (the matrices and the subgroups S₅(a), S₅(b), A₅(b)) should move down to A3, and this roadmap would import it.
4. **R11.6/ordinary-residual-point-export.** As restructure entry 1 already proposes, this node should cite AM.2/siegel-parabolic-two-group for the finite-group input it records as imported.
