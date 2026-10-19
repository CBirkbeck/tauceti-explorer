# Handoff: DESIGN-HilbertModularVarietiesAndShimuraCurvesPartII (issue #3433)

Worker: Claude (session claude-jAXrGB), 2026-10-19.

## What was done

The brief bundled three continuations of HilbertModularVarietiesAndShimuraCurves. They are independent directions, so, as the brief instructs, the first is planned here and the other two are split off by `restructure` entries:

- **Planned here:** PAPER-BREUIL-ETAL-23 → HilbertModularVarietiesAndShimuraCurvesPartIIModpCohomologyGK, i.e. §8 of Breuil–Herzig–Hu–Morra–Schraen (Invent. Math. 234 (2023), arXiv:2009.03127v7). All 24 route items are mapped to nodes in `routeCoverage`.
- **Split:** PAPER-ICHINO-PRASANNA-23 → HilbertModularVarietiesAndShimuraCurvesPartIIQuaternionic (4 items; consumer HodgeClassesForJacquetLanglands waits on it through its gap "Quaternionic Shimura realization interface"). Also split: PAPER-BOXER-CALEGARI-GEE-PILLONI-21 → HilbertSiegelModularVarieties (20 items; consumer AbelianSurfacesPotentialModularity imports Hilbert–Siegel varieties from it). Their items appear in `routeCoverage` with the disposition "split".

Deliverables:

- `research/blueprint/roadmaps/HilbertModularVarietiesAndShimuraCurvesPartII.json`: six layers GK.0–GK.5, area arithmeticgeometry, parent HilbertModularVarietiesAndShimuraCurves.
- `research/blueprint/packets/HilbertModularVarietiesAndShimuraCurvesPartII.json`, status `complete`:
  - 40 nodes: 5 definitions, 7 constructions and 28 theorems.
  - 80 API items, 53 unit tests, 19 planets and 18 pinned Mathlib declarations.
  - 4 gaps, 3 requests (two "imported, no new content", one extension request to the parent's R18.3) and 5 source findings.
  - `scripts/check_blueprint.py` with the pinned index reports 0 errors and 0 warnings.
- `research/blueprint/readmes/HilbertModularVarietiesAndShimuraCurvesPartII.md`: about 29,500 words, generated from the packet with the site renderer's escaping.
- `research/blueprint/suggested/HilbertModularVarietiesAndShimuraCurvesPartII.lean`: about 230 lines. **It compiled.** `lean-check` (Mathlib 082e2d3, Tau Ceti f790474) reports `sorry` as its only warning, and a `run_cmd` audit found no `sorry` inside any statement or definition value. It states only what is statable at the pins:
  - the numerical genericity predicates with decidable tests;
  - the variable count of R∞;
  - Hamann's cancellation;
  - freeness over scheme-theoretic supports and fibre products (BHHMS Lemmas 8.2.1 and 8.3.8);
  - the Gram-determinant factorisation behind the doubling at w₁ (proved);
  - the arithmetic of the GK lower bound.

## Ownership decisions

- **Local mod p theory.** All of it (BHHMS §§2–3, 5–7: weights, Diamond modules, GK dimension and the local bound, first-order envelopes, the lattice R, relative projectivity) comes from the accepted ModpRepresentationsOfGL2OverLocalFields MP.3–MP.9 and is cited node by node.
- **Parent and other suppliers.** These are cited by accepted node ids:
  - Shimura curves, definite forms, cohomology, Hecke operators, degeneracy maps and non-Eisenstein control: HilbertModularVarietiesAndShimuraCurves R18.1–R18.4.
  - Taylor–Wiles data: GlobalGaloisDeformations R04.
  - Patching and commutative algebra: DeformationAndDerivedPatchingAlgebra R03.
  - Completed cohomology, completed Hecke algebras and Auslander regularity of O⟦U⟧: CompletedCohomologyPartII CC.1, CC.3, CC.5, CC.8.
  - The patched weight filtration: GL2ModularityLifting R32.2.
  - Potential diagonalisability: PotentialAutomorphyInfrastructurePartII PL.1.
  - Schikhof duality: LocallyAnalyticDistributionsPartII ND.6.
- **Planned here because no roadmap owns them:**
  - BDJ weight sets for unramified local fields.
  - The Gee–Kisin weight theorem, in BHHMS's normalisation.
  - EGS15 fixed-determinant patching functors and the Shimura-curve patching functor at v.
  - The big patched module (Dotto–Le §6.2).
  - Gee–Newton Appendix A beyond CC.5: grade under power-series variables, Cohen–Macaulay transfer and noncommutative miracle flatness.
  - Freeness of the 𝔪-localised mod p cohomology over the group ring of a level quotient (GK.0/non-eisenstein-freeness). HMV R18.4/central-character-exactness gives only the central quotient, and R18.3/tw-freeness only the definite Taylor–Wiles case.
- **Different from the parent's functor.** HMV R18.4/quaternionic-ihara-patching-functor (Manning–Shotton) patches types at a place away from p. It is not the functor at v and is not reused.

## What remains (gaps)

1. `gap/tame-types`. Tame inertial local Langlands for GL₂(O_{F_v}) with F_v unramified, the constituents of σ(τ) (BHHMS Proposition 2.4.3, Lemma 2.4.4), EGS15 Propositions 3.5.1–3.5.2, the lattices σ_J°(τ) and the capped intervals (EGS15 §§5.1, 10.1). **Owner:** the pending DESIGN-LocalGaloisDeformationRingsPartII (#3432), whose first route is BHHMS's tame potentially Barsotti–Tate route.
2. `gap/single-type-rings`. EGS15 Theorem 7.2.1; BHHMS Proposition 4.2.1 and Corollary 4.2.6. **Owner:** same as 1.
3. `gap/multi-type-ring`. BHHMS Proposition 4.3.1, Lemma 4.3.2 and Proposition 4.3.3. **Owner:** same as 1.
4. `gap/breuil-mezard-pbt`. Gee–Kisin Theorem A, Corollary 5.4.5, and the support statements for Serre weights that EGS15 cites by their 2012 numbering. Also Gee–Liu–Savitt's W^{BT} = W^{BDJ}. **No owner.** A `rescope` restructure entry proposes routing Gee–Kisin and Gee–Liu–Savitt as a paper job, or adding them to the LocalGaloisDeformationRingsPartII design.

When #3432 is accepted, a follow-up should replace gaps 1–3 by its node ids. Stage coverage:

- GK.2 is `closed`.
- GK.0, GK.1, GK.3 and GK.4 are `planned`, with exactly these replacements as `remaining`.
- GK.5 is `planned` because it rests on those layers.

## Requests

- `HilbertModularVarietiesAndShimuraCurves:R18.3`: an extension request, for the definite case only. The parent plans definite class sets, forms and Taylor–Wiles freeness in the Khare–Wintenberger setting (F of even degree, D unramified at the finite places). BHHMS's definite case needs a totally definite D with arbitrary finite ramification. The indefinite case, which is the main theorem, is not affected.

- `PadicMeasuresIwasawaAlgebras:L1`: completed group algebras, imported with no new content. Current Tau Ceti a91d3aaf has `completedGroupAlgebra`, which is not at the pin.
- `SmoothRepresentationsOfLocalGroups:SR.0`: smooth representations, imported with no new content.

## Source findings (`sourceIssues`)

- E1 (new, misprint): in the proof of BHHMS Proposition 8.3.7, the dimension of Hom_K(σ_v, π) is printed as f where r is meant.
- E2 (known, error; BHHMS Remark 8.1.3(i)): the adelic centre should act through ψ^{−1} in EGS15 §6.2.
- E3 (known, gap; BHHMS Remark 8.1.3(iii)): EGS15 §6.2 uses the Shimura curve where its quotient by the free finite central action is needed.
- E4 (new, misprint, affects nothing): BHHMS cite Gee–Newton miracle flatness as Corollary A.30, but it is Proposition A.30 in arXiv v5. The published numbering was not checked.
- E5 (new, misprint, affects nothing): EGS15 §6.4 cites Gee–Kisin Corollaries 5.6.4 and 4.5.7 by the 2012 numbering; these numbers do not exist in arXiv v5.

## Sources read

These are listed with SHA-256 in the packet:

- BHHMS arXiv v7, §§1, 2.2 and 8 in full.
- EGS15 arXiv v3: §2.1, §3.5 and §§6.1–6.4.
- Gee–Newton arXiv v5: Appendix A and §4.3.
- Gee–Kisin arXiv v5: the introduction, Remark 5.2.2 and §5.5.
- Dotto–Le arXiv v2: §6.
- Le (ANT 2019): Lemma 4.5.
- Le–Morra–Schraen: Lemma 4.5 and Proposition 4.6.
- BDJ10: §§3.1–3.2.
- CEGGPS arXiv v5: Proposition 2.13 and Lemmas 4.17–4.18.

Not read in the original:

- Hamann (Pacific J. Math. 1975). It is used only through BHHMS Lemma 8.1.2, and the node gives an elementary proof for the complete regular case actually used.
- Breuil (Crelle 2014), Lemma 9.2, and Breuil–Paškūnas Lemma 14.1. These are replaced in GK.5/patched-gk-dimension by π^{K₁} ≅ D₀^{⊕r}.
- Gee–Liu–Savitt.

## Checks run

- `python3 scripts/check_blueprint.py` on the packet, with the pinned index: 0 errors, 0 warnings.
- `python3 research/blueprint/intake.py check-files` on the deliverables.
- `lean-check` and the audit described above.
- A Sonnet supplier-contract cross-check of all 128 foreign citations.
- A Sonnet check of every node statement and locator against the source texts.

**Supplier-contract check (first pass).** 57 ok, 51 caveat and 20 mismatch. I verified each mismatch myself and made these changes:

- A new node, GK.0/non-eisenstein-freeness, replaces the central-only supplier R18.4/central-character-exactness wherever freeness over a non-central level quotient is needed. It also replaces the completed-tower Hochschild–Serre node CC.6 in GK.1/patched-fibre-identity.
- In the w₁ doubling, the parent's q ≡ 1 mod p nodes (R18.3/steinberg-residual-obstruction and iwahori-selected-root) are replaced by:
  - local–global compatibility away from p (AutomorphicGaloisRepresentations R19.4);
  - the Gram identity, and an explicit Eichler–Shimura step.
- The ℚ-only numerology R04.6 is replaced by Gee's generator count, R04.5/taylor-wiles-generator-count.
- The totally-split, definite GL2ModularityLifting R32.2 nodes are dropped from the Gee–Kisin node; general patching (R03.5) is used instead.
- The unitary and p-split R31.5 nodes and CC.4 are dropped from the big patched module, which is now built from finite-level freeness plus R03.5. R31.5 is mentioned as an analogue only.
- The commutative R03.3 Auslander–Buchsbaum, miracle-flatness and flatness-by-fibres nodes are dropped from the Iwasawa-algebra nodes. Venjakob's results are cited through Gee–Newton Proposition A.4.
- CC.5/banach-admissibility is dropped from the Banach lifts.
- MP.7/diamond-connected and MP.8/projective-truncation are added where the check showed they were needed.
- The R18.3 request above is added for the definite case.

The caveats are addressed in the hypotheses and proof steps, for example the normalisation of 𝔪 against R18.3/residual-hecke-ideal and the twist of Hodge types into [0, h].

**Statement and locator check.** 13 of 39 nodes were flagged, and all the flags were valid. The fixes:

- The BDJ nonsplit case now carries its two exceptional modifications and the ω_f normalisation note.
- The unweighted π dévissage is restricted to the shrunken levels of BHHMS (83).
- The Gee–Kisin node now states the modularity hypothesis (60) and the fixed character ψ.
- The derived statements are marked as derived (p ≥ 29, the second form of the cancellation lemma, H² vanishing).
- The locators are corrected: the BDJ10 sections, BHHMS pp. 13–14, Theorems 1.9 and 1.10 on p. 10, the EGS15 minimality paragraph, and the Gee–Kisin Theorem B = Corollary 5.5.7.
- σ_v ∈ W(r̄_v^∨) is added to GK.4/adjoint-type-lattices.
- π^{K₁} ≅ D₀^{⊕r} is attributed to the proof of BHHMS Proposition 8.2.6.
- The LMS22 description is corrected.

**Second pass.** A second Sonnet check covered the 20 new or changed citations: 12 ok, 8 caveats and no mismatch. The caveats are answered in the proof steps, chiefly:

- the Jacquet–Langlands bridge (R18.4/quaternionic-jacquet-langlands-bridge) is now used before Carayol's compatibility at w₁;
- the depth condition for MP.8;
- the quaternionic form of the CC.8 tower.
