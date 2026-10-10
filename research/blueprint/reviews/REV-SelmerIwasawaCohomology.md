# Independent review: SelmerIwasawaCohomology

Accepted as a completed target-level planning pass. All five stages remain **planned**, with no stage claimed closed. The review verifies 68 nodes and corrects 27; it adds no nodes and confirms all 38 baseline citations. There is no unresolved contradiction in the revised statements. The three recorded proof gaps and 20 supplier requests remain open, as this review issue expressly permits. Nothing is claimed formalized.

Reviewer: Codex, session `codex-yn9tA2`, issue #485, independent of BP authors Claude `cc-39fac3` and Codex `codex-lvrBpD`. Review date: 2026-10-10.

| Item | Revised count |
| --- | ---: |
| Targets | 95 |
| Constructions / definitions | 22 / 9 |
| Lemmas / comparisons / theorems | 15 / 7 / 42 |
| API items | 154 |
| Required definition/construction tests | 108 |
| All recorded tests, including theorem tests | 178 |
| Planets | 26 |
| Pinned baseline declarations | 38 |
| Requests / gaps | 20 / 3 |
| Planned / closed stages | 5 / 0 |

## Scope and evidence

Read every node's statement, hypotheses, proof outline, prerequisites, acceptance criteria, API and examples; checked stage targets against the packet and read the complete existing reader and suggested file. Read the reviewed library audit and routed red-team findings. Read actual pinned declaration statements, not just names. Read the cited source passages independently, including the adjacent proof arguments used by the targets. The review is organized by roadmap targets; it records no source excerpts or section-by-section source summary.

The public sources and exact editions are recorded in `sources` and `sourceVersions` in the packet. Eighteen public primary-source PDFs were checked at the cited loci; the additional published Rodrigues Jacinto–Williams copy was collated at pp.170–172, 193–194 and 196–198. Recorded pre-existing public hashes matched. Liu et al., *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*, Inventiones 228 (2022), was read at the maintainer-cleared edition under the user's explicit authorization, superseding the issue's older public-only instruction. No library file or passage is copied into a deliverable. Its Definitions 2.1.2, 2.2.2, 2.2.4–2.2.5 and 2.4.1–2.4.2, and Lemmas/Proposition 2.1.3–2.1.5, 2.2.3, 2.2.6–2.2.7, 2.4.3–2.4.6 are located at pp.121–125 and 129–131. The primary Monsky parity proof was not read and remains explicitly a gap.

Current read-only TauCetiRoadmap main `618e0b30d21791d6a492ce88ba8602745697b21a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were screened separately from the pins. Searched the nine newer roadmaps' suggested declarations, including OperatorTheory's subdirectories, then read matching upstream statements. Read Completed/HodgeStructures and GlobalNumberFields and the relevant LocalGaloisGroups and EllipticCurves interfaces. Current local power-class finiteness and Kummer isomorphisms are imports. LocalGaloisGroups Layer 7's completion carrier is general, while its free-quotient rank requires a finite extension of Qp. Current ProfiniteCohomology Layer 10 and Tau Ceti's Shapiro/AllDegrees and RestrictScalars declarations already supply all-degree discrete Shapiro over arbitrary coefficient rings; only the complete-coefficient extension and transition comparison are requested. No library or upstream checkout was modified or built.

## Corrections and direct dependencies

The per-node table below records every node correction. The principal mathematical corrections are:

- Discrete corank examples now use Qp/Zp and its powers. The compact-dual computation is named `corankFromDual`, with the corresponding renamed API and native examples.
- Elliptic local Kummer now rationalizes `lim_m E(F_v)/p^m E(F_v)`, rather than the uncompleted algebraic tensor of the entire local point group. Rubin I.6.4, pp.15–16, supplies the global Tate-module comparison.
- The Bloch–Kato exact fragment uses a Qp-linear `1−φ`; Frobenius is generally semilinear over K0. The dimension formula includes `[K:Qp]`, and the annihilator statement retains the de Rham hypothesis. Added the unramified quadratic extension test and clarified the full ordinary versus finite-unit conditions for Qp(1).
- Compact and discrete Tate duals in the Greenberg hypotheses are distinguished. Closed local conditions are explicit for double orthogonals. Fitting equals characteristic uses the dimension-two depth/Auslander–Buchsbaum input and square presentation.
- Weak semisimplicity uses the elementary closed-kernel/image argument, removing an irrelevant finite-index descent edge. Completion identity and composition are now named API lemmas with native signatures. Pontryagin duality has a finite-quotient proof outline and an inverse-action test. Free Fontaine–Laffaille data has a split-filtration predicate and a nonsplit-step test.
- Added direct inputs for Kummer limits, tame inertia, cohomological dimension, all-degree Shapiro, Mackey/semilocal comparisons, twist projection formulas and module depth. The general torsion-crystalline coefficient functoriality retains compatible bounded crystalline target data; it is not derived solely from the small-weight equivalence.
- Nekovar **Theorem** 6.3.4 is correctly labelled. The global/compact-support and Iwasawa duality imports retain condition `(P)`: p odd or no real places. Removed an unspecified assertion of real-place amplitude at p=2 and recorded the missing derived modified-support extension as the third gap.
- Published Rodrigues Jacinto–Williams Proposition 13.13/Corollary 13.14 is at p.193, correcting the packet's pp.195–196 locator.

All definition and construction tests were checked for discriminating content. Added tests detect a reversed dual action, a missing local scalar degree and a nonsplit free filtration. Existing finite/full/zero kernels, wrong ordinary filtrations, infinite-rank completion tensors, noncritical Tate twists and local-error examples distinguish the intended constructions from plausible alternatives. Names and mathematical contracts for every API/test remain present in the suggested file. Planets retain the 26 selected central definitions/constructions/theorems; no source-locator planets or new planet names were introduced.

## Closure, tiers and routed findings

Read the 42 unique original cross-roadmap node suppliers at their actual statements, together with the referenced upstream local-field, profinite-cohomology, class-field and elliptic layers. The new all-degree request was checked against current Layer 10 and its implemented discrete declarations. Generic finite duality remains imported; period/topological coefficient and compact derived-limit refinements remain precise requests. The proof graph uses this packet, the same-tier ArithmeticGaloisDuality bundle, lower-tier suppliers and actual library declarations. No higher-tier PadicHodgeRegulators, Heegner, PadicFamilies or BSD theorem is used to fill a missing proof.

| Routed finding | Review result |
| --- | --- |
| RT-AREA-iwasawa-1/18 | Greenberg L3 now has explicit RFX, LOC1/LOC2, LEO, CRK and almost-divisible hypotheses, plus the correct alternatives; local cofreedom and Fitting/characteristic have their actual extra inputs. |
| RT-AREA-iwasawa-1/19 | Finite conditions depend on the minimal period/Fontaine–Laffaille foundations owned in L4, rather than a forbidden upward PadicHodgeRegulators L1 edge. Higher plans must import the moved foundations. |
| RT-AREA-iwasawa-1/20 | The upstream EllipticCurves Layer 7 general discrete Selmer definition is imported. This packet owns compact/rational diagrams, their arithmetic comparison and derived extensions. Existing explicit 2-descent is not mistaken for the general cohomological carrier. |
| RT-AREA-iwasawa-1/21 | L4 supplies the Tate/class-unit/characteristic-ideal dictionary. EulerSystemsCyclotomicMainConjecture imports that dictionary and retains Euler-system construction and the main-conjecture proof. |
| RT-AREA-algebraicgeometry/27 | Native pinned HodgeStructureOn, dual, Tate twist and dimension declarations supply the archimedean carrier. L4 only adds Betti involution/Gamma-criticality data. External stage-edge integration remains manager work, not an edit to upstream HodgeStructures. |

The two original parity gaps remain: ordinary-family/nonvanishing/Heegner proof inputs for Nekovar 12.2.3, and the primary Monsky two-primary congruent-number proof used by Dokchitser–Dokchitser 4.19. The new gap is modified derived compact support and Iwasawa amplitude for p=2 with real places. A finite Poitou–Tate real-place modification does not supply that derived extension. These gaps do not undermine the qualified statements currently planned; they prevent closed coverage.

## Source issues

All nine entries now have independent verdicts. A confirmation applies to the corrected classification and wording, not automatically to the input worker's original inference. Source findings are stated in our own words.

| Entry | Independent result |
| --- | --- |
| E1 | Confirmed the tensor/completion error in Rodrigues Jacinto–Williams §10.5, preprint pp.52–53, published pp.171–172. Finite H0 kills the Milnor lim-one term; inverse limits are not generally exact. |
| E2 | Confirmed the overly global filtration requirement in Definition 13.19(1), preprint p.70, published p.196. The ordinary filtration is decomposition-group stable. |
| E3 | Confirmed visually the repeated Sigma localization indices in Rubin I.7.3's proof, p.19. The dual map uses the two distinct condition sets. |
| E4 | Confirmed the scalar versus Frobenius-operator norm slip at preprint p.52, published p.171. The displayed minus-one unit is torsion; the correction is not a claim that it is a nontrivial Euler-system class. |
| E5 | Confirmed the reversed inequality and plus-tower ambient-group slips at preprint p.71, published pp.197–198. |
| E135 | Reclassified as a proof gap affecting the descent argument. Inflation–restriction exhibits the possible kernel, but the generic trivial-coefficient example does not satisfy the enormous-image adjoint hypotheses of Theorem 1.2 and does not disprove that theorem. |
| E138 | The Artin argument requires equivariant Hom of the class group and a finite inflation kernel. Both are finite, so the stated finiteness conclusion survives; `affects` is corrected to `nothing`. |
| E6 | Confirmed the reversed global/local unit quotient in Corollary 13.14's proof, preprint p.68 and published p.193, by the preceding exact sequence. |
| E7 | Added the omitted minus one in the global-unit rank evaluation, preprint p.67/published p.193. This is already PAPER-RODRIGUES-JACINTO-WILLIAMS-23/E80 and PadicMeasuresIwasawaAlgebras/E7; no novelty or new publisher-erratum search is claimed. The planned Leopoldt statement was already correct. |

## Baseline declarations

All entries below were read at the exact pin: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. None was removed or replaced. Current additions remain in `upstreamNotes`, rather than being falsely assigned to these pins. Important boundaries: `ofTensorProduct_bijective` needs finite modules over a Noetherian ring; PontryaginDual itself is circle-valued, with the p-primary comparison supplied in the proof outline; the Gamma function is totalized; the Hodge object has opposed filtrations and boundedness from its native structure; pinned Kummer injection is not cited as pinned surjectivity.

| Declaration | Confirmed provision |
| --- | --- |
| `mathlib:AdicCompletion` | The I-adic completion of a module. |
| `mathlib:AdicCompletion.map` | Functoriality of the completion. |
| `mathlib:AdicCompletion.of` | The canonical map M → M̂. |
| `mathlib:AdicCompletion.ofTensorProduct` | The map R̂ ⊗ M → M̂. |
| `mathlib:AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian` | R̂ ⊗ M → M̂ is bijective for finite M over Noetherian R. |
| `mathlib:CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range` | A cofiltered system with eventually finite ranges is Mittag-Leffler. |
| `mathlib:ContinuousMonoidHom.comp` | Composition of continuous homomorphisms. |
| `mathlib:IsIntegral.of_pow` | x is integral if some positive power is. |
| `mathlib:Module.finrank` | Cardinal.toNat of module rank; for finite free modules this is the usual rank. |
| `mathlib:MulDistribMulAction.toMonoidHom` | The endomorphism x ↦ g • x. |
| `mathlib:NumberField.RingOfIntegers` | The ring of integers. |
| `mathlib:NumberField.Units.exist_unique_eq_mul_prod` | Every unit is uniquely a torsion unit times a product of powers of the fundamental system. |
| `mathlib:PadicInt` | The p-adic integers. |
| `mathlib:PadicInt.toZModPow` | ℤ_p → ℤ/p^n. |
| `mathlib:PontryaginDual` | Continuous homomorphisms into the circle. |
| `mathlib:Submodule.map_le_iff_le_comap` | map f p ≤ q ↔ p ≤ comap f q. |
| `mathlib:card_rootsOfUnity` | The n-th roots of unity in a domain have at most n elements. |
| `mathlib:rootsOfUnity` | The subgroup of n-th roots of unity. |
| `tauceti:TauCeti.ContCohomology.DiscreteShortExact.explicitDelta0_coeffMap` | A morphism of short exact sequences commutes with δ⁰. |
| `tauceti:TauCeti.kummerClassMap` | The Kummer map on Kˣ/(Kˣ)^n. |
| `tauceti:TauCeti.kummerClassMap_injective` | Kˣ/(Kˣ)^n injects into H¹(G_K, μ_n). |
| `tauceti:TauCeti.kummerMap` | Kˣ →* H¹(G_K, μ_n), the connecting map of the Kummer sequence. |
| `tauceti:TauCeti.kummerMap_apply` | kummerMap is δ⁰ read through Kˣ ≃ ((Kˢ)ˣ)^{G_K}. |
| `tauceti:TauCeti.kummerShortExact` | The Kummer short exact sequence of discrete G_K-modules. |
| `tauceti:TauCeti.powerClassQuotient` | Kˣ/(Kˣ)^n. |
| `mathlib:BDeRhamPlus` | The θ-kernel completion of W(PreTilt R p)[1/p]. |
| `mathlib:BDeRham` | Localization of BDeRhamPlus at images of generators of ker θ. |
| `mathlib:Complex.Gammaℝ` | Deligne real Gamma factor π^(−s/2)Γ(s/2). |
| `mathlib:Complex.Gammaℂ` | Deligne complex Gamma factor 2(2π)^(−s)Γ(s). |
| `mathlib:Complex.Gammaℝ_eq_zero_iff` | The totalized real Gamma factor is zero precisely at nonpositive even integers. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn` | An opposed filtration on a complex vector space with real conjugation and fixed weight. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn.hodgeNumber` | Finite rank of the pth Hodge piece. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn.finite_setOf_hodgeNumber_ne_zero` | Finite support of Hodge numbers. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn.dual` | The opposed-filtration dual of weight −w, on the complex dual with dual conjugation. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn.finrank_dual_piece` | The dual piece at a has dimension equal to the original piece at −a. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn.tateTwist` | The pure Hodge twist has filtration F(a+m) and weight w−2m. |
| `tauceti:TauCeti.Hodge.tate` | The rank-one integral Tate Hodge structure of type (−m,−m) and weight −2m. |
| `tauceti:TauCeti.Hodge.tate_hodgeNumber` | The existing Tate Hodge numbers are one at −m and zero elsewhere. |

## Per-node verdicts

The source locators, hypotheses and dependencies for each entry are retained in the packet. These notes record the specific check and any change, rather than treating checker success as mathematical verification.

| Node | Verdict | Check / change |
| --- | --- | --- |
| `L0/padic-completion` | corrected | Mathlib already owns completion and its finite-module tensor comparison; the general inverse-limit carrier and the quotient-tower identifications remain distinct from Rubin's double dual. Changes: Named the completion identity and composition laws and added their native signatures. |
| `L0/units-completion` | verified | Dirichlet's finitely generated unit decomposition justifies the tensor comparison, including the finite p-primary roots-of-unity factor. |
| `L0/s-units-completion` | verified | The S-unit rank counts finite places together with archimedean places; finite generation is a supplier theorem, not inferred for all field units. |
| `L0/local-completion` | corrected | The local decomposition gives a surjective tensor-to-completion map; its principal-unit tensor has a kernel. The upstream carrier is general, but its displayed free rank assumes finite extension of Qp. Changes: Separated the general upstream completion carrier from its mixed-characteristic rank theorem; the existing LFR request carries this upstream import. |
| `L0/local-power-class-finite` | verified | Current Tau Ceti supplies finite local power classes. The target only compares their topology with the compact Kummer carrier; Rubin B.2.7 retains local finiteness. |
| `L0/kummer-level-compatibility` | verified | The power-class projection matches the coefficient power map, and norms match corestriction. Current finite Kummer isomorphisms are imported. |
| `L0/kummer-limit-map` | corrected | The inverse map uses compatible finite Kummer bijections, not exactness of inverse limits. The real example requires positive levels and the finite-field example requires p invertible. Changes: Made the real-field level range and finite-field coefficient characteristic explicit. |
| `L0/roots-of-unity-mittag-leffler` | verified | Finite roots of unity give stabilization of images and the ML hypothesis; finiteness is applied to each finite coefficient group, not to its limit. |
| `L0/padic-kummer-identification` | verified | The Milnor sequence has lim-one of H0, killed by finite roots of unity. Homeomorphism needs finite local quotient levels; algebraic comparison does not. |
| `L0/s-unit-kummer-identification` | verified | Finite ideal-class p-torsion contributes no Tate-module limit, while the S-unit tower has the required completion. The coefficient-limit interface remains requested. |
| `L0/inverse-limit-hypotheses` | corrected | Local finite H1 and away-p finite-type inertia are distinct inputs; tower compactness can kill lim-one without ML. Added the Kummer comparison used directly. Changes: Added direct prerequisites for inputs used by the proof sketch. |
| `L2/selmer-data` | verified | A compact/rational localization diagram extends the upstream discrete Selmer structure. Its commuting maps and submodules are concrete, rather than asserted cohomological predicates. |
| `L2/selmer-kernel` | verified | The kernel of localization to quotient conditions has an inclusion, universal property and map laws; the discrete arithmetic constructor remains with EllipticCurves Layer 7. |
| `L2/change-of-conditions` | verified | Nested local conditions give a kernel and a localization image, with surjectivity asserted only onto that image. Mazur–Rubin's dual correction is retained. |
| `L2/selmer-functoriality` | corrected | The abstract diagram map follows by the kernel universal property. Rubin I.5.4 supplies its coefficient-map specialization, not the full general statement directly. Changes: Distinguished the formal diagram generalization from the source’s coefficient-map case. |
| `L2/condition-propagation` | verified | Inverse image on T and image on A=V/T are the propagated conditions; image and inverse image have different formal laws and finite quotients can differ from raw unramifiedness. |
| `L2/lattice-passage` | verified | The integral condition is the saturated inverse image of the rational one. Divisible images in W need not reconstruct all unramified classes at ramified primes. |
| `L2/unramified-condition` | corrected | Inertia restriction defines the kernel. The propagated finite-versus-unramified tests use ell different from p, including a Tamagawa obstruction on a Tate curve. Changes: Restricted the propagated finite-condition tests to ℓ≠p and specified a Tamagawa counterexample. |
| `L2/greenberg-condition` | verified | Only decomposition-group stability of the ordinary filtration is required. Fil-positive zero and full give unramified and full conditions respectively. |
| `L2/galois-selmer-group` | verified | The canonical global and local cochain carriers are supplied by AGD; the adapter kernel is linked to upstream discrete Selmer, rather than defining competing arithmetic cohomology. |
| `L2/pontryagin-dual` | corrected | Circle characters on discrete p-primary modules land in its p-primary torsion; divisible-codomain injectivity gives exactness. Added the inverse-action computation distinguishing the contragredient. Changes: Supplied the p-primary-circle comparison and exactness/biduality argument; added a test detecting a missing inverse in the action. |
| `L2/corank` | corrected | Corank is defined on discrete M through its compact dual. Renamed the native rank computation corankFromDual; the rank-one and rank-two examples are Qp/Zp and its square. Changes: Corrected discrete-module examples and renamed the compact-dual adapter and API to corankFromDual. |
| `L2/elliptic-selmer-instance` | verified | The infinite elliptic Selmer group and Sha exact sequence are imported discrete theory and compared with V/T. Tensoring the discrete torsion Selmer group with Qp is not its rationalization. |
| `L1/orthogonal-complement` | verified | Perfect local pairings and closed submodules give double orthogonals on the intended carriers; the finite pairing prototype is an adapter, not a replacement compact pairing. |
| `L1/lattice-pairing-compatibility` | verified | Rubin I.4.3 compares rational, lattice, divisible and finite pairings by their actual coefficient maps, with dual coefficients in the second argument. |
| `L2/dual-selmer-structure` | corrected | Local annihilators are formed in the dual coefficient groups. Closedness and biduality are explicit; the finite conditions on T and T-star are paired, not one subgroup identified with itself. Changes: Made closedness explicit and distinguished the paired finite conditions on dual coefficients. |
| `L2/unramified-dimension-count` | corrected | Procyclic residue cohomology and away-p inertia dimension yield the two dimension equalities. Added the local tame quotient and cohomological-dimension prerequisites used directly. Changes: Added direct prerequisites for inputs used by the proof sketch. |
| `L2/finite-unramified-comparison` | verified | Rubin I.3.5 distinguishes T, V and W. The finite quotient W-inertia modulo its divisible part is the integral defect, not automatically zero at bad primes. |
| `L2/finite-condition-rational-duality` | verified | Rubin I.4.2 proves exact annihilators for the rational finite conditions via local Tate duality and dimension counts; the away-p convention is retained. |
| `L2/finite-condition-lattice-duality` | verified | Rubin I.4.3 and Mazur–Rubin I.1.7 give integral/divisible and finite reductions by compatible coefficient maps; no finite-condition perfectness is assumed from rational duality alone. |
| `L2/selmer-limits` | verified | Compact coefficients use the inverse Tate-module limit; divisible coefficients use a direct limit. Rubin I.5.5–5.6 supplies the topology and finiteness distinctions. |
| `L2/selmer-structure-poitou-tate` | verified | Changing local conditions gives the exact sequence with dual complementary Selmer terms, rather than an unsupported full localization-surjectivity assertion. |
| `L2/selmer-poitou-tate-limit` | verified | The limit theorem retains finite global cohomology and the dual correction from Rubin I.7.5. The repeated localization indices in the source proof are corrected in E3. |
| `L3/iwasawa-cohomology` | corrected | Use derived compact inverse limits with corestriction and the canonical Lambda action. All-degree discrete Shapiro is current library work; only its compact extension remains requested. Changes: Added direct prerequisites for inputs used by the proof sketch. Imported current all-degree discrete Shapiro and requested only the compact-coefficient extension, using the actual Layer 10 stage id. |
| `L3/iwasawa-shapiro` | verified | Nekovar 8.4.4.1–2 compare the tower to the induced Iwasawa coefficient object with the inverse Gamma action; individual cohomology limits require the stated acyclicity interface. |
| `L3/iwasawa-descent` | verified | Derived specialization and Tor give the control sequence; the simple kernel/cokernel form uses a one-variable regular parameter. It is not asserted unchanged for rank-two Gamma. |
| `L3/iwasawa-torsion-criterion` | verified | Nekovar 8.4.8.5 uses finite generation and finite specialization/correction hypotheses. Residual irreducibility is not an unconditional torsion criterion. |
| `L3/universal-norms-unramified` | corrected | Rubin B.3.3 uses local inertia at ell different from p and its finite-type module; adding the tame-quotient supplier makes that input direct. Changes: Added direct prerequisites for inputs used by the proof sketch. |
| `L3/semilocal-cohomology` | corrected | A finite place set over a base place is induced from its decomposition group. Added the finite Shapiro and Mackey prerequisites; infinite-level products require the stated topology. Changes: Added direct prerequisites for inputs used by the proof sketch. |
| `L3/iwasawa-twist` | corrected | Twisting changes the Lambda action through its automorphism and uses cup-product compatibility. Rational Iwasawa means the integral Iwasawa complex tensored with Qp, not an unrestricted rational inverse limit. Changes: Added direct prerequisites for inputs used by the proof sketch. Specified rationalization after the integral limit, consistently with Kato’s convention. |
| `L4/local-units-iwasawa-cohomology` | verified | Completed local multiplicative groups give norm-compatible Kummer classes. The source's displayed minus-one unit sequence is torsion and is not mistaken for a nontrivial Euler-system generator. |
| `L4/tate-twist-greenberg-selmer` | verified | At p the condition is full for positive n and unramified for n nonpositive. The base is the plus tower, and complex-conjugation parity selects the appropriate X or Y eigenspace. |
| `L4/criticality` | verified | The actual archimedean Gamma factor determines pole orders at one for V and its Tate dual. Both vanish for a critical datum; n=0 is excluded in the rank-zero Tate example. |
| `L4/greenberg-main-conjecture` | verified | The main conjecture is a proposition on supplied analytic data, not an existence theorem or a proved equality. Fraction-field normalization and positive-corank alternatives remain separate. |
| `L4/greenberg-conjecture-tate-twists` | verified | Twisting the characteristic ideal translates the positive even Tate conjecture to the cyclotomic proposition. The node proves equivalence of propositions, not the main conjecture itself. |
| `L4/bloch-kato-condition` | corrected | The crystalline exact fragment uses Qp-linear one-minus-Frobenius, not K0-linearity. Dimensions include [K:Qp]; exact-annihilator compatibility is asserted for de Rham coefficients. Changes: Fixed the scalar field in the dimension formula, qualified annihilator duality, and replaced ambiguous unit tensors and the qualitative Greenberg test by precise examples. |
| `L0/kummer-cup-shapiro` | verified | The finite Kummer, projection and Mackey squares precede coefficient limits; cup products retain the canonical coefficient maps and norm convention. |
| `L0/weak-semisimplicity` | corrected | Only the invariant eigenvalue is tested. Closed image of sigma-minus-one in finite-type p-adic modules justifies continuous coinvariants; nontrivial Jordan blocks distinguish weak from full semisimplicity. Changes: Removed irrelevant finite-index-descent citation; gave the elementary kernel/cokernel argument and its closed-image condition. |
| `L0/procyclic-integral-criteria` | verified | The finite free integral and residual dimension hypotheses in Liu Lemmas 2.1.3–2.1.5 are retained; residual inequalities are not replaced by rational semisimplicity alone. |
| `L1/derived-local-complements` | verified | Chain-level orthogonality includes a null homotopy and a comparison quasi-isomorphism. H1 orthogonality alone does not construct derived dual local conditions. |
| `L1/derived-selmer-duality` | corrected | Nekovar Theorem 6.3.4 gives the degree-three duality under admissible local complexes. The AGD import assumes condition P; the real p=2 extension is recorded separately. Changes: Corrected the source label and restricted the proved global-duality import to condition (P). |
| `L1/ordinary-annihilator-correction` | verified | Strict and inertia ordinary complexes differ by quotient invariants; the H0 correction survives unless the explicit comparison is a quasi-isomorphism. |
| `L1/nonsingular-pairing` | verified | Liu Lemma 2.2.3 asserts annihilation of nonsingular finite classes. No perfectness or exact-annihilator claim is inferred for arbitrary ramified finite modules. |
| `L2/selmer-complex` | corrected | The shifted cone is the homotopy fibre of global-plus-local-condition maps. Its compact-support comparison uses condition P, with the real p=2 extension left as a gap. Changes: Qualified the compact-support identification by the actual supplier’s condition (P). |
| `L2/selmer-complex-h1` | verified | The local H0 quotient contributes before the classical Selmer kernel in the long exact sequence; the H1 comparison is conditional on that correction vanishing. |
| `L2/condition-change-triangle` | verified | Nested complexes yield the triangle with the shifted local quotient cone. Primitive/imprimitive comparisons retain the local condition complex, not just its H1 subgroup. |
| `L2/lattice-change-cone` | verified | A lattice quotient contributes global and local cones. Inverting p removes finite lattice-change errors but does not assert an integral isomorphism. |
| `L2/restriction-injective-descent` | verified | Vanishing descends after an injective restriction map. The possible inflation–restriction kernel is explicit; source E135 is a proof gap, not a counterexample under enormous-image adjoint hypotheses. |
| `L3/infinite-selmer-complex` | verified | Take the compact Selmer complex with induced Lambda coefficients and completed action, preserving local condition maps. It depends on the qualified finite-level Selmer-complex input. |
| `L3/derived-control` | verified | The specialization spectral sequence is Tor over Lambda with the chosen coefficient homomorphism. Integral local error complexes remain until shown acyclic. |
| `L3/kernel-control` | verified | Classical restriction control also has invariant and localization errors. Derived descent alone does not delete those errors from a kernel comparison. |
| `L3/correction-complex` | verified | The cone of the specialized local comparison is an actual complex; canonical acyclicity, rather than an arbitrary assumed equality, is the criterion for correction-free control. |
| `L3/iwasawa-selmer-duality` | corrected | Duality keeps the degree-three shift, dualizing complex and Lambda involution. Condition P is explicit; height-one disappearance of an error does not imply integral acyclicity. Changes: Kept the degree-three shift and involution; made condition (P) explicit rather than assuming a missing real-place extension. |
| `L3/iwasawa-finiteness-euler` | corrected | The displayed cyclotomic rank difference is retained for odd p and global H2 torsion remains weak Leopoldt. An unspecified real p=2 amplitude is no longer asserted. Changes: Stopped asserting an unspecified p=2 real-place amplitude; kept the proved odd-prime rank formula. |
| `L3/selmer-determinant` | verified | The arithmetic line is inverse determinant; its signed height-one lengths give char H2 divided by char H1 in degrees one and two. Generic acyclicity is essential. |
| `L3/etale-iwasawa-comparison` | verified | Kato's j-star comparison needs arithmetic K(pi,1), coefficient limits and inertia stalks. Finite-etale-cover equivalence alone is not enough and is not claimed sufficient. |
| `L3/rational-specialization` | verified | A fixed rational specialization uses lattice-independent derived base change and local corrections; it is not an integral control theorem or a conclusion about arbitrary specializations. |
| `L3/local-cofree-euler` | corrected | CGLS excludes trivial and cyclotomic residual characters at p. The rank-two elliptic case has good-reduction/no-local-p-torsion hypotheses, and the away-p factor uses arithmetic Frobenius. Changes: Added the actual non-p Euler-factor source, Lemma 1.1.1. |
| `L3/greenberg-structure-hypotheses` | corrected | LOC1/LOC2 use the compact Tate dual, while Greenberg's discrete D-star is its Lambda-dual tensor. The alternative residual/divisibility hypotheses remain explicit. Changes: Distinguished Greenberg’s compact T₀* from discrete D*; LOC1/LOC2 use the compact module. |
| `L3/localization-surjective` | verified | Greenberg's RFX/LOC/LEO/CRK and the stated alternatives provide surjectivity; residual irreducibility alone does not replace them. |
| `L3/selmer-no-pseudonull` | verified | The structural theorem keeps Greenberg's coreflexive/divisibility and global hypotheses. In dimension two pseudo-null is finite; higher-dimensional pseudo-null need not be finite. |
| `L3/selmer-fitting-characteristic` | corrected | Added the depth/Auslander–Buchsbaum supplier: no finite submodule in dimension two gives projective dimension at most one. A square presentation then identifies Fitting and characteristic. Changes: Added direct prerequisites for inputs used by the proof sketch. Corrected the Greenberg source label; the added L4 request supplies the depth/Auslander–Buchsbaum step. |
| `L4/cp-period-comparison` | verified | The completed algebraic closure, valuation and Tate–Sen input are a precise local-field Part II request. Existing BDeRham definitions are imported rather than reconstructed. |
| `L4/crystalline-period-ring` | verified | Construct the minimal classical divided-power period ring with topology, Frobenius and comparison map; this does not claim Mathlib's de Rham ring already supplies Bcris. |
| `L4/period-fundamental-sequences` | verified | Bloch–Kato 1.17 provides continuous sections and the exact period sequences needed by cochain cohomology. Algebraic exactness without the topology would not suffice. |
| `L4/period-realization` | verified | Dcris is a K0-space and DdR a K-space; filtered Frobenius invariants, comparison maps and dimension bounds are actual data, not a free Boolean crystalline predicate. |
| `L4/period-fixed-fields` | verified | Fontaine's fixed fields and dimension bounds use the completed-algebraic-closure input. Frobenius semilinearity and the two scalar fields are kept distinct. |
| `L4/fontaine-laffaille-data` | corrected | The finite filtered module has divided semilinear Frobenius and generation. Added the free-branch split-filtration predicate and a nonsplit pW test; the enlarged torsion category remains separate. Changes: Added a native predicate and discriminating test for the required split filtration in the free branch. |
| `L4/fontaine-laffaille-comparison` | verified | The width bound is p-minus-two over an unramified base. The covariant Niziol convention needs dualizing the original Hom realization; endpoint and interval-changing tensor claims are excluded. |
| `L4/torsion-crystalline-condition` | corrected | The bounded crystalline extension definition uses compatible lifts and coefficient actions. General interval subquotient closure is not justified merely by the small-weight Fontaine–Laffaille equivalence. Changes: Separated the general quotient-lattice extension predicate from the small-width Fontaine–Laffaille comparison. |
| `L4/integral-finite-comparison` | verified | Breuil's compatible reductions characterize the integral preimage of rational finite classes; Liu's scalar-change condition is retained, without a small-weight restriction on the general bounded interval. |
| `L4/torsion-crystalline-duality` | verified | The finite pairing includes the inverse different and compatible scalar restriction. Niziol's finite comparison and Liu's duality are not replaced by an unqualified finite perfect-pairing assertion. |
| `L4/ordinary-finite-comparison` | verified | Finite and ordinary conditions coincide only with the explicit exceptional invariant/filtration terms controlled. The Qp(1) full ordinary condition distinguishes it from finite units. |
| `L4/archimedean-realization` | verified | The opposed-filtration Hodge carrier is pinned Tau Ceti work; the separate complex-linear Betti involution and eigenspace dimensions supply the real Gamma exponents. |
| `L4/hodge-gamma-factor` | verified | Real diagonal signs and complex Hodge pairs give Deligne's factor. Mathlib Gamma is totalized at poles, so pole order is computed from the meromorphic formula, not evaluated zeros. |
| `L4/positive-rank-leading-term` | verified | The determinant/regulator datum is an explicitly proposed extension of rank-zero language. A supplied nondegenerate line trivialization and local correction lattices prevent a vacuous scalar equality. |
| `L4/arithmetic-tower-data` | verified | Class fields and unit/class norm towers come from existing reciprocity. This node packages their named Lambda modules and maps for the Selmer dictionary, not another reciprocity proof. |
| `L4/unit-class-exact-sequence` | corrected | The quotient is local units modulo global-unit closure, and compactness supplies inverse-limit exactness. Independently collated the published locator at p.193, correcting the packet's page numbers. Changes: Corrected the published Proposition 13.13/Corollary 13.14 locator to p. 193 after independent collation. |
| `L4/leopoldt-selmer` | verified | The strict-at-p Tate Selmer comparison uses Rubin I.6.4 and II.2.7 with the correct unit rank. It does not assert an unproved general Leopoldt theorem. |
| `L4/global-finite-reduction` | verified | Liu 2.4.3–2.4.6 compare finite crystalline local reductions, the chosen global lattice and conjugation hypotheses; global finite classes are not defined by raw unramifiedness at every prime. |
| `L4/uniform-away-p-bound` | verified | Purity of weight minus one and the inertia/residue conditions give a uniform away-p annihilator as in Liu 2.4.6(2); the bound is not asserted for arbitrary representations. |
| `L4/elliptic-finite-kummer` | corrected | Local Kummer needs completed E(Fv) before Qp rationalization. Added Rubin's Tate-module comparison; finite Tamagawa contributions need not survive the divisible or rational finite condition. Changes: Replaced the abstract local-point tensor by completed local points and added Rubin’s explicit completion comparison. |
| `L4/artin-adjoint-finiteness` | verified | Restriction lands in equivariant Hom of the finite p-class group and can have a finite inflation kernel. The finiteness conclusion survives these corrections. |
| `L4/ordinary-selmer-parity` | verified | The exact specialized parity statement is checked in Nekovar 12.2.3, with finite-local hypotheses. Its ordinary-family, nonvanishing and Heegner proof inputs remain a precise gap. |
| `L4/congruent-two-parity` | verified | Dokchitser–Dokchitser 4.19 explicitly attributes the p=2 result to Monsky. The residue table is for infinite Selmer corank including divisible Sha, with the primary-proof refinement still open. |

## Reader synchronization and manager follow-up

The issue authorizes edits to the packet, suggested file and this report, and permits a handoff note. It does **not** list `readmes/SelmerIwasawaCohomology.md` as a deliverable. The reader was reviewed and left unchanged. Packaging must derive its statements/API/tests/dependencies and source-issue prose from the corrected packet. In particular, synchronize the following sections (line numbers identify the reviewed reader):

| Reader location | Required update |
| --- | --- |
| Completion, lines55,203,223,365 | Completion identity/composition API, general upstream completion scope, positive real levels and finite-field characteristic, direct Kummer-limit dependency. |
| Weak semisimplicity, line150 | Replace the finite-index-descent dependency with the closed-kernel/image argument. |
| Derived duality and Selmer complex, lines500,647 | Correct Theorem6.3.4 and qualify compact-support/global duality by condition P. |
| Pontryagin/corank, lines616,763 | Add the exactness/biduality argument and inverse-action test; correct discrete examples and rename the compact-dual adapter/API. |
| Unramified/functoriality/dual conditions, lines730,836,917,1000 | Away-p test hypotheses, special-case source attribution, direct inertia/dimension inputs and closed dual conditions. |
| Iwasawa, lines1192,1228,1277,1297,1368,1404,1447,1491,1667 | Current all-degree Shapiro import and compact request; compact/discrete Greenberg dual notation; direct dependencies; CGLS lemma locator; rational-twist convention; condition P; remove unspecified real p=2 amplitude; depth/square-presentation input. |
| Unit/class and finite conditions, lines1891,1988,2130,2212,2268 | Published p.193; free split-filtration predicate/test; Qp-linear Frobenius and degree factor; bounded-target coefficient functoriality; completed elliptic local points. |
| Proof inputs, requests and corrections, lines2439,2455,2612 | Third gap, twentieth request, revised source verdicts including E135/E138 and duplicate-aware E7, plus current-library notes and revised counts. |

Manager actions: synchronize that reader during packaging; retain the three gaps and requested carrier interfaces as follow-up work; coordinate AGD's real p=2 derived extension; point higher-tier period/Fontaine–Laffaille and integral Iwasawa plans at their minimal L4 owner; point EulerSystemsCyclotomicMainConjecture at the Tate dictionary; integrate existing Hodge stage edges externally. There is no outstanding mathematical clarification required to accept this qualified planning pass.

## Validation and limitations

`python3 scripts/check_blueprint.py research/blueprint/packets/SelmerIwasawaCohomology.json`: zero errors and zero warnings. The final typed suggested declarations were checked with `lean-check`; exit0, with only `declaration uses sorry` warnings. The later contract/source-locator synchronization changes comments only. Memory availability exceeded the required threshold, one Lean check ran at a time, and no language server or library build was started.

The compiled subset contains completion, kernel, finite-pairing, filtered-Frobenius and native Hodge signature tests. Every target/API/test also has its precise named contract in the suggested file. Where canonical compact cochains, derived local complexes, periods or determinant carriers are not supplied, typed declarations are explicitly omitted under PROTOCOL13; the contracts are comments, not compiled declarations. Packaging must instantiate those signatures when the suppliers land. Compilation establishes elaboration of the available prototypes, not proof of the arithmetic targets or execution of the proposed unit tests.
