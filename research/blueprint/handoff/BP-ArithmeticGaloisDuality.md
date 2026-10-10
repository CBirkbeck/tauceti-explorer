# BP-ArithmeticGaloisDuality — completed target-level pass

Agent: Codex — codex-dr6Ar4. Issue: #675. Branch: `codex-dr6Ar4-arithmetic-galois-duality`. Claim confirmed by the swarm bot on 9 October 2026. This handoff supersedes the five inherited checkpoint notes.

## Result and boundaries

The packet is **complete** under the target-level stopping rule in WORKERS.md and PROTOCOL §0: every target of the eight layers is planned, with prerequisite chains ending in checked declarations, this packet, another roadmap, an explicit supplier request or an explicit gap. No layer is closed and no implementation is claimed. All nodes have `implementationStatus: unchecked`. Independent review, supplier integration and the recorded proof-source/interface refinements remain. This is a completed planning pass, not a claim of a gap-free implemented library.

The accepted RS-08 ownership is retained. The upstream title is **Continuous cohomology of profinite groups, Part II: compact coefficients and arithmetic duality**. The 72 existing node IDs are preserved; 52 targets and supporting interfaces are added. The final inventory is 124 nodes: 22 constructions, one definition, 23 lemmas and 78 theorem targets; 138 construction API items, 73 construction tests, 42 planets, 45 checked baseline declaration anchors, 32 sources, 35 open supplier requests and 14 explicit gap records. Every layer has at most six planets.

Only the packet, reader, suggested Lean file and this handoff are changed. The reader gives the exact statements, hypotheses, proof sketches, APIs/tests, source locators and prerequisite contracts; its routed-input table accounts for every item from the 19 papers routed to this job. The packet and reader agree. No source excerpts, private files or extracted source text are retained in these deliverables.

## Current upstream and tier ownership

The reviewed library audit, accepted RS-08 review, upstream order and current roadmap/library sources were read. Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current read-only checks: TauCetiRoadmap `cb8dda51b498dc00183d100031b631dfb58ea5e1`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No build was run in the current-upstream environment.

ProfiniteCohomology supplies the discrete cochain comparison, low-degree exact sequences, all-degree maps, cups, Shapiro and cohomological dimension. Its current scope explicitly excludes the Hochschild–Serre spectral sequence and general compact coefficients; those are planned here. ClassFieldTheory supplies finite local duality/Euler, reciprocity and invariant/class-formation inputs. Its finite local statements retain the discrete/smooth coefficient requirements. Completed/RestrictedProducts already supplies the generic restricted-product topology and is cited rather than replanned. The existing factor-set extension, normalized profinite quotient section, internal Hom, derived category, adic completion and number-field/roots-of-unity carriers are reused.

ArithmeticGaloisDuality and SelmerIwasawaCohomology are the tier-8 bundle. ArithmeticGaloisRepresentations is lower tier. The packet removes prerequisites on higher-tier patching, deformation-ring and potential-modularity roadmaps. Under the WORKERS tier rule, the following targets move down; the maintainer should point the former owners at their new supplier.

| New owner and node | Former consumer/owner to reroute | Contract |
|---|---|---|
| D7/derived-tensor-and-tor | DeformationAndDerivedPatchingAlgebra P7 | Derived tensor/Tor and bounded coefficient-change spectral sequences on existing complexes and derived categories. |
| D7/matlis-coefficient-duality | DeformationAndDerivedPatchingAlgebra P7/R03.1 | Essential injective hull, Matlis dual and finite/cofinite coefficient regimes. |
| D7/grothendieck-spectral-sequence | DeformationAndDerivedPatchingAlgebra P7 | Derived-composite spectral sequence with an actual acyclicity and convergence contract. |
| D7/adic-continuous-map-flatness | DeformationAndDerivedPatchingAlgebra R03.1 | Flat C(K,R) and C(K,R) tensor finite M comparison, with the actual adic topologies. |
| R02.4/prescribed-local-totally-real-base-change | PotentialModularityAndCompatibleSystems R23.1 | Prescribed local extensions, splitting and avoidance; separate soluble square-root specialization. |
| D8/first-order-cocycle-comparison | GlobalGaloisDeformations R04.3; LocalGaloisDeformationRings R08.2 | Square-zero lifts, strict conjugacy, tangent H1, obstruction H2 and trace, before ring representability. |

R02.1/completed-tensor-comparison is an independent finite-module completion input already owned here. D7/hilbert-samuel-euler-function now supplies the ambient-dimension multiplicity foundation needed by compact Euler and higher-tier patching; the rational-series Hilbert polynomial API is existing Mathlib, while the graded-module proof is planned here. Ring representability and relation-module injections remain with their higher-tier consumers; the KW relation bound is conditional on an actual supplied obstruction injection. No upward prerequisite remains. The internal node graph is acyclic.

R02.3 retains ownership of arithmetic finiteness, cohomological dimension, Euler characteristics and finite compact support. Four inherited finiteness/Euler node IDs still contain R02.4 for compatibility, but their `parentStageId` and `realises` correctly name R02.3. D7 extends the finite compact-support carrier to compact/derived coefficients. The maintainer should reconcile the exact Grunwald–Wang target with InverseGalois IG.4: the routed arithmetic sources and this packet put the Wang obstruction here, with inverse-Galois realization importing it. FunctionFieldArithmetic FA.4–FA.5 remains an explicit supplier outside the 94-roadmap selection.

## Layer coverage and remaining work

| Layer | Nodes | API items | Tests | Planets | Status |
|---|---:|---:|---:|---:|---|
| D7 | 24 | 31 | 18 | 6 | planned |
| D8 | 5 | 0 | 0 | 4 | planned |
| R02.1 | 23 | 30 | 18 | 6 | planned |
| R02.2 | 11 | 19 | 7 | 6 | planned |
| R02.3 | 21 | 41 | 22 | 6 | planned |
| R02.4 | 26 | 17 | 8 | 6 | planned |
| R02.5 | 5 | 0 | 0 | 2 | planned |
| R02.6 | 9 | 0 | 0 | 6 | planned |

### ArithmeticGaloisDuality:D7

- Supply native derived tensor/Tor, Matlis/injective-hull and acyclicity interfaces owned here under the tier rule; bind the local/global invariant and arithmetic duality morphisms.
- Preserve unbounded real dyadic duality and exact Tor/finite-generation hypotheses in base change.
- Supply the precise prototype contracts: Derived arithmetic coefficient and duality signatures.

### ArithmeticGaloisDuality:D8

- Obtain the Selmer bundle’s actual local-condition and coefficient-change maps; higher-tier ring roadmaps consume D8’s first-order calculation.
- Integrate the bounded Tor spectral sequence; do not erase degree-zero or characteristic-dividing-rank corrections.
- Supply the precise prototype contracts: Auxiliary-prime and first-order application signatures; Derived arithmetic coefficient and duality signatures.

### ArithmeticGaloisDuality:R02.1

- Bind the lattice/discrete-quotient maps and continuous extension classification to the canonical carriers; complete the reduction and topology comparison for completed tensor.
- Supply the precise prototype contracts: Lattice and extension-classification signatures.

### ArithmeticGaloisDuality:R02.2

- Bind the relative-invariants comparison to D7’s derived-composite spectral sequence; retain the closed-subgroup compact counterexample.
- The perfect-residue Witt proof is public; integrate the required valuation-ring and tame-inertia interfaces.
- Supply the precise prototype contracts: Relative compact HS and signed transfer signatures; All-place duality, roots and geometric-coefficient signatures.

### ArithmeticGaloisDuality:R02.3

- Verify Maire Proposition 19 and its addendum for the degree-d antiunit bound.
- Integrate function-field and ray-class arithmetic suppliers.
- Supply the precise prototype contracts: Arithmetic S-idele class-formation and Ext signatures; Finite arithmetic localization, duality and Euler signatures; Class-field and function-field application signatures.

### ArithmeticGaloisDuality:R02.4

- Supply the precise prescribed-local field-construction proof, including avoidance and the separate soluble square-root specialization.
- Resolve the étale Ext/gerbe supplier and torus/abelian-variety realization contracts.
- Reconcile the Grunwald–Wang overlap with InverseGalois before packaging.
- Supply the precise prototype contracts: Arithmetic S-idele class-formation and Ext signatures; Finite arithmetic localization, duality and Euler signatures; All-place duality, roots and geometric-coefficient signatures.

### ArithmeticGaloisDuality:R02.5

- Obtain L2’s actual Selmer complex/local-condition morphisms and preserve the H⁰ cokernel in the H¹ comparison.
- Supply the precise prototype contracts: Selmer arithmetic comparison and dimension signatures.

### ArithmeticGaloisDuality:R02.6

- Integrate the D8 first-order comparison and imported Dickson/finite-group inputs; keep odd and dyadic auxiliary-prime targets separate.
- Supply the precise prototype contracts: Auxiliary-prime and first-order application signatures.

## Mathematical/source and native-interface gaps

The four non-prototype records are precise limitations, not omitted targets:

- **Maire Proposition 19 and addendum:** Newton–Thorne Lemma 3.4 names the degree-d antiunit lower bound. The p-adic-closure class-field formula and tower inequality are planned from the read source. The exact general hypotheses/proof of Maire, JNT 95 (2002), Proposition 19, and its 2003 addendum were not available from the primary author/publisher links checked. Obtain an authorized/public text and verify that bound; do not assume Leopoldt.
- **Étale Ext/gerbe realization:** bind the existing torus/abelian-variety carriers to the actual étale Ext category, Barsotti–Weil comparison, dual abelian variety, gerbe realization and rational-point topology. GWZ arithmetic pairings are fully stated; no dummy sheaf category is substituted.
- **Native derived coefficients:** supply derived tensor/Tor, K-flat/perfect-amplitude, essential injective-hull/Matlis and derived-composite acyclicity interfaces at their new D7 owner. The current derived category and complexes themselves are existing work.
- **Prescribed-local field construction:** close the approximation/avoidance proof with the precise local-extension input and the separate soluble specialization stated/applied in BCGN and Allen et al.; this no longer depends on higher potential modularity.

Nine grouped prototype-contract records account for all 73 named target signatures left unstated under PROTOCOL §13 because the required native carrier, functor or arithmetic map cannot yet be expressed against the pinned interfaces. Every affected node is listed in `neededBy`; the reader repeats the precise reason beside the target. A final record names the arithmetic bindings needed by generic signatures that already elaborate. These include the actual E/J/C/U diagrams, local embeddings/invariants, graded-Leibniz descent, full cofinite/amplitude comparisons and representation/local-condition specialization. A follow-up should close those contracts rather than replacing a condition with an opaque `Prop`.

## Mathematical distinctions and source corrections

Review should preserve the distinctions already corrected in the targets:

- Compact Hochschild–Serre uses relative derived invariants. Closed-subgroup cochains cannot be substituted without a comparison; the cyclotomic Z_p(1) counterexample remains.
- Real dyadic ordinary global cohomology is unbounded; complete-Tate compact support can have negative degrees. Bounded perfectness requires (P) or the stated correction/inversion comparison.
- Cyclotomic disjointness identifies ambient H1, not necessarily all-place Sha. The odd-prime and full dyadic Wang cases are separated, including the obstruction element, exceptional place set and order doubling.
- The compact Euler function takes the coefficient at dim R of the cumulative Hilbert–Samuel polynomial. It vanishes on lower-dimensional torsion and agrees with length in ring dimension zero. Its theorem requires finite-type terms for the termwise archimedean sum.
- Selmer H1 of the mapping fibre retains the H0 cokernel. The trace-zero adjoint dual is ad/scalars, including characteristic dividing the rank. Odd and dyadic Taylor–Wiles numerics use separate hypotheses and counts.
- Laurent residue keeps prime-to-characteristic finite coefficients and perfect residue. The full Brauer Witt proof is separate. Local abelian-variety duality retains Ext shifts, rational-point topology and the correct isogeny boundary.

The seven sourceIssues records are stated in our own words. E1–E6 are carried with their corrected mathematical scopes. E7 corrects the denominator in Milne I Remark 5.2(a), printed p. 67: the ordinary dual invariants, rather than their real norm quotient, enter the global Euler formula. The Q, Z/3, S={3,infinity} example distinguishes the two values. Rubin Appendix B pagination is corrected to pp. 151–156; compact Shapiro uses Nekovář §§8.1–8.2, pp. 189–201. Nakamura’s Po13 refers to Pottharst, not Positselski.

The full-absolute Tate H2(Q/Z) proof-source gap is closed: Milne I Remark 1.12 and the proof of Corollary 4.17 supply integral odd-degree vanishing, via an imaginary index-two extension and real periodicity; filtered coefficient colimits give the finite-level inclusion consequence. No strict-cd claim for a restricted-ramification G_S is inferred.

## Sources read and missing

The source ledger in the reader/packet records the precise passages and public artifact hashes for all 32 sources. Core proof inputs read are Milne ADT and CFT; NSW §§2.4, 2.7, 8.6–8.7 and 9.1; Rubin Appendix B; Nekovář Chapters 1–5 and the finite-coset/compact Shapiro sections in Chapter 8; Jannsen §§1–2; DDT §§2.3, 2.7–2.8; Conrad Appendix A; Chan §§8.1–8.3; Böckle–Juschka §3.4; Pottharst §1; and the cited Stacks inverse-limit, completion-flatness and Hilbert–Samuel proofs. The routed passages of all 19 papers were read with their surrounding hypotheses/proofs. This is a target-driven reading record, not a claim to have collated every entire paper.

Allen et al., proof of Theorem 7.1.11, pp. 1103–1104, was read in the maintainer-cleared author manuscript in place; no copy, extraction or passage was retained. The inaccessible Artin–Tate book citation for Wang is replaced by the public Conrad proof, and the Gille–Szamuely residue citation is replaced by public Chan notes. No unauthorized copy of a book was used. Maire Proposition 19/addendum remains the missing proof source identified above.

## Supplier requests

All 35 requests remain open. The reader and packet give each full `neededBy` list. Current upstream anchors are used where a roadmap already exists; planned blueprint nodes are referenced where their exact statements suffice.

| Supplier | Requested interface |
|---|---|
| `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-3-the-comparison-isomorphisms` | The comparison of Mathlib's continuousCohomology with explicit inhomogeneous continuous cochains for discrete modules, with the dehomogenisation map, which carrier-comparison extends to compact and rational coefficients. Also: the homogeneous standard-complex cohomology used to build Hochschild–Serre is continuousCohomology for discrete modules. |
| `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-4-the-finite-quotient-colimit-description` | Continuous cohomology of discrete modules commutes with filtered colimits of coefficients. Also: the finite-quotient colimit description in all degrees, used to compute H^r(G_S, U_S) level by level. Also: H¹(H, A) = colim_W H¹(H/W, A), for the reduction of d₂ = −u ∪ to finite quotients. |
| `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences` | The discrete long exact sequence and its connecting maps, for agreement with continuous-section-long-exact on discrete terms. Also: inflation–restriction in degree one and the long exact sequences used for finiteness of H¹, the S-idele classes, the S-unit Kummer sequence and the Euler characteristic. Also: the explicit five-term sequence (transgression, fiveTerm_exact_H1N, fiveTerm_exact_H2Q) that Hochschild–Serre's low-degree sequence is identified with, and inflation–restriction for compact coefficients. |
| `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-8-cup-products-in-low-degrees` | Low-degree cup products on the explicit model for an equivariant pairing, extended to the jointly continuous evaluation Hom_pt(C, A) × C → A. |
| `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-6-change-of-groups` | Conjugation acts trivially on continuous cohomology, and maps along compatible pairs, so that localisation at a place does not depend on the embedding K^s ↪ K_v^s. Also: cor ∘ res = (G : U) in all degrees. |
| `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma` | Coinduced discrete modules are acyclic and Shapiro's lemma holds in every degree (with finite-index subgroups and decomposition groups). Also: induced modules X^q(G, A) and their H-invariants are acyclic, so the rows of the Hochschild–Serre double complex are exact. |
| `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory` | Profinite Hilbert 90 for a Galois extension that need not be the separable closure (here K_S/K), and the Kummer sequence. |
| `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees` | Continuous cohomology in all degrees as a universal δ-functor on discrete modules, effaceable by coinduced modules, with inflation and inflation–restriction in all degrees. Also: all-degree inflation, restriction and corestriction, for the edge maps and the morphisms of Hochschild–Serre spectral sequences. All-degree Mackey/projection-formula identities needed for all-place Res/Cor adjunction and Sylow detection. |
| `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension` | cd_p with its dévissage criterion (cd_p G ≤ n iff H^{n+1}(G, A) = 0 for every simple discrete p-torsion A), and cd(Ẑ) = 1. Also: cd(G/H) ≤ 1 for the two-column degeneration. Strict cohomological dimension two for the full absolute global Galois group away from real dyadic places, with Milne I Remark 1.12’s class-formation criterion; no such assertion for arbitrary G_{F,S}. |
| `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees` | The graded cup product in all degrees, compatible with inflation and connecting maps, and its agreement with the Yoneda product of Ext classes. Also: cup products compatible with inflation, for the multiplicative structure of Hochschild–Serre and d₂ = −u ∪. |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-2-class-formations-and-fundamental-classes` | Class formations (profinite G, discrete C, invariant maps satisfying the restriction axiom) with their fundamental classes u_{U/V}, as the base of the P-class formations of R02.3. |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-3-tates-theorem-for-a-class-formation` | The Tate–Nakayama isomorphism: cup product with u_{G/U} gives Ĥ^{r−2}(G/U, N) ≅ Ĥ^r(G/U, N ⊗ C^U) for torsion-free N, in every integer degree (Milne Lemma 1.2). |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-4-the-abstract-artin-map` | The abstract reciprocity map C^G → G^ab of a class formation as cup product with the fundamental classes (Milne Theorem 1.3, Remark 1.5), for the description of α⁰(G, ℤ). |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality` | Local Tate duality for the evaluation pairing (tateDualityPairing_perfect_mixed), finiteness of H⁰, H¹, H² (finite_H), the cardinality form of the local Euler characteristic, and the local invariant, for finite modules over completions of number fields at finite places. Also: local duality and the local Euler characteristic in the Greenberg–Wiles formula. |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity` | The units of an unramified extension of local fields are cohomologically trivial (Serre, Local Fields), as used to build the local class formation on unramified layers. |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors` | Under the local Artin map the local units map onto the inertia subgroup of the abelianised local Galois group. |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants` | Galois descent C_L^{Gal(L/K)} = C_K for idele classes; the exact sequence 0 → Br(K) → ⊕_v Br(K_v) → ℚ/ℤ → 0 with the archimedean invariants and Br(ℝ) ≅ ½ℤ/ℤ. Quadratic Hilbert reciprocity and the real/local Brauer invariant normalization used for one-prime Kummer fields and square-root obstructions. |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity` | The global class formation (G_K, C) whose invariant is the sum of local invariants, and the local–global compatibility of the global Artin map. |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence` | The absolute reciprocity map C_K → G_K^ab of a number field is surjective, with kernel the identity component D_K of C_K, which is divisible. |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields` | For a number field F and a set S of places containing the archimedean ones: the maximal unramified abelian extension F′ of F in which the places of S split has Gal(F′/F) ≅ Pic(R_{F,S}), and the S-form of the principal ideal theorem (every ideal class of R_{F,S} becomes principal in R_{F′,S}; the transfer to Gal(L/F′)^ab vanishes, Artin–Tate XIII 4). Ray class modulus 8∞, positive generators congruent to 1 modulo 8, and the S-unramified exponent-two class-field dictionary. |
| `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles` | Ideles and idele class groups of number fields, with their topology and the local unit subgroups. |
| `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary` | The identity component D_K of the idele class group. |
| `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles` | Inclusion and norm maps of ideles and idele classes along finite extensions, with the Galois action. |
| `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary` | Unramified sets of primes (Layer 1.2), with their behaviour in towers, composita and Galois closures. |
| `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-4-the-relative-discriminant` | The relative discriminant with the tower formula disc(L) = disc(K)^{[L:K]} · N_{K/ℚ}(𝔡_{L/K}). |
| `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-6-global-ramification-consequences` | The tame and wild different-exponent bounds, which bound the discriminant exponent at a prime in terms of the degree and the residue characteristic. |
| `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-1-supernatural-order-and-index` | Supernatural orders and indices of profinite groups. |
| `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction` | Brauer's induction theorem: every virtual character is an integral combination of characters induced from elementary subgroups. |
| `ArithmeticGaloisRepresentations:R01.2` | Restriction to the decomposition group at a place through an embedding into a local separable closure, with invariance under changing the embedding (the placewise maps of R01 that R02.3 identifies with localisation). |
| `ArithmeticGaloisRepresentations:R01.4` | Dickson's classification of finite subgroups of PGL₂(F̄_ℓ) (DDT Theorem 2.47(b)), for the projective image of ρ̄ in the Taylor–Wiles group theory. |
| `FunctionFieldArithmetic:FA.4` | Existing function-field places, local/global class fields, reciprocity and finite prime-to-characteristic local duality; this packet adds their arithmetic cohomology specializations. |
| `FunctionFieldArithmetic:FA.5` | Function-field Chebotarev for everywhere-split finite abelian extensions. |
| `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev` | The actual Frobenius density statement for finite Galois extensions and avoidance of finitely many primes. |
| `SelmerIwasawaCohomology:L2` | The generic Selmer mapping fibre with actual local-condition maps U→C_local, its local-change triangle, and coefficient-change maps. The existing kernel Selmer definitions are imported; L2 currently does not supply the full complex contract. |
| `SelmerIwasawaCohomology:L1` | The existing orthogonal-complement carrier and exact finite local annihilator interface. |

## Validation and next action

`python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticGaloisDuality.json` exits 0 with zero errors and zero warnings. Every construction API and all 73 packet test names have Lean signatures/examples; the suggested file contains 286 named declarations and 74 test markers, including one additional carrier comparison test. The 73 omitted named target signatures are exactly covered by the nine grouped prototype contracts. No node is marked implemented.

The final `lean-check research/blueprint/suggested/ArithmeticGaloisDuality.lean` exits **0** at the pinned shared build. It reports 284 declaration-use warnings, all for `sorry`, and no other warning/error. One check ran at a time; no Lean language server or library build/update/cache command was started. The file imports individual modules and uses native representations, continuous-map submodules, actual complexes/cones, kernels, homomorphisms, tensor maps and polynomial/length carriers. Elaboration checks signatures, not the proof obligations.

The completed pass goes to a different agent for independent review. Review should check the source and supplier limitations above, then follow-ups close each layer’s recorded contracts and packaging binds the generic arithmetic prototypes to actual supplier maps. The tier/Grunwald–Wang ownership moves require maintainer reconciliation. This worker submits one pull request with `Refs #675` and stops; it does not claim another issue.
