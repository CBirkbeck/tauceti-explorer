# REV-ArithmeticGaloisDuality

**Accepted, with corrections.** This is a complete target-level planning pass, with eight planned layers and no closed layer. The 33 supplier requests and 18 gaps remain explicit. Acceptance does not assert implementation or completion of those integration contracts.

Reviewer: Codex, session `codex-QZZcp0`, issue #349, 10 October 2026. The reviewed plan is BP-ArithmeticGaloisDuality (#675), written by `codex-dr6Ar4`; this session did none of that work. The current `detail.json` and WORKERS streamlined pipeline set target-level granularity and supersede the issue's older lemma-level setting.

## Inventory and verdict

| Measure | Before | After |
|---|---:|---:|
| Nodes | 124 | 125 |
| Construction/definition API items | 138 | 139 |
| Construction/definition tests | 73 | 74 |
| Planets | 42 | 42 |
| Confirmed pinned baseline declarations | 45 | 48 |
| Sources | 32 | 32 |
| Source-version records | 9 | 34 |
| Independently confirmed source findings | 7 | 24 |
| Supplier requests | 35 | 33 |
| Explicit gaps | 14 | 18 |

Node verdicts: **37 verified, 87 corrected, one added, zero unverifiable**. The final kinds are 22 constructions, one definition, 23 lemmas and 79 theorems. Every construction/definition has at least three tests. All nodes remain `implementationStatus: unchecked`.

| Layer | Nodes | API items | Tests | Planets | Coverage |
|---|---:|---:|---:|---:|---|
| D7 | 24 | 32 | 19 | 6 | planned |
| D8 | 5 | 0 | 0 | 4 | planned |
| R02.1 | 23 | 30 | 18 | 6 | planned |
| R02.2 | 11 | 19 | 7 | 6 | planned |
| R02.3 | 21 | 41 | 22 | 6 | planned |
| R02.4 | 27 | 17 | 8 | 6 | planned |
| R02.5 | 5 | 0 | 0 | 2 | planned |
| R02.6 | 9 | 0 | 0 | 6 | planned |

## Mathematical corrections

The detailed ledger below records every changed node, including source locators and prerequisite-only changes. The consequential corrections are these:

- **Limits and cochain carriers.** Reuse `Functor.IsMittagLeffler`; distinguish homogeneous continuous-cochain homology from a derived-invariants/Ext identification. Cochain lifting through a discrete surjection works for every source space. The multiplication-by-p tower test states its actual additive quotient `Z_p/Z`, with p prime. Rationalization is bounded-image scalar extension; the unrestricted no-divisible-elements theorem needs the separate Tate argument and is now an explicit proof-integration gap.
- **Continuous/derived comparison.** General ind-admissible coefficients use the filtered colimit of finite-type continuous stable submodules. Nekovar's derived-invariants comparison is unconditional in degrees zero and one, with higher comparison restricted to its discrete p-primary or cd-at-most-one/effaceability regimes. The closed-normal compact HS target carries this comparison hypothesis; relative derived invariants alone do not establish compact continuous HS. Finite-index descent uses finite-coset continuous transfer rather than invented arithmetic finiteness for arbitrary groups.
- **Arithmetic carriers and ownership.** Restore direct edges to the exact read supplier contracts, separate finite-module restricted-product topology from duality's coefficient-unit hypotheses, and retain the scalar `|H_p|` in modular cyclic induction. The rational decomposition-map surjectivity uses stable lattices and modular induction before the full-rank conclusion. Legacy finiteness ids keep their R02.3 ownership. General cohomological-dimension criteria do not supply an arithmetic global theorem without reciprocity/class-formation inputs.
- **Derived arithmetic duality.** Local trace admits a homotopy retraction into an injective target; a two-sided inverse needs replacements on both sides. The global trace comes from the degree-three cokernel and good truncation, retaining the possible global H2 localization kernel. Matlis duality does not supply a normalized ring dualizing complex: the ring-local-cohomology comparison, its owner and tier placement are a separate gap. Hyper-Ext is into that complex, with no Cohen-Macaulay canonical-module assumption. Localized rings use the filtered R-finite coefficient construction rather than a newly assumed complete-local topology.
- **Signs and base change.** Transport Nekovar's reversed cup target by the signed tensor symmetry; transport the source anticommuting bicomplex convention to Mathlib's commuting carrier. Hyper-Tor occupies a bounded strip with negative Tor column, not a first quadrant. The degree-one Selmer output retains every relevant Tor term and differential. The contraction prototype excludes the invalid positive boundary j=i and explicitly records its missing general jprime-greater-than-j factoring codomain.
- **Function fields and geometric coefficients.** Add the independent finite prime-to-characteristic function-field PT node, including nonempty S and the completed degree/class-formation comparison. Derived local/global function-field branches cite that arithmetic input. Characteristic-zero abelian-variety etale Ext/cofinite assertions keep the hypotheses of Milne I.3.1-I.3.4; the prime-to-residue-characteristic isogeny realization is stated separately.
- **Selmer and deformation numerics.** Import the existing L2 complex and H1 correction nodes and plan only their arithmetic-carrier comparison. Replace stage-level representation requests by exact decomposition-group and Dickson nodes. The elementary first-order calculation stays below ring representability, and relation bounds are conditional on an actual obstruction injection. Keep odd and dyadic arguments separate, and use eigenspace multiplicities rather than a small trace in the residue field.

## Sources and source findings

The routed statements and surrounding proofs were read, with their hypotheses and conventions. This is a review of the roadmap's source-dependent targets, not a claim to have collated every page of 32 works. The packet records 34 version/access records and exact per-node locators. Public publisher copies were collated for Calegari-Geraghty and Groechenig-Wyss-Ziegler; the Calegari-Geraghty 2022 correction and Milne's addendum revised 26 October 2025 were read. The Allen et al. passage was read in the maintainer-cleared manuscript in place; no passage or private file is retained.

Maire Proposition 19 and its addendum remain inaccessible and are recorded as a proof-source gap. Nekovar's author-listed erratum returned HTTP 403, so findings against the Numdam version of record do not claim to be new. The two new Rubin findings are scoped to the SWC-hosted draft because the publisher refused access. Secondary preprint findings are not described as collated published findings.

All original findings E1-E7 were independently confirmed. E4 retains the author's sufficiently-large-extension correction and a conditional Leopoldt obstruction, without inventing a known counterexample. New findings E8-E24 are independently confirmed, with the following scope and checks. Their complete reasons, searched corrections and version records are in the packet.

| Finding | Source and locator | Corrected point and check |
|---|---|---|
| E1 | HARPAZ-WITTENBERG-23; §5, Lemma 5.5, p. 19 (author final version; corrected in PAPER-HARPAZ-WITTENBERG-23/E10) | Assume C finitely generated (for example finite, as in the only application), or give Hom(C, A) the pointwise topology Hom_pt(C, A), in which case the class lies in H^1(Γ, Hom_pt(C, A)) and the formula holds by a cochain computation. |
| E2 | MILNE-ADT; Chapter I, §4, proof of Proposition 4.3, p. 50 (PDF p. 58), second edition, 01.07.06 file | Use a cofinite set of primes for the first direct-limit isomorphism. For a general set, kill the S-class-group cokernel by the principal ideal theorem before passing to the limit. |
| E3 | MILNE-ADT; Chapter I, §4, statement of the main theorem, p. 55 (PDF p. 63), second edition, 01.07.06 file | Define the unramified subgroup only at a finite place, by inflation from its residue-field Galois group when inertia acts trivially. |
| E4 | MILNE-ADT; Chapter I, §4, Theorem 4.6(b) and its proof, pp. 52–53 (PDF pp. 60–61), second edition, 01.07.06 file | Choose L sufficiently large, for example containing enough p-power roots of unity for the primes p dividing the order of M; the proof step saying the sequence is exact whenever G_S acts trivially on M and L = K must be replaced by an argument for such L. |
| E5 | DDT-FLT; §2.3, Theorem 2.19, p. 62 (author PDF revised 9 September 2007) | In the finiteness assertion use F as the field parameter for both Selmer groups, as in their definitions and the displayed formula. |
| E6 | DDT-FLT; §2.8, last line of the proof of Theorem 2.49, p. 84 (author PDF revised 9 September 2007) | Restrict the cocycle to G_{F_n} in the final noncontainment, matching the group from which the chosen element is drawn. |
| E7 | MILNE-ADT; I, Remark 5.2(a), p. 67 (PDF p. 75), final displayed formula, 01.07.06 author file; page image inspected | The denominator must use ordinary invariants of M^D. The preceding local-duality identity and the equality of the H¹ cardinalities give that quotient. |
| E8 | NEKOVAR-SC; §5.1.5, p. 114; §5.4.1, p. 125, especially the injection and (5.4.1.2); §5.7.1.5, p. 131; Astérisque 310 (2006), Numdam version of record | Keep the localization kernel. Only its cokernel is Z/p^n by the sum of local invariants. Deduce H³_c≅Z/p^n and higher vanishing from the compact-support long exact sequence. Use the rowwise good truncation in degrees at least three to construct the trace; do not assert (5.4.1.2) for general coefficients. |
| E9 | PAPER-GROECHENIG-WYSS-ZIEGLER-20; §3.2, opening Pontryagin-duality paragraph, published p. 532 (author p. 17), Inventiones 221 (2020) | It exchanges all profinite abelian groups with all discrete torsion abelian groups. Finite n-torsion on the discrete side corresponds to finite quotients modulo n on the compact side; impose that extra condition when using the cofinite subcategory. |
| E10 | PAPER-GROECHENIG-WYSS-ZIEGLER-20; §3.2, Lemma 3.8 and Theorem 3.10, published pp. 532–533 (author pp. 17–18); compare Geometric stabilisation, arXiv:1810.06739v2, §6.5 opening, p. 42 | For these cited proofs assume a finite extension of Q_ell, as the corrected target does. A positive-characteristic formulation needs a separate proof with its flat/étale coefficient regimes and finiteness conditions, rather than importing those citations unchanged. |
| E11 | CHAN-ORDERS; §8.2, proof of Theorem 8.7, p. 28; §8.3, proof of Lemma 8.9, p. 29; author notes dated 16 May 2011 | The defect is an i-cocycle whose primitive is an (i−1)-cochain. Rational cohomology vanishes only in positive degrees; H⁰(G,Q)=Q for the trivial action. |
| E12 | NEKOVAR-SC; §2.3.5, proof, p. 52; Numdam version of record, page image inspected | Choose a nonzero map Rx→k→I and extend it to the ambient module by injectivity. An embedding of Rx is neither supplied nor needed. |
| E13 | NEKOVAR-SC; §3.3.7, proof, p. 81; Numdam version of record, page image inspected | Use the finite automorphism groups of M_α/m^n M_α. Extend the compatible actions at every finite level, take the adic limit on each finite-type part, and then the filtered union. |
| E14 | PAPER-CALEGARI-GERAGHTY-18; Lemma 4.14, final proof paragraph, author p. 53; published journal p. 368, Inventiones 211 (2018) | G_(L,S) is an open subgroup of finite index. The finite quotient Gal(L/F) has vanishing H¹ on characteristic-zero coefficients, so restriction from the global group to this subgroup is injective. |
| E15 | PAPER-CALEGARI-GERAGHTY-18; §8.4, paragraph defining oddness and the archimedean invariant calculation, author p. 81; published journal p. 406 | Require the actual ±1 eigenspace dimensions a,b to satisfy \|a−b\|≤1. In general h⁰(ad⁰)=a²+b²−1. A small trace in the coefficient field is insufficient. |
| E16 | PAPER-CALEGARI-GERAGHTY-18; Author §8.1, p. 78; published §8.2, journal p. 402, Greenberg–Wiles display | The denominator is Sel_(L*)(F,μ_p), the Cartier/Tate dual of the trivial F_p coefficient. |
| E17 | PAPER-CALEGARI-GERAGHTY-18; Author §8.1, p. 78; published §8.2, journal p. 402, final local-dual-condition paragraph | Its dimension is [F_v:Q_p]+dim_Fp μ_p(F_v). It is the finite-flat Kummer unit subgroup, not generally a line. |
| E18 | MILNE-ADT; I §4, p. 49, definition of J_(F,S), second edition author file | Use the restricted topological product of the local multiplicative groups with the specified unit subgroups, so that S-units embed with their actual topology. |
| E19 | PAPER-MERKURJEV-SCAVIA-26; §2, equation (2.3), p. 6; author Negligible.pdf, corresponding to arXiv:2410.12560v1 | Call it an exact segment H¹(L,A)^H→H²(H,A)→H²(K,A), with the surrounding five-term sequence retained. Inflation targets the base field K. |
| E20 | PAPER-WOOD-19; §3, proof of Lemma 3.2, journal pp. 389–390, Duke Mathematical Journal 168 (2019), NSF-hosted version of record | Use the centralizer of ρ(y) to see that chosen lifts X,Y commute. The Grunwald–Wang correction is imposed at the finitely many places of the base field L where wild ramification may occur. |
| E21 | NEKOVAR-SC; §5.1 opening, p. 113; §5.1.2 and §5.1.5, pp. 113–114; Numdam version of record | Require a nonempty finite set S in the function-field branch of these affine arithmetic statements and in the derived trace/duality targets that use them. |
| E22 | PAPER-CALEGARI-GERAGHTY-18; Published paper, the 47 completed group-ring/power-series occurrences itemized in the published Correction, pp. 855–856 (2022) | Restore the double brackets at the correction’s listed occurrences. Use the completed rings in later deformation/patching consumers. |
| E23 | RUBIN-ES; Appendix B, Proposition 2.7(i)-(ii), p. 153, SWC-hosted author draft | Keep field characteristic different from p in these finiteness applications. In characteristic p, the Artin-Schreier H1 groups can already be infinite. |
| E24 | RUBIN-ES; Appendix B, Remark 2.6, p. 153, SWC-hosted author draft | Use the full finite-cohomology hypothesis explicitly. Finite generation controls H1, and finite presentation is already required for finite H2 with trivial F_p coefficients; higher degrees need further finiteness conditions. |

## Library and supplier review

All baseline statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including surrounding hypotheses. None of the 45 original anchors was removed. Their file suffixes and declaration kinds were corrected where needed. `continuousCohomology` and `groupCohomology` provide the actual cochain homology carriers, not an automatic Ext definition. Added anchors are ordinary `CategoryTheory.Tor`, `Subrepresentation` and `Subrepresentation.toRepresentation`; none supplies the missing K-flat or general ind-admissible derived interface by itself.

The reviewed library audit and accepted RS-08 ownership were checked. Current TauCetiRoadmap main `37769f03c170a7bc3e1082df70522a0ad59c5ffd` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were read for reuse. ClassFieldTheory and ProfiniteCohomology were read as the two nearest upstream roadmaps; the newer roadmaps and Completed/RestrictedProducts were screened for existing carriers. No build was run in that environment. Current Tau Ceti already has compact-kernel continuous extensions and their H2 classification, so these are imported and only canonical-carrier/endpoint-automorphism refinements remain planned here.

Every remaining request was checked against its supplier statement. A request for additional arithmetic specialization is stated as a request, not attributed to a theorem the supplier already has. ClassFieldTheory's finite-layer norm correspondence is distinguished from the absolute idele inverse-limit comparison derived by this consumer. ProfiniteCohomology's generic dimension criteria are distinguished from arithmetic strict-dimension inputs. Selmer L2 supplies its existing mapping fibre and H1 exact sequence. The 33 request consumers have direct supplier edges; exact supplier nodes replace four former broad stage requests. FunctionFieldArithmetic FA.2-FA.4 supplies the positive-characteristic arithmetic inputs, including its separate completed-degree direction.

The baseline ledger is reproduced for auditability; the packet gives the exact module and contribution for each entry.

| Library | Confirmed declaration |
|---|---|
| mathlib | `CategoryTheory.Functor.IsMittagLeffler` |
| mathlib | `continuousCohomology` |
| mathlib | `continuous_pi_iff` |
| tauceti | `TauCeti.homAction` |
| mathlib | `Field.absoluteGaloisGroup` |
| mathlib | `InfiniteGalois.IntermediateFieldEquivClosedSubgroup` |
| mathlib | `Set.integer` |
| mathlib | `Set.unit` |
| mathlib | `ClassGroup` |
| mathlib | `NumberField.finite_of_discr_bdd` |
| mathlib | `RestrictedProduct` |
| mathlib | `RestrictedProduct.topologicalSpace` |
| mathlib | `PontryaginDual` |
| mathlib | `tateCohomology` |
| mathlib | `CategoryTheory.IsGrothendieckAbelian.enoughInjectives` |
| mathlib | `CategoryTheory.hasExt_of_enoughInjectives` |
| mathlib | `CategoryTheory.Abelian.Ext` |
| mathlib | `CategoryTheory.Abelian.Ext.comp` |
| mathlib | `CategoryTheory.Abelian.Ext.covariantSequence_exact` |
| tauceti | `TauCeti.DiscreteRep` |
| tauceti | `TauCeti.InternalHom` |
| tauceti | `TauCeti.InternalHom.evalPairing` |
| tauceti | `TauCeti.KummerCoeff` |
| tauceti | `TauCeti.kummerShortExact` |
| tauceti | `Rep.FiniteCyclicGroup.tateCohomologyIsoEven` |
| tauceti | `Rep.FiniteCyclicGroup.tateCohomologyIsoOdd` |
| tauceti | `TauCeti.TateCohomology.herbrandQuotient_eq_one_of_finite` |
| tauceti | `TauCeti.ClassFunction.natCard_nsmul_mem_indVirtualCharacters_isCyclic` |
| mathlib | `HomotopyCategory.spectralObjectMappingCone` |
| mathlib | `CategoryTheory.Triangulated.SpectralObject.mapHomologicalFunctor` |
| mathlib | `CategoryTheory.Abelian.SpectralObject.IsFirstQuadrant` |
| mathlib | `CategoryTheory.Abelian.SpectralObject.coreE₂CohomologicalNat` |
| mathlib | `CategoryTheory.Abelian.SpectralObject.spectralSequence` |
| mathlib | `HomologicalComplex₂.total` |
| mathlib | `groupCohomology` |
| tauceti | `TauCeti.exists_continuous_section` |
| tauceti | `TauCeti.FactorSet` |
| tauceti | `TauCeti.FactorSet.Extension` |
| mathlib | `TopRep` |
| mathlib | `DerivedCategory` |
| mathlib | `AdicCompletion` |
| mathlib | `Module.length` |
| mathlib | `ringKrullDim` |
| mathlib | `Polynomial.hilbertPoly` |
| mathlib | `Ideal.exists_pow_inf_eq_pow_smul` |
| mathlib | `CategoryTheory.Tor` |
| mathlib | `Subrepresentation` |
| mathlib | `Subrepresentation.toRepresentation` |

## Closure, API, tests and suggested Lean

Every original node was checked for its statement, source hypotheses, direct prerequisites and proof sketch. One function-field theorem was added with `addedBy: REV-ArithmeticGaloisDuality`. The local graph is acyclic. The eight stage targets are represented at current target-level granularity; smaller proof steps remain in the sketches. Supplier integration and the 18 named gaps remain visible, so no stage is marked closed.

All 139 API names and 74 named tests have native signatures in the suggested file. Their semantic range was checked, including meaningful constant/zero cases, nonexamples, sign tests and comparisons. This inventory does not imply a full native signature for every target: the actual arithmetic place diagrams, general ind-admissible functor, normalized ring duality and full quotient-factoring contraction are explicitly missing contracts. The suggested file uses existing library complexes, Hom/Ext and cohomology carriers and honest `sorry`; it does not substitute arbitrary proposition fields for these missing constructions. The H0 correction in the Selmer H1 comparison, real dyadic unboundedness, trace degeneracy when rank is not invertible, and ambient-dimension multiplicity are preserved.

The 42 planet names mark central constructions and named theorem targets, with at most six per layer. None was added merely because a node was added. They retain the roadmap's mathematical names and accepted RS-08 grouping.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticGaloisDuality.json`: zero errors and warnings.
- Shared `source_issues.check_issues` and `check_errata.versions_checked` validation: zero errors.
- `lean-check research/blueprint/suggested/ArithmeticGaloisDuality.lean`: exit zero; only declaration-uses-sorry warnings. The final run checks the revised ML functor universe, general lifting, stable-subrepresentation predicate, signed transfer contracts and corrected contraction range. No Lean server or library rebuild was used.
- All 125 checked-node ids are unique and cover the final node inventory; every baseline has a check record, every source finding has an independent verdict, and every request consumer has its direct edge.
- `git diff --check` and deliverable-scope checks pass.

## Handoff and maintainer decisions

The separate handoff lists the remaining mathematical contracts and reader reconciliation. This issue does not authorize editing the predecessor reader; its copied specifications must be refreshed from the corrected packet before packaging. Resolve normalized ring duality's owner/tier placement, retain the downward moves already made in BP #675, and reconcile the Grunwald-Wang overlap with InverseGalois. These are planning/integration follow-ups rather than unresolved contradictions in the corrected statements. No second job was claimed.

## Node-by-node ledger

Each entry concerns the stated target and its planning proof contract. A verified statement with an explicit proof-integration gap is not a claim that that proof was completed.

| Node | Verdict | Check or correction |
|---|---|---|
| `ArithmeticGaloisDuality:R02.1/lim-one` | corrected | The kernel/cokernel of 1 minus shift computes countable derived limits. Strengthened the multiplication-by-p test to its actual Z_p/Z additive-group value with p prime. |
| `ArithmeticGaloisDuality:R02.1/mittag-leffler` | corrected | Use the existing Functor.IsMittagLeffler through the tower functor; eventual stabilization is its characterization, not a second definition. |
| `ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one` | verified | The recursive lifting argument and eventual stabilized images give lim1=0 under ML; no converse is asserted. |
| `ArithmeticGaloisDuality:R02.1/lim-one-six-term` | verified | The snake lemma gives the six-term exact sequence for termwise exact towers; the final obstruction term is retained. |
| `ArithmeticGaloisDuality:R02.1/milnor-sequence` | verified | The cochain transition surjectivity and two-column derived-limit argument give the Milnor sequence, including the previous-degree lim1 term. |
| `ArithmeticGaloisDuality:R02.1/cochain-lifting` | corrected | Removed the false connected-space nonexample and the unnecessary compactness, finiteness and disconnectedness assumptions: a set section between discrete spaces is continuous. |
| `ArithmeticGaloisDuality:R02.1/cochains-inverse-limit` | verified | Continuous maps into the inverse-limit subspace are exactly compatible continuous maps into its factors; the topological limit, not merely an abstract module limit, is used. |
| `ArithmeticGaloisDuality:R02.1/carrier-comparison` | corrected | Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-3-the-comparison-isomorphisms. |
| `ArithmeticGaloisDuality:R02.1/tate-inverse-limit` | verified | Finite previous-degree cohomology gives ML and removes precisely the Milnor obstruction; finiteness is explicit. |
| `ArithmeticGaloisDuality:R02.1/continuous-section-exists` | corrected | Replaced the incorrect NSW 2.7.2 section citation by Chapter I §1 Exercise 4, p. 11; 2.7.2 is the long-exact-sequence lemma. |
| `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact` | corrected | Added the exact NSW long-exact-sequence locator and direct discrete comparison supplier; the induced submodule topology is explicit in the hypotheses. |
| `ArithmeticGaloisDuality:R02.1/compact-cochain-bounded` | verified | Compact images in a finite-dimensional p-adic space lie in a scaled lattice; finitely many coordinates suffice. |
| `ArithmeticGaloisDuality:R02.1/rationalization` | corrected | Removed an unsupported inference about a general lim¹ group. Kept the source theorem’s unrestricted statement, distinguished its separate divisibility argument from bounded-image rationalization, and recorded that proof integration explicitly. |
| `ArithmeticGaloisDuality:R02.1/discrete-quotient-colimit` | corrected | The filtered-colimit theorem is already owned by ProfiniteCohomology Layer 4. Rubin I.2 supplies the lattice example, not a proof of the general theorem. Import the filtered-colimit theorem from ProfiniteCohomology Layer 4 and record it as a direct prerequisite; Rubin supplies its lattice application. |
| `ArithmeticGaloisDuality:R02.1/lattice-torsion-sequence` | verified | The lattice, its rationalization and the actual torsion quotient give the stated short exact coefficient sequence; the quotient has its discrete topology. |
| `ArithmeticGaloisDuality:R02.1/pointwise-hom` | verified | Pointwise convergence on additive Hom supplies the correct topology and continuous evaluation for discrete source. |
| `ArithmeticGaloisDuality:R02.1/splitting-torsor` | corrected | Differences of additive splittings land in the kernel; the transported action makes this a pointwise-Hom torsor. Clarified the test with an equivariant splitting. |
| `ArithmeticGaloisDuality:R02.1/connecting-cup-formula` | corrected | Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-8-cup-products-in-low-degrees. |
| `ArithmeticGaloisDuality:R02.1/discrete-hom-finitely-generated` | verified | A finite set of generators detects the zero homomorphism, so pointwise Hom into discrete coefficients is discrete when its source is finitely generated. |
| `ArithmeticGaloisDuality:R02.3/restricted-ramification-group` | corrected | Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-1-supernatural-order-and-index. Scoped the number-field construction without excluding the separately planned function-field branch. Corrected the arithmetic nonexample to distinguish ramification at 2 from the infinity-only compositum. |
| `ArithmeticGaloisDuality:R02.3/hermite-unramified-outside-finite` | corrected | Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-4-the-relative-discriminant. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-6-global-ramification-consequences. |
| `ArithmeticGaloisDuality:R02.3/h1-finite` | corrected | Removed obsolete R02.4 ownership language; accepted RS-08 places the finite arithmetic prerequisite in R02.3. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences. The theorem concerns finite discrete modules; finite generation of an arbitrary discrete coefficient is not a substitute. |
| `ArithmeticGaloisDuality:R02.3/localisation-maps` | corrected | Replaced a stage-level dependency with the exact read supplier node(s). Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-6-change-of-groups. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension. |
| `ArithmeticGaloisDuality:R02.3/s-idele-class-modules` | corrected | Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles. |
| `ArithmeticGaloisDuality:R02.3/s-idele-class-sequence` | corrected | The finite-extension idele sequence and filtered-limit argument retain the S-class cokernel until the principal ideal theorem kills it; added the direct arithmetic/colimit inputs. |
| `ArithmeticGaloisDuality:R02.3/p-class-formation` | corrected | Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-1-supernatural-order-and-index. |
| `ArithmeticGaloisDuality:R02.3/s-class-formation` | corrected | The p-primary class-formation axioms follow from invariants and global existence after the stated arithmetic coefficient comparison; added the direct supplier edges. |
| `ArithmeticGaloisDuality:R02.3/s-idele-class-reciprocity` | corrected | Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary. |
| `ArithmeticGaloisDuality:R02.3/s-unit-kummer-sequence` | corrected | Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory. |
| `ArithmeticGaloisDuality:R02.4/discrete-module-ext` | corrected | Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees. Kept the nondivisible coefficient counterexample so the class-formation Ext hypotheses cannot be dropped. |
| `ArithmeticGaloisDuality:R02.4/class-formation-ext-duality` | corrected | Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ClassFieldTheory#layer-3-tates-theorem-for-a-class-formation. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ClassFieldTheory#layer-4-the-abstract-artin-map. |
| `ArithmeticGaloisDuality:R02.4/tate-global-duality` | verified | The class-formation Ext argument gives the finite Tate duality target with its divisible coefficient and sufficiently-large-extension requirements retained. |
| `ArithmeticGaloisDuality:R02.4/finite-module-dual` | verified | The finite dual is Hom(M,mu_m) with the cyclotomic action and evaluation pairing; it is distinguished from an untwisted linear dual. |
| `ArithmeticGaloisDuality:R02.4/archimedean-local-duality` | corrected | Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants. |
| `ArithmeticGaloisDuality:R02.4/unramified-exact-annihilators` | corrected | Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality. |
| `ArithmeticGaloisDuality:R02.4/restricted-product-cohomology` | corrected | Made finiteness explicit for the stated topologies, corrected localization to a product of restrictions, and limited the RestrictedProducts import to its actual topology and finite-index comparison contracts. Distinguished the topology of finite-coefficient restricted products from the stronger coefficient-unit hypotheses used by their duality applications. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality. |
| `ArithmeticGaloisDuality:R02.4/h1-localisation-proper` | corrected | Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences. |
| `ArithmeticGaloisDuality:R02.4/restricted-product-self-duality` | corrected | Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality. |
| `ArithmeticGaloisDuality:R02.4/ext-units-ideles` | corrected | Kummer and Shapiro compute the specified unit/idele Ext groups; added the direct coinduction and local class-field inputs. |
| `ArithmeticGaloisDuality:R02.4/poitou-tate` | corrected | Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees. |
| `ArithmeticGaloisDuality:R02.4/global-finiteness` | corrected | The finite cohomology target agrees with Milne Corollary 4.15. Removed obsolete ownership language while preserving its legacy R02.4 id and actual R02.3 parent. |
| `ArithmeticGaloisDuality:R02.4/cohomological-dimension-bound` | corrected | Removed obsolete R02.4 ownership language; accepted RS-08 places the finite arithmetic prerequisite in R02.3. |
| `ArithmeticGaloisDuality:R02.4/h2-localisation-surjective` | corrected | The last finite PT terms and the vanishing dual-invariant term yield the stated localization surjectivity; added its direct local duality input. |
| `ArithmeticGaloisDuality:R02.4/units-cohomology-high-degree` | corrected | Added the global Brauer exact-sequence supplier used by the high-degree S-unit argument. |
| `ArithmeticGaloisDuality:R02.4/decomposition-map-surjective` | corrected | Restricted to the rationalized decomposition map actually needed. Removed the invalid reduction from arbitrary elementary subgroups to p-elementary subgroups; specified lattice independence and the Brauer-character full-rank argument cited by Milne. |
| `ArithmeticGaloisDuality:R02.4/modular-cyclic-induction` | corrected | Corrected the modular induction multiplicity: induction from the prime-to-p cyclic subgroup contributes \|H_p\| copies in the Grothendieck group, so rationalization must divide by \|H_p\|. Replaced the unscaled induction identification by [Ind_Hprime^H N]=\|H_p\|[N], followed by division in the rational Grothendieck group. |
| `ArithmeticGaloisDuality:R02.4/euler-characteristic-additivity` | corrected | Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences. |
| `ArithmeticGaloisDuality:R02.4/global-euler-characteristic` | corrected | Removed obsolete R02.4 ownership language; accepted RS-08 places the finite arithmetic prerequisite in R02.3. Added direct Shapiro and finite local Euler-characteristic suppliers; retained ordinary archimedean H0 and the corrected dual-invariant denominator. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees. |
| `ArithmeticGaloisDuality:R02.2/first-quadrant-spectral-sequence` | corrected | Made the sign transport to Mathlib’s commuting bicomplex carrier explicit, so the source convention and totalization agree. |
| `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence` | corrected | Added direct comparison, coinduced-resolution, all-degree group-change and cup-product suppliers used in its construction; NSW Exercise 3 supports arbitrary open Gprime with Hprime=H∩Gprime. |
| `ArithmeticGaloisDuality:R02.2/five-term-transgression` | corrected | Added the existing explicit transgression/five-term supplier as a direct dependency; this node identifies the spectral-sequence map with that map. |
| `ArithmeticGaloisDuality:R02.2/transgression-cup-product` | corrected | Added the direct filtered-colimit, graded cup, pointwise continuous Hom and imported continuous extension-class prerequisites for the closed-subgroup formula. |
| `ArithmeticGaloisDuality:R02.2/hochschild-serre-degeneration` | corrected | Added the cohomological-dimension supplier used in the two-column case. Checked the product splitting against NSW 2.4.6, including its non-functoriality in A. |
| `ArithmeticGaloisDuality:R02.2/finite-index-descent` | corrected | Removed reliance on arithmetic finiteness for an arbitrary profinite group. Finite-coset continuous transfer and its cochain homotopies prove the lattice case without taking exact limits of cohomology. Added discrete restriction/transfer suppliers and retained the direct finite-coset continuous homotopies for lattices, which need no arithmetic finiteness hypothesis. |
| `ArithmeticGaloisDuality:R02.2/compact-five-term` | corrected | Added the discrete/low-degree comparison supplier; independently checked Rubin B.2.5 and its exact finiteness regime. |
| `ArithmeticGaloisDuality:R02.5/greenberg-wiles-formula` | corrected | Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality. |
| `ArithmeticGaloisDuality:R02.5/selmer-condition-comparison` | verified | The two finite local-condition exact sequences give the relative Selmer ratio with the same coefficient and duality conventions. |
| `ArithmeticGaloisDuality:R02.6/taylor-wiles-local-count` | verified | At a regular semisimple Taylor-Wiles prime the invariant and local-condition dimensions follow from the two distinct Frobenius eigenvalues; no dyadic extension is inferred. |
| `ArithmeticGaloisDuality:R02.6/dual-selmer-killing` | corrected | Removed the obsolete assertion that dyadic targets remain unplanned; the packet contains their separate KW nodes. |
| `ArithmeticGaloisDuality:R02.6/sl2-adjoint-h1-vanishing` | verified | The finite SL2 adjoint H1 vanishing uses the stated odd-characteristic hypotheses and exceptional low-field cases from DDT, not a blanket assertion for every finite group. |
| `ArithmeticGaloisDuality:R02.6/sigma-criterion` | corrected | Added n≥1 so that the Tate twist factors through the specified cyclotomic finite quotient. Replaced a stage-level dependency with the exact read supplier node(s). |
| `ArithmeticGaloisDuality:D7/local-invariant-trivialization` | corrected | Local cd_p=2 comes from the local ClassFieldTheory contract, not the restricted global cd bound. A quasi-isomorphism into a bounded-below injective complex has a homotopy retraction; a two-sided homotopy equivalence requires K-injectivity of both models. Restricted the literal trace statement to the ind-admissible coefficient regime and to a homotopy retraction into an injective target; a two-sided homotopy inverse requires two K-injective models. Included the prime-to-field-characteristic function-field completion regime needed by global duality, with its own local invariant and dimension supplier. |
| `ArithmeticGaloisDuality:D7/local-duality-maps` | corrected | Made the ring-dualizing normalization, local-cohomology functor and derived hyper-Ext conventions explicit. Matlis alone does not close this branch; its construction/comparison is a recorded gap. The independence argument concerns choices of trace retraction; it does not require a two-sided homotopy inverse for an arbitrary source model. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees. The infinite direct-sum bidual test explicitly uses the F2-linear carrier; normalized ring duality is a separate gap. |
| `ArithmeticGaloisDuality:D7/derived-local-duality` | corrected | Allowed a completion at every finite place, including places above rational primes different from the coefficient prime. Made the ring-dualizing normalization, local-cohomology functor and derived hyper-Ext conventions explicit. Matlis alone does not close this branch; its construction/comparison is a recorded gap. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality. Kept the local coefficient prime independent of the place and included the prime-to-characteristic function-field specialization required by derived-global-duality. |
| `ArithmeticGaloisDuality:D7/local-duality-functoriality` | verified | The evaluation symmetries, signed tensor flip and chain homotopies give the naturality and duality-symmetry maps under the finite/cofinite hypotheses. |
| `ArithmeticGaloisDuality:D7/compact-support-cochains` | verified | The shifted localization cone has the signed differential and triangle; finite-type boundedness uses (P), and real dyadic correction is separate. |
| `ArithmeticGaloisDuality:D7/compact-support-cup-products` | corrected | Added the direct cup-product supplier and stated the transport from Nekovář’s reversed tensor target to the standard A⊗B target. This fixes the convention needed for sign and evaluation comparisons. |
| `ArithmeticGaloisDuality:D7/compact-support-euler-characteristic` | verified | Ambient-dimension Hilbert-Samuel multiplicity is additive and agrees with the compact Euler formula; finite-length torsion over positive-dimensional R contributes zero. |
| `ArithmeticGaloisDuality:D7/global-invariant-trivialization` | corrected | Removed the false H²-localization injectivity used in Nekovář (5.4.1.2). Compute the degree-three trace from the cokernel of localization and use the rowwise good truncation directly; retain S_f nonempty. Added the independent function-field PT prerequisite for the positive-characteristic trace calculation. |
| `ArithmeticGaloisDuality:D7/derived-global-duality` | corrected | Made the ring-dualizing normalization, local-cohomology functor and derived hyper-Ext conventions explicit. Matlis alone does not close this branch; its construction/comparison is a recorded gap. |
| `ArithmeticGaloisDuality:D7/duality-after-localization` | corrected | Made the ring-dualizing normalization, local-cohomology functor and derived hyper-Ext conventions explicit. Matlis alone does not close this branch; its construction/comparison is a recorded gap. |
| `ArithmeticGaloisDuality:D7/compact-support-without-p` | verified | The complete Tate complexes at real dyadic places give the stated unbounded correction. Ordinary archimedean invariants in the Euler expression remain distinct. |
| `ArithmeticGaloisDuality:R02.1/completed-tensor-comparison` | verified | The ordinary/completed tensor comparison uses finite-type modules and actual adic completion; it does not assert arbitrary completed tensor exactness. |
| `ArithmeticGaloisDuality:R02.1/continuous-factor-set-extension` | corrected | Current Tau Ceti already supplies the topology, continuous operations, section and rescaling. Recast as an import/comparison with the pinned prototype; no new extension topology is planned. |
| `ArithmeticGaloisDuality:R02.1/continuous-schreier-classification` | corrected | Current Tau Ceti already classifies compact-kernel profinite extensions by its continuous H². Import that equivalence and plan only its canonical-carrier comparison and the automorphism/Z¹ and inner/H¹ refinements. |
| `ArithmeticGaloisDuality:R02.1/unbalanced-cochain-product` | corrected | Restricted the native contraction to j=0 or j<i. Its existing typed specialization uses j′=j; the stronger target retains its full quotient-factoring output and an explicit prototype integration gap. The native API covers jprime=j and j=0 only; the full quotient-factoring output is explicitly retained as a prototype gap. |
| `ArithmeticGaloisDuality:R02.2/compact-hochschild-serre` | corrected | Distinguished the unconditional relative derived-invariants spectral sequence from the continuous-cochain spectral sequence. Added the comparison and finite-length finiteness hypotheses needed to pass to compact coefficients. |
| `ArithmeticGaloisDuality:R02.2/transgression-norm-square` | verified | The five-term exact segment and finite-index transfer supply the transgression/norm square with the stated sign. The source misprints are recorded separately. |
| `ArithmeticGaloisDuality:R02.2/laurent-residue-sequence` | verified | The perfect-residue equal-characteristic Laurent-series argument separates residue and tame inertia and uses the prime-to-characteristic coefficient regime. |
| `ArithmeticGaloisDuality:R02.2/cyclotomic-local-global-kernel` | corrected | Corrected the Qian locator to the published pages containing Lemmas 2.1–2.2, pp. 1245–1246. |
| `ArithmeticGaloisDuality:R02.3/finite-compact-support` | corrected | Added the function-field PT branch; the number-field-only node does not establish the positive-characteristic assertions. |
| `ArithmeticGaloisDuality:R02.3/absolute-and-relative-sha` | corrected | Corrected the Qian locator to the published pages containing Lemmas 2.1–2.2, pp. 1245–1246. |
| `ArithmeticGaloisDuality:R02.3/exponent-two-ramification-field` | corrected | The exponent-two compositum has the prescribed ramification and real-place behavior. Corrected the locator for the definition of F(S) to Newton-Thorne p. 38. |
| `ArithmeticGaloisDuality:R02.3/one-new-prime-kummer` | verified | Ray-class reciprocity and the modulus 8-infinity condition select the auxiliary prime; Kummer then gives the stated quadratic extension with the required real behavior. |
| `ArithmeticGaloisDuality:R02.3/antiunit-class-field-rank` | verified | The class-field closure formula and tower argument were read in Newton-Thorne Lemma 3.4. The separately cited Maire Proposition 19/addendum proof remains an explicit source gap, not a claimed reading. |
| `ArithmeticGaloisDuality:R02.3/no-zp-extension-away-from-p` | verified | Away from p the open-subgroup local-unit argument excludes the stated Z_p extension; characteristic-zero averaging makes the restriction kernel vanish. |
| `ArithmeticGaloisDuality:R02.3/function-field-finiteness-euler` | corrected | Added the function-field PT branch; the number-field-only node does not establish the positive-characteristic assertions. |
| `ArithmeticGaloisDuality:R02.4/lattice-rational-poitou-tate` | verified | Finite PT, ML and scalar extension give the lattice/rational comparisons in the stated regime. The integral system and rational quotient are kept distinct. |
| `ArithmeticGaloisDuality:R02.4/all-place-sha-duality` | corrected | Added the function-field PT branch; the number-field-only node does not establish the positive-characteristic assertions. Added the direct edge for the recorded supplier request tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees. |
| `ArithmeticGaloisDuality:R02.4/grunwald-wang` | corrected | Corrected the Conrad locator: A.1 is a definition, A.2 a remark and A.3 the proposition, rather than three propositions. |
| `ArithmeticGaloisDuality:R02.4/character-root-obstruction` | verified | The root obstruction is the Kummer/Brauer connecting class with actual local restrictions; local degrees and Grunwald-Wang correction data are not omitted. |
| `ArithmeticGaloisDuality:R02.4/character-roots-after-base-change` | corrected | Removed the forward PotentialModularity proof dependency and made the owned prescribed-local construction the field-building input. |
| `ArithmeticGaloisDuality:R02.4/tate-h2-qmodz` | corrected | Replaced the overbroad arithmetic demand on ProfiniteCohomology Layer 11 by a class-formation/reciprocity proof and its direct number-field and function-field inputs, following Milne Remark 1.12. |
| `ArithmeticGaloisDuality:R02.4/torus-sha-duality` | verified | The all-place torus pairing and Sha duality agree with Milne and Harpaz-Wittenberg; etale Ext and gerbe realization remain a named supplier contract. |
| `ArithmeticGaloisDuality:R02.4/abelian-variety-local-duality` | corrected | Restricted the cofinite-type and étale-Ext assertion to characteristic zero, exactly as Milne I.3.1–3.4 require; the GWZ citation alone omitted this restriction. Corrected the second GWZ locator to the opening Tate-duality discussion in §6.5; it is not the proof of Lemma 6.14. |
| `ArithmeticGaloisDuality:R02.4/isogeny-dual-exact-sequence` | corrected | Made characteristic zero explicit for the full étale isogeny sequence; retained the separate prime-to-residue-characteristic hypothesis for the index formula. |
| `ArithmeticGaloisDuality:R02.4/function-field-central-obstructions` | verified | The finite central lifting obstruction is killed with the prime-to-field-characteristic root-of-unity and local correction assumptions from Wood; source slips are recorded. |
| `ArithmeticGaloisDuality:R02.5/selmer-complex-h1-comparison` | corrected | Replaced a stage-level dependency with the exact read supplier node(s). Recast as arithmetic-carrier comparison of L2’s existing exact sequence, avoiding a second plan for the Selmer complex or its H¹ correction. |
| `ArithmeticGaloisDuality:R02.5/rank-one-selmer-numerics` | corrected | The rank-one unit/class-group calculation uses the dual mu_p and the full local unit dimension. Corrected its published section/page locator; recorded the two source mistakes. |
| `ArithmeticGaloisDuality:R02.5/function-field-greenberg-wiles` | corrected | Added the function-field PT branch; the number-field-only node does not establish the positive-characteristic assertions. Corrected NSW 8.7.9 pagination to pp. 512–513, with the local-condition definition on p. 511, after reading the formula and proof. Replaced a stage-level dependency with the exact read supplier node(s). |
| `ArithmeticGaloisDuality:R02.6/kw-relative-tangent-relations` | corrected | Restored the two-dimensional and residual-image hypotheses of KW’s fixed-determinant problem. Removed forward ring-roadmap proof prerequisites; the relation bound is explicitly conditional on its obstruction injection. Corrected Proposition 4.6 to Lemma 4.6. |
| `ArithmeticGaloisDuality:R02.6/odd-taylor-wiles-primes` | verified | The odd-prime Chebotarev argument uses the irreducibility, field and local conditions from KW; the dyadic construction remains a separate target. |
| `ArithmeticGaloisDuality:R02.6/dyadic-cyclotomic-residual` | corrected | Replaced a stage-level dependency with the exact read supplier node(s). |
| `ArithmeticGaloisDuality:R02.6/finite-order-determinant-twists` | verified | Finite-order determinant twisting uses the stated local square-root and global character obstruction hypotheses; no unrestricted root existence is claimed. |
| `ArithmeticGaloisDuality:R02.6/archimedean-adjoint-dimensions` | corrected | The actual plus/minus eigenspace multiplicities give a^2+b^2-1, including characteristic-two distinctions. Corrected the published locator and recorded the modular-trace error. |
| `ArithmeticGaloisDuality:D7/admissible-coefficients` | corrected | Made the finite-type submodule definition of ind-admissibility explicit and removed unsupported extension closure of admissible modules. The category is algebraic; no unspecified topology on a general ind-object is used. |
| `ArithmeticGaloisDuality:D7/continuous-derived-cochains` | corrected | Separated the finite/cofinite TopRep comparison from the filtered finite-type colimit for general ind-admissible coefficients. Replaced the unconditional derived-invariants isomorphism by the actual comparison and its proved regimes. |
| `ArithmeticGaloisDuality:D7/cochain-finiteness-perfectness` | corrected | Finite cohomology and cd hypotheses imply the stated finite-type/perfectness conclusions through reduction and flat cochains. Corrected Pottharst pagination; no mere finite-generation-of-G shortcut is used. |
| `ArithmeticGaloisDuality:D7/compact-shapiro-projection` | verified | Finite-coset induction/coinduction identifies compact cochains and projection maps with their continuous coefficient topologies, including the inverse-system compatibility. |
| `ArithmeticGaloisDuality:D7/nakamura-cochain-base-change` | verified | Nakamura finite-module coefficient change uses the actual adic cochain flatness and completion comparisons; arbitrary coefficient change is not asserted. |
| `ArithmeticGaloisDuality:D7/local-coefficient-field-duality` | corrected | Corrected the BIP citation to its coefficient-field classification, rather than a nonexistent local duality lemma, and the PQ published locator to Lemma 3.1, p. 19. The pairing proof rests on the read Böckle–Juschka Theorem 3.4.1. |
| `ArithmeticGaloisDuality:D7/finite-group-uct-sylow` | verified | The finite-group universal coefficient sequence retains its tensor and Tor terms, and restriction to a Sylow subgroup has the stated transfer splitting. |
| `ArithmeticGaloisDuality:D7/profinite-product-kunneth` | verified | The profinite product Kunneth statement has the specified coefficient and boundedness assumptions and retains its torsion correction. |
| `ArithmeticGaloisDuality:D8/selmer-localization-tangent-comparison` | corrected | Replaced a stage-level dependency with the exact read supplier node(s). |
| `ArithmeticGaloisDuality:D8/trace-adjoint-duality` | corrected | Trace identifies the adjoint with its dual only when rank is invertible. The true-dual sequence handles the remaining case; corrected the PQ application locators. |
| `ArithmeticGaloisDuality:D8/determinant-fibre-comparison` | corrected | Removed BIP Lemmas 3.17–3.18: they concern commutative algebra and do not establish determinant/trace tangent compatibility. The first-order calculation and KW trace sequence supply this target. |
| `ArithmeticGaloisDuality:D8/derived-coefficient-change-selmer` | corrected | Corrected the nonflat conclusion: every Tor term and differential contributing to degree one must be retained, rather than promising only H⁰/H² corrections. Added the read Pottharst derived base-change theorem and its bounded-strip Tor spectral sequence as direct support for the existing corrected contract. Replaced a stage-level dependency with the exact read supplier node(s). |
| `ArithmeticGaloisDuality:D7/derived-tensor-and-tor` | corrected | Ordinary Tor already exists in pinned Mathlib. The hyper-Tor sequence has a bounded cohomology strip, not a first-quadrant page after a fixed shift; its bounded-strip convergence argument must be supplied. Added the read Pottharst derived base-change theorem and its bounded-strip Tor spectral sequence as direct support for the existing corrected contract. |
| `ArithmeticGaloisDuality:D7/matlis-coefficient-duality` | corrected | Separated exact Matlis duality and its termwise derived extension from Grothendieck duality with a normalized ring dualizing complex. The latter needs the explicit local-cohomology comparison gap. |
| `ArithmeticGaloisDuality:D7/grothendieck-spectral-sequence` | verified | The derived-composite spectral sequence requires an actual acyclicity hypothesis and boundedness/convergence contract; it does not supply the continuous/derived-invariants comparison by itself. |
| `ArithmeticGaloisDuality:D7/adic-continuous-map-flatness` | verified | Finite quotients, exact continuous functions and Artin-Rees yield the finite-module cochain comparison and flatness. The proof uses the existing adic-completion carrier. |
| `ArithmeticGaloisDuality:R02.4/prescribed-local-totally-real-base-change` | corrected | Corrected general prescribed local residue-degree divisibilities to local extension-degree divisibilities. The read BCGN construction does not prescribe residue degrees or assert arbitrary soluble local realizations. |
| `ArithmeticGaloisDuality:D8/first-order-cocycle-comparison` | corrected | Corrected DDT tangent-space attribution from §2.3 to §2.6, Lemma 2.39 and proof, p. 75; the elementary cocycle calculation is explicit here. |
| `ArithmeticGaloisDuality:D7/hilbert-samuel-euler-function` | verified | The Euler function is the ambient-dimension cumulative Hilbert-Samuel coefficient, with additivity and the field/free-Z_p/torsion tests distinguishing it from module length. |
| `ArithmeticGaloisDuality:R02.4/function-field-poitou-tate` | added | Added the separate prime-to-characteristic finite function-field PT target from NSW 8.3.17/8.3.20 and 8.6.7/8.6.10, with nonempty S and the completed degree/class-formation input. FA.2-FA.4 supply its arithmetic carriers; their native binding remains explicit. |
