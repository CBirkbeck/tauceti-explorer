# BP-OrdinaryAutomorphicFormsAndModularityLifting — target-level pass complete

Codex — session `codex-jCEuMc`, 14 October 2026. Refs #962.

The packet is **complete** under PROTOCOL §0: all six stages R21.1–R21.6 are **planned**, with every target represented or imported and every unresolved prerequisite named. No stage is closed. This submission completes the planning pass and goes to independent review; it is not a checkpoint, a gap-free closure claim or an implementation claim.

## Deliverables and counts

The existing packet was continued rather than discarded. Its retained arithmetic IDs and the earlier workers’ source provenance survive. Four local BLZ nodes were transferred out, and twelve target/comparison nodes were added: 96 nodes total (11 definitions, 13 constructions, 20 lemmas, 46 theorems, 4 comparisons, 2 applications), 117 API items, 82 discriminating unit tests, 31 planets, and 12 pinned baseline declarations. Every definition/construction has at least three tests. Every implementation status remains `unchecked`.

The reader contains all 96 target statements, hypotheses, prerequisites, proof routes, locators and checks, every API statement and test, the 29 supplier contracts, and the six gaps. It is organized around targets rather than paper sections. Source excerpt fields were removed; mathematical statements and findings are in our own words. Historical source issues E1–E15 remain, including the unresolved substantive E11 and E14 findings.

The suggested Lean file contains two light definitions over existing finite-set carriers, two endpoint identities, their computed examples and the retained global arithmetic sanity checks. The commented placeholder definitions and the transferred local BLZ examples were removed. Heavy arithmetic definitions and lifting theorems are reader targets, since their carriers are absent at the pins.

## What changed mathematically

- R21.2 imports Hida control and now specifies its arithmetic Hecke/Galois compatibility, finite/torsion-free and freeness hypotheses, and the Hilbert weight change to weights {0,2}, determinant ε⁻²ω and unchanged residual representation. Preserving other components requires the separate NT global target.
- R21.3 now specifies the fixed-determinant nearly ordinary tangent condition, its fixed-inertial-quotient refinement, and how an actual integral Hecke-family representation enters it. It imports LocalGaloisDeformationRings L8’s determinant/flag comparison and claims equality of spectra on the distinct-character locus and the specified component dimensions, rather than a nonreduced ring isomorphism. The split local presentation now uses the existing L7/residually-split-nearly-ordinary-ring ID.
- R21.4 retains `formal-patching-datum` and `formal-patching-theorem`, but their meanings are arithmetic axiom verification and application. The generic k[[T]] patching datum, trace-subring axioms, uniform torsion, B_N action and abstract theorem are requested from DeformationAndDerivedPatchingAlgebra R03.5, with complete-intersection criteria from R03.3. They are not duplicated here.
- R21.5 retains the restricted SW01 route and adds the original-scope target `nearly-ordinary-irreducible-lifting-full-scope`. The false CM minus-rank estimate has not been used to certify it. Pan’s p=3 exclusion and the genuinely needed Skinner–Wiles branch remain explicit.
- R21.6 contains the ordinary weight-zero seed, the exact BLGG12 Theorem 6.1.9 prescribed-type/component lift, BLGG13’s adequate-image branch and full Theorem A, the exact BCGP p=3,5 weight-two/trivial-nebentypus refinement, the q-adic Steinberg construction in NT Proposition 6.1, and NT Lemma 3.1’s component-preserving ordinary weight change. BLGG12 lifting does not imply ordinarity unless ordinary components are chosen; BLGG13’s headline theorem does not by itself fix weight or determinant.
- In the BCGP refinement, full projective A₅ and cyclotomic projective A₅ are distinguished. Order-four inertia excludes the former. In the latter case the determinant/scalar argument reduces the representation to GL₂(F₅), meeting BLGG13’s exceptional realizability hypothesis. The finite-group classification/scalar contract is requested from R01.4 and must be independently checked; no implication from excluding full A₅ alone is assumed.
- Corrected the inherited merely-nice-prime test to use inverse images under a quotient, distinguished quotient dimension from height, tightened the Ribet-class local vanishing explanation, and added a uniform-constant test to Hypothesis H.

## Red-team routing and ownership changes for the maintainer

No other packet, atlas data, link file or restructuring record was edited.

| Finding | Treatment here | Owner/graph follow-up |
| --- | --- | --- |
| RT-AREA-langlands-2/17 | R21.5 imports the crystalline-to-ordinary criterion from R06.4; the four local BLZ nodes are removed | PadicHodgeTheory R06.4 is the single owner, including KW II Lemma 3.5(i) and weight p+1. Apply the acyclic R06.4 → LocalGaloisDeformationRings R08.5 link and amend RS-06/RS-08’s old owner records |
| RT-AREA-langlands-2/31 | No direct Wach/BLZ development remains in R21.5 | The R06.4 transfer carries PhiGammaModulesAndIwasawaCohomology PG.6, hence PG.0–PG.3, and the applicable PG.7/Dee input. Move the old PG requests and the Breuil-reduction proof leaf to that owner |
| RT-AREA-langlands-2/32 | Exact distinct-prime Washington class-group bound requested from IntegralIwasawaTheory L4; direct theorem-a prerequisite added | Add L4 → R21.5 and the owner’s Part II theorem; Ferrero–Washington μ=0 is insufficient |
| RT-AREA-langlands-2/33 | Explicit R17.4 prerequisite and exact solvable transfer/descent request | Add GL2AutomorphicRepresentationsAndTransfer R17.4 → R21.5; the unread Duke residual-level construction is a separate contract |
| RT-AREA-langlands-2/34 | BLGG ordinary-lift interfaces placed in R21.6, after arithmetic R=T, with exact BCGP hypotheses | Higher PotentialModularity/PotentialAutomorphy consumers import these lower-rank interfaces. No incoming edge to a higher-tier automorphy roadmap was added |

The transferred IDs were:

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/crystalline-family-v-k-ap`
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/blz-reduction-theorem`
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/reduction-of-v-k-zero`
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/crystalline-reducible-reduction-is-ordinary`

Consumers of these old IDs must point to PadicHodgeTheory R06.4’s criterion and its needed supporting targets. That supplier’s existing endpoint node is a lead; the request specifies the entire 2 ≤ k ≤ p+1 contract. Historical E10 about BLZ remains for provenance, and its local mathematics is not a new R21 target.

BLGG12’s rank-two tensor automorphy/untwisting interfaces, BLGG13’s adequate-image ordinary automorphy input and NT’s rank-two component-lifting argument must be established at this owner before the higher-tier consumers import them. Their unresolved internal proof chains are the sixth explicit gap. No higher-tier general automorphy theorem was silently used as a prerequisite. Quadratic automorphic induction and Langlands–Tunnell are separately requested from R17.5, rather than mistaken for R17.4 base change.

## Remaining work: independent review and six proof/source gaps

All 29 supplier requests remain open and have their exact contracts in the packet/reader. The substantial unresolved inputs are:

1. **Raynaud connectedness:** read the primary proof supplying SW99 Appendix A.1–A.2 and establish the exact Cohen–Macaulay/number-of-equations connectedness and component-intersection bound in DDPA R03.6. Its current particular patched-domain statement is narrower.
2. **Washington:** read and establish the bounded p-primary class groups in a cyclotomic ℤ_ℓ-tower of an abelian field for p≠ℓ, in IntegralIwasawaTheory L4.
3. **Waldschmidt:** verify the p-adic unit-rank theorem used in SW99 (4.20), (4.24), and the totally real quadratic minus-rank instance, as a DT.3 extension. Complex logarithm bounds do not supply it; do not apply it to CM minus units.
4. **Residual-level solvable base change:** obtain and read Skinner–Wiles, *Base change and a problem of Serre*, Duke 107 (2001), 15–25. Public publisher/repository/citation links did not yield the primary paper here. R17.4 receives the precise application request, with primary-statement verification still required.
5. **Original SW01 dihedral scope:** obtain Skinner’s cited 2009 preprint *Nearly ordinary deformations of residually dihedral representations*, or supply a valid alternative proof. Resolve E11 before using the full-scope target, especially the imaginary-quadratic degenerate cases over ℚ. The retained restricted target is conditional on the specified dimension bound and other open inputs.
6. **Rank-two ordinary automorphy/components:** close the tensor seed, adequate-image descent and NT prescribed-component finiteness/automorphy arguments named above. Their endpoints are planned; their internal proof chains are not certified.

The lower-owner extensions also include complete-DVR compact/discrete tower duality in PadicFamilies L5. Mathlib `CharacterModule` is only an additive character carrier and is not used as a proof of 𝒪-linear K/𝒪 duality. The exact L8 lifting-component nonemptiness/ordinary weight-two contracts and the R01.4 residual-image classification are required for the modern outputs.

A traversal of the residually reducible `theorem-a` dependency closure through available blueprint/integrated nodes and atlas stage requirements visited 560 references, with no unresolved reference and no ClassicalSerreModularity, GL2ModularityLifting, PotentialModularityAndCompatibleSystems or PotentialAutomorphyInfrastructure reference. This verifies graph-level independence for that route; open supplier contracts and proof gaps still require mathematics. The claim does not cover the irreducible export or modern BLGG/NT outputs.

## Sources and existing work checked

The pinned Mathlib 082e2d3 and Tau Ceti f790474 baseline statements were read, and the reviewed audit and accepted RS-08 narrowing/ownership records used. Existing supplier nodes were read rather than inferred from their names. The current read-only TauCetiRoadmap main and Tau Ceti arithmetic sources were searched; the nine roadmaps newer than the atlas snapshot were checked, and the LocalGaloisGroups and ProfiniteArithmetic documents were read as style/boundary references. No shared read-only build was run or changed.

New primary readings:

- BLGG12 author PDF, §6.1: Propositions 6.1.3–6.1.4, Theorem 6.1.5 and their proofs, and Theorems 6.1.7–6.1.9, numbered pp. 35–45. Published pagination is different.
- BLGG13 whole six-page author version: Theorem A, Proposition 2.1.1, Theorem 2.1.2 and the exceptional-image cases. Published MRL pagination is 67–72; the author PDF’s provisional pagination is 10001–10006.
- NT, arXiv:2212.03595v2 (19 February 2025): Lemma 2.6 and Lemma 3.1 with proof, pp. 12–14; Proposition 6.1’s q-adic BLGG application, pp. 45–49. These locators concern v2, not the Annals pagination.
- BCGP author version: Proposition 10.1.3, Theorems 10.1.4 and 10.2.6 with proofs, pp. 265–268 and 271–272; Definition 7.3.1, p. 172, and the local ordinary convention near Lemma 7.5.26, p. 206.
- ACC+, cleared author copy: Proposition 6.2.12 and its proof, printed pp. 1036–1037, PDF pp. 140–141, read directly to verify the imported L8 determinant/flag contract. No file or passage from that copy was copied into the repository or scratch space.

The inherited SW99/SW01/Hida/EPW/Mazur/DP/Khare/Pan readings and hashes remain in the packet’s source records. This run revisited the SW statements/contracts described there; it does not claim a second full page-image reading of those papers. Washington, Waldschmidt’s primary proof, the Duke base-change paper, Raynaud’s primary proof and the 2009 correction were not obtained/read. Public source PDFs and extracts were job scratch only and are deleted after submission.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/OrdinaryAutomorphicFormsAndModularityLifting.json`: **0 errors, 0 warnings**.
- Reader/packet inventory: every node, API name and unit-test name is present; every definition/construction has at least three tests; six coverage records are `planned`; at most six planets per stage.
- `lean-check research/blueprint/suggested/OrdinaryAutomorphicFormsAndModularityLifting.lean`: **compiled at the pinned shared build, exit 0, zero errors and warnings**. The file has real-bodied definitions and no admitted data or theorem proofs. It does not claim to formalise the reader’s arithmetic targets.
- `python3 scripts/check_sorry_data.py` on the suggested file: passed.
- Submission path/local-path/JSON checks and `git diff --check`: passed before opening the PR.

The next action is independent review of this complete target-level packet. Follow-ups close the named proof gaps and exact supplier contracts; they do not restart the six-stage planning pass.
