# REV-DESIGN-BCGP18 — independent review

**Accepted with explicit gaps.** Codex, session codex-iVaX9l, 2026-10-18; issue [#907](https://github.com/CBirkbeck/tauceti-explorer/issues/907). The designer was Claude, session claude-miNWKw (DESIGN-BCGP18, #905). This reviewer did not write the design. The review corrects the deliverables in place and accepts the resulting target-level plan under PROTOCOL §0: prerequisite chains may end in precisely recorded gaps. It does not certify an unconditional proof, a completed implementation, or package readiness.

The packet remains a complete planning pass with eight planned stages and zero closed stages. Every implementation flag remains unchecked. Of the 57 targets, 11 are verified without mathematical/interface changes and 46 are corrected (including exact-supplier or locator corrections). Zero nodes were added, removed or split; no addedBy fields are needed. All 57 verdicts are recorded in the packet’s review.checked list.

## Inventory

- Definitions: **14**.
- Constructions: **4**.
- Theorems: **38**.
- Application: **1**.
- API items: **127**.
- Definition/construction tests: **71**.
- Planets: **31**.
- Pinned baseline declarations: **17**.
- Supplier requests: **98**.
- Recorded gaps: **10**.
- Confirmed source findings: **26**.

All 18 definition/construction targets have at least three substantive tests (minimum three, maximum five). The review checked constructors/data and point characterizations, independent-of-choice and functoriality interfaces, compatibility with the owners’ conventions, and positive/negative examples. It corrected false tests rather than adding tests that merely repeat the definition. The target-level granularity is retained: source lemmas used only in a proof sketch are not expanded into a lemma forest.

## Principal mathematical corrections

- Proposition 7.11.2, arXiv v3 p. 226 / published pp. 426–427: the defect-one action through the maximal O-flat quotient is unproved. The old reader asserted that O-flatness was proved first; it was not. The corrected patched-MCM node assumes the factorization, records G-flatness and qualifies downstream proof routes. Balancedness is not an O-flatness theorem. Remark 7.3.17 / published p. 380 expressly leaves the relevant local flatness open.
- Proposition 7.8.11, pp. 215–216: the balanced module is H⁰ RHom(C,S) for the [0,1] higher Hida complex with Euler characteristic zero. H⁰(C) has the wrong degree. The R03.5 supplier request is corrected too. Duality over a fixed Λ and duality over Λ[Δ] are distinguished in the tests.
- Theorem 7.13.6, pp. 232–234: full support does not give a faithful action of R_red. Use A=R/Ann(M), finite over S via its embedding in End_S(M). Apply the finite-module support/generalization criterion of Stacks Project Lemma 10.41.12 (Tag 080T) to the S-flat module M; do not infer flatness of A from torsion-freeness. The exact criterion is added to the R03.3 supplier contract.
- Lemma 9.2.2, pp. 254–255, through Lemma 7.5.22: inert real multiplication can yield an index-two extension of a Frobenius-twisted graph, not the advertised full wreath/semidirect product. The corrected existing G7 theorem supplies this case and its explicit multiplier −1 tidiness witness. A centre-order assertion is not used.
- Twisted moduli: since ρ̄_{A,p}=A[p]^∨, Y(V) parametrizes B[n]≅V^∨ with V=ρ̄_{A,p}⊕ρ̄_q in switching. Local points require the full paired torsion module; matching special-fibre p-torsion alone is insufficient. The fine level is odd n≥3 and geometric connectedness refers to the selected Weil-pairing component. Wrong arithmetic multiplier does not imply absence of geometric points.
- Proposition 9.1.12 / Lemma 9.2.7, pp. 252–253, 256–257: construct a fixed-determinant torsor by twisting U/SL₂ for a generically free open linear GL₂-representation. Moret–Bailly on restriction of scalars produces the representation over KE′, with no descent to K. Two auxiliary sets force full image and full SL₂ image after adjoining the avoidance field; the latter is needed for the exact intersection KE′(ψ̄). Arbitrary prime-field characters cannot simply be square-root twisted.
- Theorem 8.5.2, pp. 248–249: χ and χ′ have equal reductions, not necessarily equality. Choose compatible square roots using the odd p-power order ratio and the quadratic obstruction/local adjustment contracts, preserving the residual congruence needed to apply the untwisted theorem.
- Corollary 9.3.3 and Theorem 9.3.4, pp. 259–261: the curve reflection is 2−s; the abelian surface reflection is 3−s. The cuspidal GL₂ conclusion excludes CM endomorphisms defined over K, while the analytic conclusion applies in every case. For a genus-one curve, endomorphisms and H¹ are interpreted through its Jacobian.
- BCGP25 Corollary 9.3.6 / Lemma 9.3.7, pp. 202–203: the finite-flat ordinary extension belongs to the dual representation. The scalar seed of traces −1 and 2 realizes residual Frobenius −1, and its twist realizes +1. Its unit roots are distinct in characteristic zero, not residually distinct. The source rank in Lemma 9.3.4 must be 3⁴; 9.3.5 is a Remark and 9.3.6 a Corollary.
- Theorem 10.2.1: distinguish geometric projective level-five monodromy from its arithmetic cyclotomic action. Retain ordinary local P-points as a hypothesis; B-points need not lift through the degree-six cover. The Q₃ repair uses the later local seed theorem with its polarized lifting dependency.
- Lemma 10.3.2: retain all conjectures, including Tate, and explain the weight-one motive/Hodge structure, abelian realization, number-field descent, restriction of scalars and algebraic projector route. This remains conditional.
- Lemma 10.4.6: independently verify the corrected sextic coefficient/discriminant and both F₁₁ zeta numerators. Do not infer the full endomorphism/compatible-system conclusion from those checks. G-CM-certificate records the remaining quaternionic-action and finite non-CM certificate. Expected Lemma 10.4.4 remains a sketch with an open symplectic image requirement, not full integral similitude surjectivity.

## Per-target audit and complete change register

The following lists every node, its verdict, changed mathematical/interface fields, source locators and correction or verification. Every node also receives a review note recording that gaps propagate through prerequisites. Top-level changes are listed after the table.

| Target | Verdict; changed fields | Audit | Source locator |
| --- | --- | --- | --- |
| AbelianSurfacesPotentialModularity:AP.0/abelian-surface-system | verified | Verified H¹/dual-Tate convention, inverse cyclotomic multiplier, geometric Frobenius and independence of polarization; existing A3/A4/R11.5 supply the constructions. | BCGP18: Definition 2.8.2 and Remark 2.8.3, §2.8, pp. 36–37 |
| AbelianSurfacesPotentialModularity:AP.0/automorphic-compatible-system | corrected; proofSteps, prerequisites, sources | Definition 9.1.1 starts on p. 249. Repointed isobaric sums and their strong multiplicity-one theorem to the existing exact AS.2 and AL.3 nodes. | BCGP18: Definition 9.1.1, Remarks 9.1.2–9.1.4 and (9.1.5), §9.1, pp. 249–251 |
| AbelianSurfacesPotentialModularity:AP.0/automorphic-abelian-variety | corrected; acceptance, tests | The Hecke-character decomposition requires the CM endomorphisms over the base. | BCGP18: Definition 9.1.6 and Remark 9.1.7, §9.1, p. 251 |
| AbelianSurfacesPotentialModularity:AP.0/modular-gsp4-representation | corrected; statement, proofSteps, prerequisites, tests | Replaced the false universal quadratic-twist test by a trace test that excludes self-twists. Chebotarev and Brauer–Nesbitt identify the semisimplification; the applications have irreducible ρ. | BCGP18: Definition 9.1.8 and Remark 9.1.9, §9.1, p. 251 |
| AbelianSurfacesPotentialModularity:AP.0/weight-two-galois | corrected; proofSteps | Used reductive-pseudocharacter reconstruction for the perfect symplectic form; recorded the missing affinoid interpolation extension separately. | BCGP25: Theorem 1.8.17 with (1.8.18)–(1.8.19), Definition 1.8.16 and Remark 1.8.15, §1.8, pp. 13–14; BCGP18: Corollary 7.9.6, §7.9, pp. 220–221 |
| AbelianSurfacesPotentialModularity:AP.1/standing-hypotheses | corrected; prerequisites | Replaced the generic duality citation by the current ClassFieldTheory layer-5 local Tate theorem. | BCGP18: Hypothesis 7.7.1 and the choice of v_0, §7.7, p. 210; Hypothesis 7.8.1, §7.8, p. 211 |
| AbelianSurfacesPotentialModularity:AP.1/deformation-problems | corrected; prerequisites | Imported the exact L7/gsp4-ordinary-generic-fibres contract instead of the stale L8 stage. | BCGP18: §7.7, the two displayed problems after Hypothesis 7.7.1, p. 210 |
| AbelianSurfacesPotentialModularity:AP.1/tame-levels | corrected; tests | Restricted the neatness counterexample to maximal compact level with R = Q = ∅. | BCGP18: Definition 7.8.2 and Lemma 7.8.3, §7.8, pp. 211–212 |
| AbelianSurfacesPotentialModularity:AP.1/weights | verified | Verified both cyclotomic exponents, the parity/congruence criterion and κ₂ versus regular weight; four tests detect convention errors. | BCGP18: Definition 7.8.8 and Remark 7.8.9, §7.8, p. 214 |
| AbelianSurfacesPotentialModularity:AP.1/hecke-modules | corrected; tests | Distinguished changing only the dual target from duality over the group ring. | BCGP18: §7.8 from the definition of T̃ to Lemma 7.8.6, with (7.8.4), pp. 212–214, and the opening paragraph of §7.9, p. 216 |
| AbelianSurfacesPotentialModularity:AP.1/finite-free-balanced | corrected; statement, proofSteps | Corrected the cohomological degree: use the dual complex, not H⁰ of the original [0,1] complex. | BCGP18: Proposition 7.8.10 and Proposition 7.8.11 with its proof, §7.8, pp. 214–216 |
| AbelianSurfacesPotentialModularity:AP.2/doubling-surjections | verified | Verified direction of specialization and U-operator compatibility in Proposition 7.9.1; the Hilbert–Siegel doubling contract remains requested. | BCGP18: Proposition 7.9.1 with (7.9.2) and (7.9.3), §7.9, pp. 216–218 |
| AbelianSurfacesPotentialModularity:AP.2/hida-hecke-galois | corrected; statement, proofSteps, acceptance | Uniqueness is for the deformation class. Both refinements give the Klingen shape, whose inertial character is universal θ_v. | BCGP18: Theorem 7.9.4 and its proof, §7.9, pp. 218–220 |
| AbelianSurfacesPotentialModularity:AP.2/ordinary-weight-two-corollary | verified | Verified the added residual ordinary hypotheses and repaired solvable base change in Corollary 7.9.6; no general de Rham claim is inserted. | BCGP18: Corollary 7.9.6 with its proof, §7.9, pp. 220–221; BCGP25: Theorem 1.8.17, §1.8, p. 13 |
| AbelianSurfacesPotentialModularity:AP.2/taylor-wiles-descent | corrected; proofSteps | Separated complex-level torsor/partial-Hecke descent from the final H⁰-dual anaemic localization. | BCGP18: Proposition 7.9.8 with (7.9.9), (7.9.10) and Lemma 7.9.7, §7.9, pp. 221–223 |
| AbelianSurfacesPotentialModularity:AP.3/patching-datum | verified | Verified dimensions, mod-λ compatibility and defect bound; the already corrected open-containing-ideals patching form is retained (E24). | BCGP18: §7.11 with (7.11.1), pp. 224–226 |
| AbelianSurfacesPotentialModularity:AP.3/patched-mcm | corrected; statement, hypotheses, proofSteps, sources | Exposed extraction E125 as an unresolved defect-one flat-quotient action gap rather than asserting an unproved repair. | BCGP18: Proposition 7.11.2 with its proof, §7.11, p. 226 |
| AbelianSurfacesPotentialModularity:AP.4/lifting-hypotheses | corrected; prerequisites | Repointed ordinary generic-fibre smoothness to the exact L7 supplier. | BCGP18: Hypothesis 7.13.1, Remark 7.13.2, condition (8) and Definition 7.13.4, §7.13, pp. 229–231 |
| AbelianSurfacesPotentialModularity:AP.4/eigenspaces | corrected; acceptance | Restricted fibre-dimension/generic-rank equality to smooth supported points. | BCGP18: §7.13 between Remark 7.13.2 and Proposition 7.13.5, with (7.13.3) and Definition 7.13.4, pp. 230–231 |
| AbelianSurfacesPotentialModularity:AP.4/iwahori-multiplicities | corrected; prerequisites | Imported the existing ML.4 Gan–Takeda contract for local packet multiplicities. | BCGP18: Proposition 7.13.5 and the definitions of d_η and d_ρ after it, §7.13, pp. 231–232 |
| AbelianSurfacesPotentialModularity:AP.4/doubling-injection | verified | Verified Proposition 7.13.9 injection and its unit-root choice; it is used as an upper bound in the multiplicity theorem. | BCGP18: Proposition 7.13.9 with its proof, §7.13, p. 233 |
| AbelianSurfacesPotentialModularity:AP.4/regular-weight-dimensions | corrected; prerequisites | Removed duplicate supplier prerequisites; source statement unchanged. | BCGP18: Proposition 7.13.11 with its proof, §7.13, pp. 234–235 |
| AbelianSurfacesPotentialModularity:AP.4/multiplicity-theorem | corrected; proofSteps, prerequisites, sources | Replaced the unjustified faithful R_red-action by R/Ann(M), using the flat module criterion for generalizing maps. | BCGP18: Theorem 7.13.6 and Remark 7.13.7 with the proof, §7.13, pp. 232–234; Stacks080T: Lemma 10.41.12, Tag 080T, §10.41; unpaginated HTML |
| AbelianSurfacesPotentialModularity:AP.5/analytic-continuation-descent | corrected; proofSteps, prerequisites, sources | Included the final normalized-trace and injectivity step, and its source pages. | BCGP18: Lemmas 8.2.3 and 8.2.5 with (8.2.4) and (8.2.6), §8.2, pp. 238–243 |
| AbelianSurfacesPotentialModularity:AP.5/connected-components | corrected; statement | Superspecial implies p-rank zero; the converse is not used. | BCGP18: Lemmas 8.2.7, 8.2.8, 8.2.10 and 8.2.11, Corollary 8.2.9 and Remark 8.2.12, §8.2, pp. 243–246 |
| AbelianSurfacesPotentialModularity:AP.5/gluing-theorem | corrected; sources | Extended the gluing proof locator through its end on p. 243. | BCGP18: Theorem 8.2.1 and its proof, §8.2, pp. 237–243 |
| AbelianSurfacesPotentialModularity:AP.5/automorphy-of-rho | corrected; prerequisites | Repointed formal Koecher to C5 and retained its formal-model comparison gap. | BCGP18: Corollary 8.2.2 and its proof, §8.2, pp. 237–238 |
| AbelianSurfacesPotentialModularity:AP.5/solvable-descent | corrected; statement, proofSteps, prerequisites | Specified the finite-character variant and the restricted-irreducibility hypothesis needed for multiplier uniqueness. | BCGP18: Lemma 8.3.1, Lemma 8.3.2 and its proof, §8.3, pp. 246–247 |
| AbelianSurfacesPotentialModularity:AP.5/main-lifting-theorem | corrected; acceptance | Narrowed the claimed uses; not every result of §§9–10 uses this lifting theorem. | BCGP18: Theorem 8.4.1 and its proof, §8.4, pp. 247–248 |
| AbelianSurfacesPotentialModularity:AP.5/twisted-ordinary | corrected; prerequisites | Repointed the local ordinary generic-fibre prerequisite to its existing exact L7 owner. | BCGP18: Definition 8.5.1, §8.5, p. 248 |
| AbelianSurfacesPotentialModularity:AP.5/twisted-lifting-theorem | corrected; proofSteps, prerequisites | Retained only residual equality of χ and χ′ and chose congruent square roots before applying lifting. | BCGP18: Definition 8.5.1, Theorem 8.5.2 and its sketched proof, §8.5, pp. 248–249 |
| AbelianSurfacesPotentialModularity:AP.6/galois-types | corrected; proofSteps | Included geometrically split Q×Q endomorphisms in type B[C₂]. | BCGP18: §9.2, the classification before Proposition 9.2.1 and the definition of challenging after its proof, pp. 253–254 |
| AbelianSurfacesPotentialModularity:AP.6/non-challenging-automorphy | corrected; prerequisites | Imported exact existing isobaric sums and strong multiplicity one rather than replanning them. | BCGP18: Proposition 9.2.1 and its proof, §9.2, pp. 253–254 |
| AbelianSurfacesPotentialModularity:AP.6/big-image | corrected; statement, proofSteps, prerequisites | Repaired the semilinear graph case and tidiness witness; imported the existing corrected G7 theorem. | BCGP18: Lemma 9.2.2 and its proof, §9.2, p. 254 |
| AbelianSurfacesPotentialModularity:AP.6/good-primes | corrected; statement, prerequisites, acceptance, api | Kept seed existence and seed purity as separate requirements. | BCGP18: Definition 9.2.3 and Remark 9.2.4, §9.2, p. 255 |
| AbelianSurfacesPotentialModularity:AP.6/good-prime-density | verified | Verified positive density after q>p², q≡−1 and both quadratic discriminant-square conditions; open-image and Chebotarev remain supplier inputs. | BCGP18: Lemmas 9.2.5 and 9.2.6 with their proofs, §9.2, p. 255 |
| AbelianSurfacesPotentialModularity:AP.6/twisted-siegel-moduli | corrected; statement, hypotheses, proofSteps, acceptance, api, tests, uses | Corrected dual-torsion and local realization conditions, real involution data, and geometric points in the negative test. | BCGP18: Proof of Theorem 9.2.8, §9.2, pp. 257–258; §10.2 before Theorem 10.2.1, p. 268 |
| AbelianSurfacesPotentialModularity:AP.6/fixed-determinant-extensions | corrected; proofSteps | Supplied the fixed-determinant torsor construction and separate auxiliary places forcing full image after avoidance, needed for exact intersection. | BCGP18: Proposition 9.1.12 and its proof, §9.1, pp. 252–253, and the proof of Lemma 9.2.7, pp. 256–257 |
| AbelianSurfacesPotentialModularity:AP.6/pq-switch | corrected; prerequisites, acceptance | Corrected the q-torsion dual in the acceptance condition. Repointed prime-field residual largeness to the corrected PA.5 node; corrected the dual q-torsion acceptance test. | BCGP18: Lemma 9.2.7 and its proof, §9.2, pp. 256–257 |
| AbelianSurfacesPotentialModularity:AP.6/potential-modularity | corrected; proofSteps | Restored the missing reduction bar in the rank-two automorphic seed comparison. | BCGP18: Theorem 9.2.8 and its proof, §9.2, pp. 257–258 |
| AbelianSurfacesPotentialModularity:AP.6/gl2-quadratic-galois | corrected; prerequisites | Removed duplicate supplier prerequisites; source statement unchanged. Verified the weight-zero GL₂ input and removed duplicate ML.4 prerequisites. | BCGP18: Theorem 2.7.3 with its proof, §2.7, pp. 34–35 |
| AbelianSurfacesPotentialModularity:AP.6/potential-automorphy | corrected; prerequisites | Imported the existing ML.4 exterior-square symplectic descent target; full-packet classification remains conditional. | BCGP18: Theorem 9.3.1, Remark 9.3.2 and the proof, §9.3, pp. 258–259; Theorem 1.1.3, §1.1, p. 4 |
| AbelianSurfacesPotentialModularity:AP.6/hasse-weil-genus-two | corrected; acceptance | Made the functional-equation check positive rather than claiming absence of any other relation. | BCGP18: Corollary 9.3.3, §9.3, p. 259; Theorem 1.1.2 and Conjecture 1.1.1, §1.1, pp. 3–4 |
| AbelianSurfacesPotentialModularity:AP.6/genus-one-quadratic | corrected; statement, proofSteps, prerequisites, sources | Included the analytic conclusion in the CM case and distinguished CM endomorphisms over K; extended proof locator. | BCGP18: Theorem 9.3.4 and its proof, §9.3, pp. 259–261; Theorem 1.1.4, §1.1, p. 4 |
| AbelianSurfacesPotentialModularity:AP.6/kummer-surfaces | verified | Verified Proposition 9.4.1 target and the missing Kummer cohomology decomposition; no closed proof is claimed. | BCGP18: Proposition 9.4.1, Definition 9.4.2 and §9.4, pp. 260–264 |
| AbelianSurfacesPotentialModularity:AP.7/ordinary-surface-modularity | verified | Verified ordinary-surface modularity with finite-flat dual, residual image and purity inputs; the printed unramifiedness is correctly omitted. | BCGP18: Proposition 10.1.1 and Remark 10.1.2, §10.1, pp. 264–265; Theorem 1.1.7, §1.1, p. 5 |
| AbelianSurfacesPotentialModularity:AP.7/residual-modularity-cases | corrected; prerequisites | Imported the existing R21.6 ordinary weight-two lift and ML.4 descent nodes; their hypotheses do not replace the separate dihedral argument. | BCGP18: Proposition 10.1.3 and its proof, §10.1, pp. 265–267; §1.1 after Theorem 1.1.7, p. 6 |
| AbelianSurfacesPotentialModularity:AP.7/dihedral-crossing | corrected; hypotheses | Separated the general dihedral construction from the later totally real specialization. | BCGP18: §7.5.24 and Lemmas 7.5.25–7.5.27, pp. 205–208 |
| AbelianSurfacesPotentialModularity:AP.7/mod-five-quadratic | corrected; statement | Excluded degenerate d for which the advertised real quadratic field is not quadratic. | BCGP18: Theorem 10.1.4 and its proof, §10.1, pp. 267–268 |
| AbelianSurfacesPotentialModularity:AP.7/odd-theta-cover | corrected; proofSteps, tests | Corrected multiplicative Weil-pairing signs and included equivariance before Hilbert 90. The unique Schur-cover lift is Galois-equivariant; the multiplicative Weil pairing is −1 for one-point intersection. | BCGP18: §10.2: Definition 10.2.2, Proposition 10.2.3, Lemma 10.2.4 and Remark 10.2.5, pp. 268–271; BCGP25: §8.1 and §9.2.1, pp. 180–183 and 192 |
| AbelianSurfacesPotentialModularity:AP.7/local-three-seeds | corrected; title, statement, proofSteps, prerequisites, sources, acceptance | Moved the ordinary extension to ρ̄-dual, corrected Corollary/Remark labels, and distinguished characteristic-zero from residual unit-root distinctness. Imported exact A4 polarized and Jacobian lifting nodes, retaining G-polarized-lift; checked all four Frobenius quartics independently. | BCGP25: Lemma 9.3.4, Remark 9.3.5, Corollary 9.3.6 and Lemma 9.3.7, with Table 9.3.3 and Remark 9.4.4, §§9.3–9.4, pp. 200–206 |
| AbelianSurfacesPotentialModularity:AP.7/fixed-three-torsion | corrected; proofSteps | Used geometric level-five monodromy with the arithmetic cyclotomic action rather than claiming a constant PSp₄-cover over every base field. | BCGP18: Theorem 10.2.1 and its proof, §10.2, pp. 269–271 |
| AbelianSurfacesPotentialModularity:AP.7/infinitely-many-modular | verified | Verified the totally real quadratic H, local Q₃ seed application and dual 3-torsion convention already repaired by the designer. | BCGP18: Theorem 10.2.6 and its proof, §10.2, pp. 271–272; Theorem 1.1.5, §1.1, p. 4 |
| AbelianSurfacesPotentialModularity:AP.7/paramodular-lemma | corrected; prerequisites | Removed duplicate supplier prerequisites; source statement unchanged. Imported existing Gan–Takeda and removed duplicate ML.4 references; paramodular newform extensions remain requested. | BCGP18: §10.3 and Lemma 10.3.1 with its proof, pp. 272–273 |
| AbelianSurfacesPotentialModularity:AP.7/paramodular-conjecture | verified | Verified original versus modified paramodular propositions, conductor N² for fake surfaces, and the squared spin L-factor; four tests distinguish them. | BCGP18: §10.3 and Conjecture 10.4.3, pp. 272–273 and 277–278 |
| AbelianSurfacesPotentialModularity:AP.7/motives-conditional | corrected; proofSteps | Expanded the missing motive-to-abelian-variety route and retained every conjecture, including Tate, as a hypothesis. | BCGP18: Lemma 10.3.2 and its sketched proof, §10.3, pp. 274–276 |
| AbelianSurfacesPotentialModularity:AP.7/fake-surface-examples | corrected; hypotheses, proofSteps | Separated the expected moduli sketch from the computational example and weakened the unnecessary full-similitude-image claim. | BCGP18: §10.4.2 (p. 277), Expected Lemma 10.4.4 (p. 278), §10.4.5 (p. 279) and Lemma 10.4.6 with its proof (pp. 280–281) |

## Baseline and ownership audit

**No baseline declaration was removed or replaced:** all 17 names exist at the recorded commits and provide the limited facts claimed. Their source statements were read at the exact pins, rather than at the dependency repositories’ current HEAD. The packet now records that check for each entry. The dimension codomains and faithful scalar-action qualification were made explicit; these are limitations on use, not near-miss replacements.

| Pinned declaration | Checked convention or hypothesis |
| --- | --- |
| mathlib:NumberField.IsTotallyReal | A number field all of whose infinite places are real; the standing hypothesis on F throughout. |
| mathlib:NumberField.InfinitePlace | Infinite places of a number field; indexes the archimedean conditions (parallel weight, oddness, real points of moduli). |
| mathlib:Field.absoluteGaloisGroup | The absolute Galois group Gal(K^al/K) with the Krull topology; the group G_F on which every representation here is defined. |
| mathlib:Matrix.J | The standard alternating form [[0,−1],[1,0]] in block form on l ⊕ l; with l = Fin 2 it is a form of rank 4. |
| mathlib:Matrix.symplecticGroup | The submonoid of matrices A with A J Aᵀ = J; with l = Fin 2 this is Sp_4(R), the multiplier-one part of GSp_4(R). |
| mathlib:Nat.Prime | Rational primes; good primes and the auxiliary primes p, q are natural primes. |
| mathlib:Polynomial.Monic | Monic polynomials; the spherical Hecke polynomial Q_v(X) and the Frobenius polynomials are monic of degree 4. |
| mathlib:Module.Free | Free modules; the defect-zero Taylor–Wiles modules are finite free over Λ_∅[Δ_Q]. |
| mathlib:Module.Finite | Finitely generated modules; the patched modules are finite over S_∞. |
| mathlib:IsLocalRing | Local rings; the coefficient rings of deformation and patching are complete Noetherian local O-algebras. |
| mathlib:ringKrullDim | Krull dimension of a commutative ring; the dimension identity (7.11.1) compares dim (R_∞)′ with dim S_∞ − #I. Its codomain is WithBot ℕ∞; dimension arithmetic must be interpreted with the stated finiteness hypotheses. |
| mathlib:Equiv.Perm | Permutation groups; S_6 = Perm (Fin 6) acts on the six Weierstrass points of a genus two curve. |
| mathlib:alternatingGroup | The alternating group; A_5 and A_6 appear in the residual-image cases of §10. |
| tauceti:TauCeti.AlgebraicGeometry.AbelianVariety | An abelian variety over a field: a proper geometrically integral group scheme; the carrier of abelian surfaces. |
| tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.dim | The dimension of an abelian variety, as the topological Krull dimension of its scheme; an abelian surface has dim = 2. The codomain is WithBot ℕ∞, not Nat. |
| tauceti:TauCeti.schurMultiplier | The Schur multiplier H^2(G, k^×) of a group; Lemma 10.2.4 uses that of PSp_4(F_3) (order 2). |
| tauceti:TauCeti.IsProjectiveRep.cohomologyClass_eq_zero_iff | A projective representation whose scalars act faithfully lifts to a linear one rescaled by units exactly when its Schur-multiplier class vanishes. |

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. Mathlib’s Matrix.J is the block form [[0,−1],[1,0]], and Matrix.symplecticGroup uses AJAᵀ=J as a submonoid. ringKrullDim and AbelianVariety.dim land in WithBot ℕ∞. The Schur multiplier is ordinary H² with trivial coefficient action; the projective-representation rescaling criterion requires faithful scalar action. None provides the heavy carriers omitted from Suggested.lean.

The reviewed library-coverage data and the current Tau Ceti library were checked for duplication. The current TauCetiRoadmap tree was audited read-only at `0d144d044dacebca17b654695b6f1ad58f159b27`, with ClassicalGroups and InductionRestriction (both readers and Suggested files) read fully, plus the relevant IHG, SmoothRepresentations, ClassFieldTheory and EllipticCurves layers. Current IHG already owns reductive pseudocharacters, reconstruction, symplectic descent with prescribed multiplier, complex localization and spin/dual-spin conventions. Its integral finite-quotient interpolation is not a dense-affinoid interpolation theorem. Current SmoothRepresentations already owns the spin polynomial and positive Klingen Hecke algebra. Atlas aliases are retained for structural compatibility and annotated with exact current upstream links/sections. No current upstream layer is replanned or edited.

Exact supplier corrections include: ClassFieldTheory layer 5 local Tate duality for D7; R02.4 character roots and H² vanishing; R21.6 ordinary weight-two lifting for the stale R21.2 reference; L7/gsp4-ordinary-generic-fibres for L8; PA.5/corrected-rank-two-large-image with only prime-field SL₂; C5/formal-hilbert-siegel-koecher for C3; AS.2/isobaric-sum plus AL.3/isobaric-strong-multiplicity-one for the generic AS.4 reference; exact Fargues degree/properties, corrected G7 induced-image, ML.4 Gan–Takeda/descent/exterior-square, and A4 polarized finite-level/Jacobian lifting targets. Supplier statements and their hypotheses were read before these imports. Existing work is imported; residual Hilbert–Siegel, analytic/formal, affinoid and newform extensions remain requests.

The 99 requests after adding explicit contracts were consolidated to 98 by combining two entries for the same AdicSpacesPartII:R3 owner. No mathematical requirement was dropped. Remaining lists now distinguish existing Gan–Takeda and A4 targets from their outstanding extensions/gaps.

## Sources, gaps and document alignment

All node locators in BCGP18 v3 and the specified BCGP25 v1 inputs were checked directly. The final version/published collation and SHA-256 values are recorded in sourceVersions; the published reading is explicitly a selected collation. The BCGP25 author PDF is byte-identical to v1. The arXiv histories, journal page and author-source searches identified no later correction in the places searched. This is a dated search record, not a claim that no correction could exist elsewhere. All sourceIssues have an independent confirmed verdict and reasons in the reviewer’s words; no quotation or source-section summary has been added.

The design’s sourceIssues list was empty despite carrying corrections from the reviewed extraction in prose. It now has 26 entries: 24 with existing atlas/brief provenance and two BCGP25 rank/seed findings. The source provenance for the Tate hypothesis points to the brief/item 138, not extraction E154 (which concerns a different radical misprint). The new Stacks source entry states the exact finite-module criterion used in the repaired proof route.

The ten gaps are:

- Higher Hida and Coleman theory for Hilbert–Siegel varieties (BCGP §§4–6) has no planning owner yet
- BCGP-specific supplier extensions remain after importing existing targets
- Deuring's existence theorem for ordinary elliptic curves over F_q with prescribed trace
- Cohomology of Kummer surfaces
- Arthur's classification for GSp_4 remains conditional
- G-flatness: Defect-one action through the maximal O-flat quotient
- G-affinoid: Dense affinoid interpolation for the ordinary weight-two Galois representation
- G-analytic-formal: Shrinking-neighbourhood components and formal Koecher comparison
- G-polarized-lift: Polarized truncated-BT lift criterion in the local seed supplier
- G-CM-certificate: Finite certificate excluding CM in the explicit quaternionic example

Five gaps were already recorded in the design; five are made explicit here: G-flatness, G-affinoid, G-analytic-formal, G-polarized-lift and G-CM-certificate. Their neededBy lists and stage remaining lists record the principal consumers, and every node’s review note carries transitive dependence. Conditional Arthur input remains a stated dependency, not a theorem proved by this plan. No contradiction is hidden by marking a stage closed.

The roadmap’s summary, readme, sources, stage descriptions and stage/roadmap prerequisites were reconciled with the corrected targets. The detailed reader was rewritten from that inventory, preserving all statements, hypotheses, sources, proof routes, acceptance checks, 127 API items and 71 tests, plus exact supplier contracts, ten gaps and source findings. Its reproducible arithmetic appendix records the exact resultant method, finite-field counting method and all six point-count pairs.

Suggested.lean remains 215 lines of light real-bodied definitions and signatures. The name hasseWeilCentre was changed to hasseWeilReflectionSum, since d+1 is the reflection sum, not its centre. The predicted eigenspace-dimension comment now states the patching/supplier conditions. No heavy definition, theory development or sorry-valued data was introduced.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AbelianSurfacesPotentialModularity.json`: zero errors and zero warnings.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/AbelianSurfacesPotentialModularity.lean`: passed.
- The source-issue schema and source-version checks from source_issues/check_errata: zero errors. The standalone errata-v1 and restructuring-result checkers are not applicable to this blueprint-v1 packet; its inline routing proposals were validated by the blueprint checker.
- `lean-check research/blueprint/suggested/AbelianSurfacesPotentialModularity.lean`: elaborated at the shared pinned build, exit 0, with 25 declaration-uses-sorry warnings and no other warnings or errors. No language server or Lake build/update/cache command was used.
- Exact Python arithmetic independently checked the sextic discriminant and the point counts over F₁₁/F₁₂₁ and F₃/F₉ listed in the reader. No CM-exclusion/Magma certificate is claimed.
- Structural consistency: every node appears once in the reader inventory, every API/test statement is present, all 57 review verdicts are present, all definition/construction nodes have at least three tests, and the internal prerequisite graph is acyclic.
- `git diff --check`: passed. Only this issue’s five deliverables and its handoff are changed.

## Questions and routing for the orchestrator

No clarification is needed to apply this review. The following remain separate follow-up decisions; they are not silently resolved by acceptance.

- Assign a proof or a revised argument for G-flatness before treating defect-one lifting as proof-closed. Do not accept balancedness as the missing flat-quotient factorization.
- Register the Hilbert–Siegel higher Hida/Coleman scope from the existing extraction route at its owner (or its Part II); retain only extensions beyond current upstream IHG/SmoothRepresentations, and repoint aliases when the snapshot catches up.
- Route Deuring’s trace-existence direction beyond the current EllipticCurves Hasse-bound layer, and Kummer cohomology to its K3 owner. Existing upstream layers themselves remain unchanged.
- Close the analytic shrinking-neighbourhood/formal Koecher comparison, polarized truncated-BT lifting and dense-affinoid interpolation contracts at their current owners.
- Obtain a durable finite quaternionic-action/non-CM certificate for the explicit example; the discriminant and two point counts are already checked and can be retained.
- Keep the BCGP25 weight-two Galois representation, twisted/odd-theta moduli, local seed and paramodular targets at this roadmap’s assigned ownership when reconciling sibling designs. No duplicate target nodes should be created.
