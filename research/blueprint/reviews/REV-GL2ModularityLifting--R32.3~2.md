# Independent review: GL₂ modularity lifting R32.3–R32.6, revision 2

Job `REV-GL2ModularityLifting--R32.3~2`, issue #7050. Reviewer: Codex, session `codex-uRwG87`, 8 October 2026. This reviewer wrote neither the original blueprint nor its revision.

**Verdict: accepted.** This is an independently checked target-level plan, with all four stages planned and the two explicit gaps retained. Acceptance does not certify an independent proof of Serre’s conjecture or implementation of the arithmetic declarations. The previous review’s rejection concerned a stale reader outside its edit scope; revision #6963 brought the reader into scope and synchronized it. This review checked those repairs and corrected two further mathematical interfaces, with a source-issue identifier repair in a third node.

| Measure | Result |
| --- | --- |
| Declarations | 28: 23 theorems, 3 definitions, 1 construction, 1 comparison |
| Node verdicts | 25 verified, 3 corrected, 0 added, 0 unverifiable |
| Definition/construction APIs and tests | 22 API items; 13 tests |
| Planets | 12 |
| Pinned baseline citations | 6 verified; 0 removed or replaced |
| Precise requests | 26 |
| Coverage | 4 planned, 0 closed |
| Explicit gaps | 2, retained |
| Source findings | E10 confirmed; E11 added and confirmed for arXiv v3 only |
| Suggested fragment | 2 definitions, 10 API theorem signatures, 7 examples; 17 expected `sorry` warnings |

## Corrections made

1. `totally-real-dyadic-lifting` now requires the characteristic-zero lift to be totally odd. Tung arXiv v3 Theorem 8.0.3(3), p.38, instead puts the bar on ρ. At two this residual determinant condition cannot establish determinant −1 for the lift. The proof uses odd real-place deformation conditions, whose characteristic-zero points are characterized in §3.2.5, Proposition 3.2.7, p.15. Paškūnas Theorem 1.1, p.1, explicitly requires total oddness of the lift’s determinant. The corrected statement, proof sketch, locator and discriminating local example agree in the packet and reader; the omission manifest has the same hypothesis. This is recorded as confirmed source misprint E11, scoped only to the preprint read.
2. `typed-component-specialisation` now keeps the totally odd fixed determinant and real-place odd deformation conditions. Its component-support premise explicitly contains every irreducible component; merely intersecting each component is not a general full-support criterion. The requested R31.5 export was strengthened to match. Tung Proposition 5.2.2(3) and Lemma 5.3.2, p.28, concern type-specialized finite modules and give the faithful finite unpatched module needed for nonzero fibres. The raw completed module is never substituted. All changed statement, hypothesis, source and request text is synchronized in the reader and omission manifest.
3. The confirmed DP finite-order finding formerly named `GL2ModularityLifting/E1` here is now E10. Part R22.1 already uses E1 for a different Kisin finding, with E2–E9 also occupied. Updated this packet’s reference in `p-three-residually-reducible-branch`, its suggested comment and reader, preserving all 28 declaration identifiers. The original mathematical correction already required ψ finite order. The earlier reports keep their historical identifier; E10 refers to that same DP finding, not an additional mistake.
4. Replaced the old review object with this review’s per-node verdicts, refreshed independent source-reading metadata, and recorded the unsuccessful version-of-record access for E11. No supplier, atlas-data or campaign file was edited.

## Source checks and limits

Downloaded all nine public source versions directly at the URLs recorded in the packet. Every SHA-256 matches its existing record. Read every node locator and compared the mathematical statement and proof sketch with the source. The source locators below are checks of this plan’s declarations and dependency claims, not an extraction or sequential summary of a source.

- DP arXiv v2 Theorems 1.4–1.7, pp.4–5; Definition 1.10/Remark 4, pp.6–7; Paso 6, p.14; the published PDF at the corresponding pp.4–5,7,14. The almost-strict definition retains de Rham and fixed regular weights; its WD exception does not remove them. DP Theorem 1.7 does not state finite order for ψ.
- Skinner–Wiles introduction theorem on the Numdam page image, printed p.6 (PDF p.3): finite coefficients, irreducibility, distinguished residual character, trivial inertia quotient and finite-order ψ are explicit. E10 is a gap in the theorem citation, not an assertion of a counterexample to the unrestricted DP theorem.
- Pan Theorem 1.0.2, p.3; Corollaries 3.5.10–3.5.12, pp.32–34; complete §4.1 setup, pp.38–40; Theorems 5.1.2/6.1.2, pp.71,95–96; §§7.1–7.4, pp.111–124; Theorem 8.0.1 and Remark 8.0.4, pp.124–125. These support the three distinct residual-local branches, exact lattice predicates, finite-module classicality and the exclusion of the unconditional full-Serre consequence.
- Tung dyadic introduction pp.1–3, Proposition 3.2.7 p.15, suitable globalization pp.20–21, finite typed specialization pp.28–29, Colmez/nonordinary support pp.32–33, ordinary patching/lifts pp.36–37, and §8 pp.38–39. The ordinary and nonordinary support arguments remain separate required inputs.
- Tung odd-prime Theorem 4.7/Remark 4.8, p.15; Paškūnas Theorem 1.1, pp.1–2, and global-part discussion p.5; Emerton Theorem 3.3.22 p.28 and §§7.3–7.4 pp.96–97; Hu–Tan Theorem 6.3/proof p.35. Retaining residual modularity in usable lifting forms does not alone certify independence of every auxiliary globalization.

Checked correction records and accessible article/version/author pages as listed in the packet’s sourceIssues. No correction of E10 or E11 was located there. Tung’s [publisher page](https://link.springer.com/article/10.1007/s00209-020-02588-4) was readable, but its PDF endpoint served an HTML access page. Therefore E11 is confirmed against [arXiv v3](https://arxiv.org/pdf/1908.06174v3), not asserted against the published article. The version-of-record collation remains an orchestrator follow-up. Neither the failed response nor a passage from a source is included in the repository.

## Baseline, ownership and closure

Read the six declarations in the Mathlib source tree at `082e2d37e8b0463410cdb532e111cd43d5a66174`, with its checkout revision confirmed. Their actual signatures supply the stated uses:

| Declaration | Module and use |
| --- | --- |
| `Relation.ReflTransGen` | `Mathlib.Logic.Relation`: finite chains with reflexive seed and tail constructor |
| `Relation.ReflTransGen.trans` | Same module: chain concatenation |
| `Relation.reflTransGen_iff_eq` | Same module: no outgoing edge gives only the starting point |
| `PrimeSpectrum.comap` | `Mathlib.RingTheory.Spectrum.Prime.RingHom`: inverse-image prime along a ring homomorphism |
| `minimalPrimes` | `Mathlib.RingTheory.Ideal.MinimalPrime.Basic`: minimal prime ideals over zero |
| `minimalPrimes.equivIrreducibleComponents` | `Mathlib.RingTheory.Spectrum.Prime.Topology`: minimal-prime/irreducible-component order equivalence |

The reviewed `data/library-coverage.json` has no direct R32.3–R32.6 entry. Read its R03.6 partial/absent support and component findings; they do not already implement the arithmetic lifting theorem. Searches for modularity lifting, pseudo-representations/characters, reducibility ideals and completed cohomology/homology in pinned Mathlib and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` found no matching arithmetic interfaces. Generic relations, prime spectra and minimal primes are reused, not replanned. The upstream Multiquadratic and SemisimpleAlgebras documents and the four live stage briefs were used for scope and density.

Read every cited external node statement (13 prerequisite occurrences, nine distinct exports) in the R22.1, R03.6, OrdinaryAutomorphicFormsAndModularityLifting and R24.3 packets, including their hypotheses. R03.6’s two near-faithful statements require finite modules. The ordinary packet supplies the exact SW p=3/general-Q statements and the crystalline range used here; it does not supply Pan’s scalar chosen-character refinements. The R24.5 compatible-system carrier explicitly omits all-member de Rham in its historical almost-strict form. The extra DP geometric data is therefore a precise request, not a false projection. Other supplier packets’ unresolved review/implementation status is not presented as accepted mathematical implementation here. The R03.6/P7 packets do not substitute derived Nakayama for finiteness of a raw completed module or supply Pan’s exact connectedness theorem.

Every node’s proof has its direct local or supplier prerequisites. Checked all 26 requests and their neededBy edges, source-level specificity and ownership. They retain the extra-S cohomological vanishing, dimension-one trace-cut selection on component intersections, exact local pseudo-ring case table, ordinary orientation, real-place oddness, finite type module and source-independence exports. Screened all 36 link maps: none has an entry touching these four scope stages. The local declaration graph is acyclic; none of this part’s declarations imports an R33 endpoint or the downstream R24.6 bundled transfer node. No missing proof leaf is concealed as a routine lemma. At target level, no additional proof-step nodes are needed.

The two gaps remain honest: exact independent auxiliary-source proofs are an R31.6/R20.6 obligation, and unavailable arithmetic carriers prevent complete Lean theorem signatures. Each coverage remaining-list records those obligations. `complete` denotes a completed target-level pass; all four stages remain `planned`, with zero closed stages.

## API, tests, reader and red-team check

The four definition/construction interfaces have 6,6,5,5 API items and 3,3,4,3 discriminating tests. Nice versus potentially nice distinguishes Hecke occurrence, normalization lattices and constant versus merely finite away-p images. Good-component tests reject empty seeds and a shared point outside the potentially-nice set, and require the intermediate component in a two-edge chain. Extension-component tests use identity, zero target and a kernel obstruction. The arithmetic tests remain precise omissions pending their actual carriers. The executable prototypes use concrete sets/ring maps and genuine Mathlib objects; no arbitrary proposition wrapper stands for a missing theorem.

Checked the suggested fragment and every indexed arithmetic node/API/test against the packet. All 12 planets name definitions or central mathematical results, with no source-locator labels. Checked the reader against every node statement, hypothesis, proof step, prerequisite and source locator, plus all requests and consumers. The prior reader correction list is satisfied, including ordinary quotient normalization, Pan’s scalar/cyclotomic branches, DP versus KW geometric data, and the explicit supplier gaps. New corrections are synchronized too.

Read RT-AREA-langlands-2/21 and its confirmed independent verdict. R32.6 owns the modern ramified residually reducible coefficient-prime transfer. The actual R24.6 local-hypothesis and linked-transfer statements preserve reduction/specialization work and import R32.6, rather than reconstructing Pan here. This packet uses the earlier R24.5 carrier and R01.5 recognition; it does not import R24.6 back. Its ownership proposal and reader preserve this arrangement, without claiming that the live base-description repair was performed by this review.

## Per-node verdicts

- `GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting` — **verified**. Tung Theorem A, p.2, and Paškūnas Theorem 1.1, pp.1–2: residual modularity and nonsolvable image remain hypotheses; monodromy supplies potential semistability without changing the weight gap. The totally real supplier now explicitly requires the lift to be odd.

- `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur` — **verified**. Pan Theorem 1.0.2, p.3: characteristic-zero irreducibility and the p=3 exclusion are preserved. The ordinary cases use exact 5.1.2/6.1.2 exports; the nonordinary cases use the separate generic, scalar and cyclotomic paths.

- `GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur` — **verified**. Pan Theorem 8.0.1, p.124, has residual modularity, cyclotomic absolute irreducibility and absolute local irreducibility with the p=3 extension exclusion. Remark 8.0.4, p.125, is excluded from the independent Serre route. The broader introduction consequence is not substituted.

- `GL2ModularityLifting:R32.5/p-three-residually-reducible-branch` — **corrected**. Skinner–Wiles introduction theorem, printed p.6, and DP Theorem 1.7, arXiv p.4/published p.5: finite-order determinant factor, actual inertia quotient, finite coefficients and residual 1⊕ω₃ retained. Updated the source finding reference to E10 to remove its collision with part R22.1; the mathematical statement already had the qualification.

- `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd` — **verified**. DP Theorem 1.4, p.4, Tung dyadic introduction pp.1–2 and odd-prime Theorem 4.7, p.15: the two lifts each meet the hypotheses, a modular member supplies residual modularity, and part R22.1 supplies the lifting and quadratic/cyclotomic restriction comparison. The supplier is planned, not asserted implemented.

- `GL2ModularityLifting:R32.6/transfer-dyadic` — **verified**. DP Theorem 1.5, p.4: congruence with a modular member supplies the modular residual representation; both lifts retain oddness and regular de Rham hypotheses, while nonsolvable residual image ensures irreducibility.

- `GL2ModularityLifting:R32.6/transfer-residually-reducible` — **verified**. DP Theorem 1.6, p.4, and Pan Theorem 1.0.2: no residual modularity or coefficient-prime WD comparison is required. Characteristic-zero irreducibility and the exceptional p=3 branch remain separate.

- `GL2ModularityLifting:R32.6/de-rham-lifting-and-almost-strict-systems` — **verified**. DP Definition 1.10, pp.6–7/published p.7, keeps all-member de Rham and common regular weights despite its WD exception. The actual R24.5 compatible-system statement lacks these premises in its historical KW carrier; the explicit extra-data request supplies them. No general existence theorem is inferred.

- `GL2ModularityLifting:R32.6/globalisation-dependency-audit` — **verified**. Tung §4.3, pp.20–21; Paškūnas p.5; Pan Remark 8.0.4, p.125; Emerton pp.28,96–97; Hu–Tan p.35 identify the exact auxiliary and full-Serre uses. Verified the bounded comparison, not the uninspected leaf proofs: R31.6/R20.6 requests and the source-independence gap expressly remain.

- `GL2ModularityLifting:R32.3/typed-component-specialisation` — **corrected**. Corrected to totally odd characteristic-zero fixed determinant and odd real-place deformation points (Tung Proposition 3.2.7, p.15). Replaced ambiguous component meeting with full support containing every component; Proposition 5.2.2(3) and Lemma 5.3.2, p.28, use the type-specialized finite module. Updated the precise R31.5 export and reader/manifest.

- `GL2ModularityLifting:R32.3/totally-real-dyadic-lifting` — **corrected**. Corrected total oddness to det ρ(c_v)=−1 for the characteristic-zero lift. Tung arXiv v3 Theorem 8.0.3(3), p.38, puts a bar on ρ, but Proposition 3.2.7, p.15, and the odd deformation setup require the lift condition. New confirmed preprint-only misprint E11 records this. The solvable field, nonsolvable-image preservation and descent suppliers remain explicit.

- `GL2ModularityLifting:R32.4/nice-prime` — **verified**. Pan Definition 4.1.4 and Remarks 4.1.5–4.1.6, p.39: characteristic-p dimension-one Hecke prime, normalization lattice, nonsplit reduction, dihedral disjointness and constant away-p restriction are retained, with the pseudo-ring contraction witness and §4.1.2 maximal Eisenstein ideal. Six APIs and three tests distinguish these conditions.

- `GL2ModularityLifting:R32.4/potentially-nice-prime` — **verified**. Pan §7.2.4, p.114: characteristic-p dimension one, irreducibility and finite away-p images do not assert Hecke occurrence or a nice lattice. Six APIs/three tests retain the carrier distinction; coefficient extension includes the irreducibility premise.

- `GL2ModularityLifting:R32.4/nice-prime-component-bridge` — **verified**. Pan Theorem 4.1.7/Corollary 4.1.8, pp.39–40: a component through the nice prime lies in the closed Hecke image via localized nilpotent kernel. Corollary 3.5.12, pp.32–34, needs absolute local irreducibility; the precise R06.2 weight/coefficient argument supplies it for G_Qp. Both R31 classicality and R17 transfer are direct inputs.

- `GL2ModularityLifting:R32.4/large-component-at-regular-point` — **verified**. Pan Lemma 7.1.3 and §7.1.4, p.112: h¹−h²=2d, integral component dimension ≥1+2d, finite generic away-p inertia characters and the enlarged abelian-field setup are retained. Deformation comparison, away-p analysis and global duality are requested from their owners.

- `GL2ModularityLifting:R32.4/generic-ordinary-intersection` — **verified**. Pan Lemma 7.2.1/Corollary 7.2.3, pp.113–114: principal ordinary ideals lose at most d dimensions, ordinary finiteness gives a surjective Λ component, and abelian Leopoldt excludes its small reducible locus. The residual ratio excludes 1 and both cyclotomic orientations.

- `GL2ModularityLifting:R32.4/scalar-ordinary-intersection` — **verified**. Pan Lemma 7.3.1/Corollary 7.3.2, pp.115–116: the chosen-character cover contributes two parameters per place and three equations; the bound is 1+2d+2d−3d. Exact local and ordinary scalar exports are requested, not substituted by the distinguished SW theorem.

- `GL2ModularityLifting:R32.4/potentially-nice-base-change` — **verified**. Pan §§7.2.4–7.2.5, pp.114–115, and scalar continuation p.116: the trace-cut dimension argument produces an irreducible finite-away-p prime; solvable restriction and dense ordinary modular points then give the nice lattice and Hecke maximal ideal. The exact R04 field/prime-selection requests retain all restrictions.

- `GL2ModularityLifting:R32.4/good-component` — **verified**. Pan Definition 7.4.1, p.116: a finite seeded chain requires a potentially nice point in the ordinary closure at its start and potentially nice shared points on every edge. ReflTransGen encodes the length-one seed. Five APIs and four tests catch empty seeds, omitted intermediate components and non-nice intersections.

- `GL2ModularityLifting:R32.4/extension-components` — **verified**. Pan Definition 7.4.21, p.121: minimal prime points in the image of the whole Spec R_B, not all minimal primes or just a selected open, index Z_B. The imported trace map and pinned component correspondence give the concrete prototype. Five APIs and three tests catch zero targets and kernel obstructions.

- `GL2ModularityLifting:R32.4/extension-component-control` — **verified**. Pan Lemmas 7.4.15–7.4.19/Corollary 7.4.20, pp.119–121: the reducible locus is a closed subscheme, not the nilradical reduction. The H¹ comparison, extra-S vanishing, connectedness and trace dimension/minimal-prime assertions are precise owner requests.

- `GL2ModularityLifting:R32.4/extension-component-propagation` — **verified**. Pan Corollary 7.4.22, p.121: the 2d−1 intersection is outside the ≤d+1 reducible locus in the degree-enlarged setup; the trace dimension gain and trace cuts produce a potentially nice shared point. Its generic intersection does not require finiteness over Λ; R04.3 states the needed general prime selection.

- `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness` — **verified**. Pan Proposition 7.4.3 and proof, pp.117–124: retains all three ordinary-prime cases, the two-generator global cyclotomic ideal, localized principality only off the exceptional singular point, extension-ring connectedness and the height≤1 GMA comparison. All additional algebraic and ordinary work is routed to owners.

- `GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity` — **verified**. Pan Theorem 7.1.1/Lemma 7.4.2, pp.111–116: abelian totally real p-split field, odd globally extendable residual ratio and irreducible regular de Rham local representations are explicit. The finite chain uses one auxiliary solvable extension; final classicality and descent remain direct suppliers.

- `GL2ModularityLifting:R32.5/ordinary-character-normalisation` — **verified**. Skinner–Wiles printed p.6 and DP arXiv p.4/published p.5: choosing the global residual constituent of the actual unramified quotient makes its Teichmüller twist unramified locally, changes ψ to ψη⁻², and preserves weights and determinant oddness. Global ratio ω₃ is stronger than merely locally distinguished.

- `GL2ModularityLifting:R32.5/crystalline-weights-two-four-completion` — **verified**. DP Paso 6, p.14, and the actual R21.5 crystalline-reducible-reduction-is-ordinary statement: k=2,4 are in 2≤k≤p+1 at p=3, residual inertia characters are distinct, and quotient normalization permits the general SW theorem. Level-one global ratio identification is kept separate.

- `GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime` — **verified**. DP Definition 1.10/Remark 4, arXiv pp.6–7/published p.7: explicit all-member geometric data permits Pan at ramified p≥5 without WD equality. R19.3 and R01.5 recognition identify the family at good primes. R32.6 is the sole modern-transfer owner; importing R24.6 back is avoided.

- `GL2ModularityLifting:R32.6/transfer-ordinary-three` — **verified**. DP Theorem 1.7 and Skinner–Wiles: each lift separately has the finite-order quotient normalization, inertia shape and finite-order determinant factor for its own weight. Congruence does not supply these local hypotheses on a second lift.

## Validation and handoff

`python3 scripts/check_blueprint.py research/blueprint/packets/GL2ModularityLifting--R32.3.json` reports zero errors and zero warnings. Direct source-issue validation with `source_issues.check_issues` and `check_errata.versions_checked` reports no errors; source identifiers are distinct across both GL₂ packets. Additional read-only checks verify all nine hashes, packet/reader/manifest agreement, request edges and local acyclicity. `git diff --check` passes.

`lean-check research/blueprint/suggested/GL2ModularityLifting--R32.3.lean` elaborated at the pinned shared Mathlib build, exit 0, with exactly 17 `sorry` warnings and no others. Available memory exceeded 20 GB before compilation. No Lean server, library rebuild or additional Lean project was started. Elaborating the fragment checks its types, not proofs of the arithmetic theorems.

There is no outstanding revision request for this plan and no question requiring a maintainer decision. The orchestrator can accept this review and route the already recorded supplier/carrier/source-independence obligations. Collation of E11 against Tung’s version of record remains explicitly unverified. No second issue is claimed.
