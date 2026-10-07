# Handoff — BP-ExcursionOperatorsAndSpectralAction--ES5

Issue: [#727](https://github.com/CBirkbeck/tauceti-explorer/issues/727). Agent: Codex, session **codex-dJ6mRX**. Branch: **codex-dJ6mRX-bp-es5**. This continues the preceding partial blueprint; it is a completed target-level pass, not a checkpoint or a formalization claim.

## Outcome and deliverables

The packet has status **complete**, with all four stages **planned** and none closed. Every stage target is represented, and all prerequisite chains terminate in checked baseline declarations, exact supplier nodes, requested supplier stages or explicit gaps. Implementation status remains unchecked for every node.

The four deliverables are:

- `research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES5.json`
- `research/blueprint/readmes/ExcursionOperatorsAndSpectralAction--ES5.md`
- `research/blueprint/suggested/ExcursionOperatorsAndSpectralAction--ES5.lean`
- This handoff.

The packet contains **21 nodes** (2 definitions, 2 constructions, 16 theorems, 1 comparison), **22 API items**, **12 unit tests**, **13 planets**, **19 baseline declarations**, **8 gaps**, **13 requests**, and **4 structural proposals**. No layer has more than six planets.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES5.json` with a declaration index: **0 errors, 0 warnings**. The required default invocation also passed.
- `python3 research/blueprint/intake.py check-files` on exactly the four deliverables: **0 problems**.
- The suggested file **compiled successfully** using `lean-check research/blueprint/suggested/ExcursionOperatorsAndSpectralAction--ES5.lean`. The final run exited 0 and emitted only 53 expected declaration-uses-sorry warnings. Available memory was 108 GB before the run. No language server, library build, dependency update or cache download was started.
- The shared Mathlib build was at **082e2d37e8b0463410cdb532e111cd43d5a66174**. The suggested file imports individual Mathlib modules only. Tau Ceti's baseline declarations were read at **f790474821cf4256814db967cb154e7af3d0c369**; the file does not import a newer Tau Ceti revision.
- All 19 baseline declaration statements were checked at those commits, including the actual Nielsen–Schreier subgroup instance and the finite-index finite-generation instance. A declaration index located names but did not substitute for source reading.
- Literal excerpts were matched against whitespace-normalized source text; all four PDF hashes were independently checked. Every declaration name, API item and test name is synchronized across the packet, reader and suggested file. Source-issue and source-version schema checks passed.

The reader contains the full prototype omission ledger. Elaboration checks actual condensed algebra, representation/intertwiner, algebra-homomorphism and exact rational-point group interfaces. Imported reconstruction maps and kernel comparison equations remain explicit assumptions. Animated geometry, prescribed Weil projection, semisimplicity, continuity, smoothness, reductive schemes and the relevant cohomology are left out where they cannot yet be typed. The prototypes do not prove the full theorems.

## Stage coverage and what must be supplied for closure

- **`ExcursionOperatorsAndSpectralAction:ES5`: planned.** Close SR.3b admissibility and the enriched fixed-vector/stratum-adjunction supplier requests. Refine the exact LP2 continuity interface and replace omitted geometric prototype conditions.
- **`ExcursionOperatorsAndSpectralAction:ES6`: planned.** Resolve the requested supplier interfaces used by each excursion/centre comparison.
- **`ExcursionOperatorsAndSpectralAction:ES6:functoriality`: planned.** Close HS4/VS5 kernel and exterior-Hom refinements. Create the RG2.6 and period-geometry extensions; supply full equal-characteristic reciprocity. Verify the torus endpoint inversion and general-field/modular z-comparisons.
- **`ExcursionOperatorsAndSpectralAction:ES6:duality`: planned.** Supply the all-coefficient admissibility and contragredient/induction dictionary, respecting the late ES7 return. Replace the prototype duality character equations by the actual enhanced duality interfaces.

### Precise gaps

1. **All-coefficient admissibility supplier.** The current SR.0 defines admissibility and SR.3/SR.3a prove complex results; they do not supply the modular theorem. SR.6 is downstream. Create the proposed independent SR.3b and read Vignéras II.2.8 before treating this input as closed. Qbar_ell is uncountable; the countable-field issue is Fbar_ell.
2. **Enriched noncompact Schur and stratum adjunction interfaces.** The existing VS4 and HS1 nodes do not explicitly provide the condensed fixed-vector endomorphism comparison, VII.7.2’s enriched relative-homology left adjoint or eligible right-extension comparison. The mathematical proof outline is given, but these exact reusable supplier declarations remain required.
3. **Pre-evaluation kernel and exterior-generator precision.** HS4’s comparison node states the centre diagrams but records only an opening read of IX.6.1; the complete relative-homology kernel formula is requested. VS5 must provide the VII.7.10 exterior Hom formula at the required coefficients. These are supplier refinements, not new local definitions of their geometry.
4. **Foundational induced-torus and z-extension scope extension.** No existing RG2.5 node plans induced-torus resolutions or z-extension existence. Confirmed finding 10 calls for a new foundational RG2.6, with BG/ET consumers outside this issue’s allowed paths. The proposal here routes that need and does not make a nonexistent stage into a prerequisite.
5. **Full equal-characteristic reciprocity.** The upstream ClassFieldTheory document fixes normalization, but its equal-characteristic endpoint excludes wild p-primary norm/existence theory. The torus theorem for all E needs that full reciprocity interface. Request a Part II for the missing range; retain upstream layer 9 only for the interface it actually states.
6. **Lubin–Tate torsor and Hecke endpoint inversion adapter.** RF3 supplies O(1) and its sign, not II.2.1’s Lubin–Tate torsor. Fargues’ author copy 2.16/3.3 identifies the torsor descent and the inverse-character/inverse-Artin monodromy. The complete endpoint action calculation connecting that convention with this Hecke kernel, including modular/equal-characteristic coefficients, still needs a supplier extension and explicit verification.
7. **Z-embedding field range and modular extension of characters.** Kaletha §5 is p-adic and the following representation paragraph uses complex characters. The extension to arbitrary algebraically closed L, and the alternative z-extension descent route for general E, require a proof. Specify the appropriate cohomology of possibly nonsmooth centres in equal characteristic; do not transfer p-adic finiteness of centre H1 without checking it.
8. **Prototype geometric conditions unavailable at the pins.** The suggested file elaborates actual condensed algebra and representation/algebraic interfaces. Animated categories, the geometric kernel identities, semisimplicity, the full prescribed Weil projection, relatively discrete continuity, reductive z-embedding/cohomology conditions and smoothness of extensions are omitted. Its classifier and kernel comparisons are explicit imported maps/equations, not implementations of the full theorems. Replace those fragments with exact owner interfaces when available.

### Supplier requests

- **`SmoothRepresentationsOfLocalGroups:SR.0`**: The actual arbitrary-coefficient smooth representation category, its irreducible objects, scalar unit and central characters, compatible with the pinned SmoothDiscreteTopRep carrier.
- **`SmoothRepresentationsOfLocalGroups:SR.2`** (scope extension): Add foundational SR.3b after SR.2: admissibility of every irreducible smooth representation over algebraically closed characteristic ell different from p (Vignéras 1996, II.2.8), then scalar endomorphisms. For characteristic-zero Z_ell-fields the uncountability/Dixmier argument is available. SR.3/SR.3a are complex-only and SR.6 cannot supply an ancestor of ES5. Also give the smooth central-character extension and duality/induction dictionary for these coefficients.
  Proposed owner: `SmoothRepresentationsOfLocalGroups:SR.3b`.
- **`VStackSheavesAndLisseCategories:VS4`**: VII.7.1–7.2 with condensed enrichment: relative-homology L_b=pi_b-sharp q_b^* left adjoint to i_b^*, invertible scalar-preserving unit, mapping-object comparison for noncompact representations, and eligible right extensions/retraction comparisons. The existing compact-generation node supplies the stratum equivalence, but not this whole adjunction API.
- **`HeckeStacksAndLocalShtukas:HS1/condensed-enrichment`**: IX.1.2 and the fixed-vector evaluation comparison needed to identify the condensed equivariant endomorphisms of an admissible smooth pi with relatively discrete L, without assuming pi is compact.
- **`LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`**: Specify the exact two VIII.3.8 relations, prescribed Q-projection and maps of condensed sets for arbitrary algebraically closed Z_ell-fields. Audit the characteristic-ell finite-anchor continuity argument separately from Lafforgue’s characteristic-zero Reynolds step; the local theorem is the unique supplier.
- **`HeckeStacksAndLocalShtukas:HS4/isogeny-product-and-weil-restriction-diagrams`**: Supply the actual pre-evaluation geometric diagrams: pi_H-sharp kernel formula of IX.6.1, product kernels over a common divisor-leg base, and the closed Weil-restriction Hecke immersion implementing inflate-then-induce. Correct the repeated G1 product factor and use a common ambient-normal wild subgroup.
- **`VStackSheavesAndLisseCategories:VS5`**: VII.7.10: compact exterior generators and the derived Hom tensor comparison with compact A_i and arbitrary B_i; retain its coefficient/enrichment conventions.
- **`SmoothRepresentationsOfLocalGroups:SR.1`** (scope extension): Arbitrary-coefficient abelian-category Bernstein centre and its inverse limit of pro-p idempotent Hecke corners, as in confirmed finding 9; for an abelian locally pro-p group identify these with Lambda[T(E)/K]. SR.3’s complex Bernstein blocks are not the supplier.
- **`ReductiveGroupsPartII:RG2.5`** (scope extension): Proposed foundational RG2.6 after RG2.5: z-extensions with induced-torus kernel and simply connected derived group, induced-torus resolutions, functorial pi_1 and the compatible dual maps. RG2.5 currently supplies only dual/root data. Keep the z-embedding definition in ES6; do not claim RG2.5 already proves any z-extension existence theorem.
  Proposed owner: `ReductiveGroupsPartII:RG2.6`.
- **`BunGAndNewtonStrata:BG1/abelianization-identification`**: The torus specialization B(T)=pi_1(T)_Gamma and all degree components, compatible with the already supplied torsor and stratum equivalences; give the maps used by torus resolutions.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`** (scope extension): Consume the fixed arithmetic Artin and topological Weil abelianization interfaces in their stated field range; supply the consumer conversion rec_geom=Art_arith composed with inversion. Full equal-characteristic wild p-primary reciprocity lies beyond the upstream prime-to-p endpoint and needs a ClassFieldTheory Part II, not a re-plan of upstream layers.
  Proposed owner: `ClassFieldTheoryPartII:full-equal-characteristic-reciprocity`.
- **`RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`** (scope extension): Extend the relative period-geometry direction with II.2.1–II.2.4: height-one Lubin–Tate universal cover as H0(O(1)), the punctured E-times torsor on Div1, and its Frobenius/endpoint action. The existing RF3 node gives line-bundle signs only; it does not give this torsor.
  Proposed owner: `RelativeFarguesFontainePartII:Lubin-Tate-torsor`.
- **`ReductiveGroupsPartII:RG2.5`** (scope extension): For the ES6-owned p-adic z-embedding construction supply the diagonalizable centre, pushout along Z(G) to a torus, finite centre H1 and norm-kernel interfaces used by Kaletha 5.2. For arbitrary E distinguish a genuine eligible z-embedding from the separate z-extension cover and verify the rational/dual-centre descent comparison.

## Verified red-team findings

- **RT-AREA-geomlanglands/7:** ES6 functoriality and duality explicitly import the exact ES1:spectral-center/spectral-to-geometric-center-map node. The finding's ES2/ES4/ES7 edges are outside this issue's permitted files and remain tasks for their owners. ES7's general smooth-dual proof return is kept separate from functoriality.
- **/8:** Request independent SR.3b after SR.2 for modular admissibility and scalar endomorphisms. ES5 owns only the condensed refinement and enriched transport. Retain the verifier's correction: Qbar_ell is uncountable; Fbar_ell is the countable case. Do not use the late SR.6 as an ancestor of ES5.
- **/10:** Follow the verifier's clarified division: RG2.6 owns foundational surjective z-extensions and induced-torus resolutions; injective z-embeddings, rational central lifting and their parameter applications stay in ES6. Kaletha's source is named correctly as Rigid inner forms vs isocrystals, arXiv:1502.00650v2. Its p-adic hypotheses are retained; equal-characteristic descent is recorded separately.
- **/9**, encountered through the torus dependency: the arbitrary-coefficient abelian Bernstein centre is requested from SR.1, rather than the complex Bernstein-block theorem in SR.3.

## Corrections to the preceding checkpoint

The earlier partial attempt's useful target coverage and source route are retained and refined. Its remaining notes should not be used in place of this handoff:

- All three clauses of VIII.3.8 and both relations were recovered and read. There is no remaining damaged-extraction gap. The general-coefficient theorem is still imported from LP2, its unique owner.
- The full IX.6.1 proof was read: it explicitly compares relative-homology kernels. The plan uses π♮ and S′_V with the leg base, rather than confusing the pushforward with π! or ordinary π_*.
- The exact enriched stratum-adjunction and centre-independence argument is now given, with the noncompact condensed refinement explicitly requested from its owners. It does not assume every irreducible representation is compact.
- No Schreier rank formula is needed for IX.6.3. Existing freeness and finite generation supply the finite-free input, and the proof now spells out the nonabelian Shapiro construction rather than invoking abelian group cohomology for it.
- Upstream ClassFieldTheory already specifies the arithmetic normalization. The geometric inversion is a consumer convention; no upstream normalization repair is proposed. Its full equal-characteristic wild range requires a Part II.
- The reviewed library audit is present and was read. The local reconstruction theorem is owned by LP2; the global-shtuka parameter theorem is not duplicated or used as a replacement for it.
- The product display typo is separately recorded as E2; E1 already belongs to the preceding part's finite-set reindexing finding.

## Sources read and reproducibility

The source records in the packet include exact hashes, editions, URLs and the passages read. They suffice to reacquire the sources after worker scratch cleanup. The reader records the same source route and numbering conventions.

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Laurent Fargues, Peter Scholze. Author-hosted 356-page preprint; locators below use its printed pages, which equal PDF pages. Separately collated with arXiv:2102.13459v4 (27 November 2024); not the 2026 published pagination. SHA-256: `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
  - II.2.1, pp. 58–61: the height-one Lubin–Tate universal cover, O(1) sections and the E-times torsor on Div1.
  - VI.12.1 and its complete proof, pp. 239–241: switching, Chevalley and the rho(-1) sign.
  - VII.7.1–VII.7.2 and proofs, pp. 271–273; VII.7.9–VII.7.10, pp. 275–276: stratum equivalence, relative-homology left adjoint and exterior Hom comparison.
  - VIII.3.7–VIII.3.8 with all three clauses and both relations, pp. 288–290; VIII.4 and VIII.4.3, pp. 290–293.
  - IX.1–IX.2, pp. 320–323: condensed enhancement and relative-homology Hecke operators.
  - IX.4–IX.6, pp. 327–333, including complete proofs of IX.6.1–IX.6.5. IX.6.2 display visually checked and compared with arXiv v4.
  - IX.7.1, p. 334: centre restriction to strata and assertion of embedding independence; IX.7.3, pp. 337–338: the parabolic input to smooth duality.
- [Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale](https://arxiv.org/pdf/1209.5352v10), Vincent Lafforgue. arXiv:1209.5352v10, 10 January 2018; J. Amer. Math. Soc. 31 (2018), 719–891. Locators are preprint pages. SHA-256: `b37715f9c42862b7560d8b71da07924376e3cbbbe862ef9e89a57d8c91a64295`.
  - Proposition 11.7 and proof, pp. 143–147, including Lemma 11.10: finite anchors, uniqueness, multiplicativity and the characteristic-zero continuity argument. The local general-coefficient character theorem is imported from LP2, not re-planned from the global application.
- [Rigid inner forms vs isocrystals](https://arxiv.org/pdf/1502.00650v2), Tasho Kaletha. arXiv:1502.00650v2; published J. Eur. Math. Soc. 20 (2018), 61–101. Locators are preprint pages. SHA-256: `067aa7999a96980da07ebf90ab5cf7b30819a34235460c0818ad6d96dae2cfb3`.
  - Section 5.1, pp. 16–19: Definition 5.1, Proposition 5.2, Corollary 5.3 and Facts 5.4–5.6, with proofs and representation-extension paragraph. The field here is p-adic.
- [Simple connexité des fibres d’une application d’Abel-Jacobi et corps de classe local](https://webusers.imj-prg.fr/~laurent.fargues/cdc.pdf), Laurent Fargues. Author-hosted preprint cdc.pdf; published Ann. Sci. Éc. Norm. Supér. (4) 53 (2020), 89–124. Proposition numbers and pages below are those of this author copy. SHA-256: `35c7268fd6ce086f1267a00c18e02900c87ed5da65781d3b8695644d6e8fef73`.
  - Section 2.3 and Proposition 2.16, pp. 8–10: Lubin–Tate torsor and Frobenius descent.
  - Propositions 3.1 and 3.3 with proof, pp. 12–13: the Weil dictionary and inverse-character/inverse-Artin normalization.
  - Section 5.2, pp. 18–19: geometric reciprocity and equal-characteristic range, used to identify the requested scope.

Additional reading: the roadmap and its reviewed library audit; PROTOCOL, WORKERS, expansion PROTOCOL and UPSTREAM_GUIDE; upstream AdicSpaces and InductionRestriction documents; exact LP, GS, HS, VS, BG, RF and ES supplier statements; the verified red-team findings; and upstream ClassFieldTheory's documented local reciprocity range.

The author-hosted Fargues–Scholze manuscript was collated with arXiv:2102.13459v4. Source issue **ExcursionOperatorsAndSpectralAction/E2** records the repeated G1 factor in the IX.6.2 geometric-centre display; the second factor is G2. Visual inspection and independent collation confirmed the repetition in both preprints. E3 records the factor sheaf domains Bun_(G_i) in the same proposition; E4 records the reversed G to Gprime direction in the IX.6.1 proof prose. Their effect is nothing on the intended mathematics. All three slips were visually checked and collated with arXiv v4. The 2026 published volume's public sample does not contain that display, so no published-version finding is asserted. The source-version records distinguish these texts.

Unread or unresolved source inputs are explicit: Vignéras II.2.8 was not read; the full 2026 published IX.6.2 display was unavailable in the public sample; the torus Hecke-endpoint inversion calculation still needs verification; and the arbitrary-field z-extension route and modular smooth character-extension interface require their supplier proofs. These are not silently presented as established closure.

## Where an independent review should begin

Check the condensed fixed-vector scalar comparison without compactness, the actual left/right stratum retractions, and the LP2 characteristic-ell continuity interface. Then check the kernel formulas before scalar evaluation and the explicit nonabelian Shapiro comparison. For tori, verify the Hecke endpoint conventions and completed-centre diagonal equality, rather than only individual characters. Finally inspect Kaletha's p-adic field range, common pseudo-z refinement and the distinct general-field z-extension request. Closure requires the eight gaps above to be discharged by their owners; this completed target-level pass is ready for independent review.
