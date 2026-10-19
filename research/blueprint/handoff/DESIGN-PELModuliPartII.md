# DESIGN-PELModuliPartII — completed target pass

Issue: #3390. Agent: Codex. Session: codex-ImNKyq. Date: 19 October 2026.
Branch: codex-ImNKyq-pel-moduli-part-ii. The claim was confirmed by the swarm bot at 11:12:48 UTC.

## Delivered

The roadmap definition, blueprint packet, definitive reader and compact suggested Lean companion cover U0–U9. The packet is `complete` at target level: 71 nodes (13 definitions, 29 constructions, 18 theorems, 9 comparisons, 2 lemmas), 167 API items, 129 named unit tests, 47 planets and 13 read-at-pin baseline declarations. Each of the ten layers is `planned`; none is `closed`. All definitions and constructions have uses, API roles and at least three tests. Every implementation status is `unchecked`.

The 264 items routed by six extractions are individually assigned: Zhang 14, Li–Zhang 14, Li–Liu I 8, Li–Liu II 11, He–Li–Shi–Yang 4 and Liu–Tian–Xiao–Zhang–Zhu 213. The routing ledger is in the packet and reader. Part II owns common integral/formal unitary moduli and basic completions. The packet proposes a separate **PELModuliPartIII** with D0–D6 covering unitary Deligne–Lusztig/incidence geometry, basic correspondence fibres, balloon/ground/link strata, definite source uniformization, rank-increase diagrams, excess/cohomological interfaces and first geometric reciprocity. Its complete input is the set of ledger items assigned to it. Its brief’s source locators come from the input extraction and must be checked in that design; this run does not claim those sections source-closed.

The reader preserves every target statement, hypothesis, source locator, proof outline, API item, named check, acceptance condition, supplier contract, gap and source finding. It includes explicit height, signature, degree, Jordan-matrix, crossing, rank-two Krämer and period-line checks. No source passage or section-by-section source summary is reproduced.

## Exact work still needed

1. **Independent review of this completed design**, including the mathematical contracts, all source findings and the ownership split. No independent review verdict is supplied by this run.
2. **G1:** prove the two-component connectedness assertion for relative exotic spaces over general K. Wu’s Theorems 5.17–5.18 establish the Q_p case; the LL22 footnote does not provide the missing general-ground-field proof. Formal smoothness and parity labels are separated from connectivity.
3. **G2:** identify the precise global rank-two Krämer model and its reflex/coefficient descent. The local rank-two chart is derived here, but regularity after ramified coefficient extension does not follow. The global blowup/completion assertions are restricted to n≥3 with the stated unramified coefficient comparison.
4. Discharge the eleven supplier requests below. Their exact statements and direct `usedBy` lists are in the packet; the A6 export instead records its two routed input items, since it supplies those general theorems without creating an artificial local-moduli consumer. These are explicit dependency endpoints, not claims that current supplier layers already contain the stronger results.
5. If the maintainer accepts the split, create the Part III design from its ledger and D0–D6 brief, preserving its input extraction’s corrected statements and sourceIssues.

## Supplier requests and ownership

- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2:** strict relative polarized windows/displays, inverse-different duality, contraction/frame change, rigidity and integral Hom lifting, and canonical principal CM lifts. The current perfect-field theory is insufficient.
- **SchemeAndStackFoundations:SF.4:** RZ representability, formal closed conditions, locally finite-type topology, effectivity and formal blowup/chart interfaces.
- **SchemeAndStackFoundations:SF.1:** effective formal quotients by properly discontinuous arithmetic quasi-isogeny actions, with stabilizers, levels and CM partitions.
- **PELModuli:M4:** the specified CM polarization ideals/components, local reflex hypotheses and finite étaleness at the ramified places needed here. The existing p-unramified CM statement remains imported in its certified range.
- **GeometryOfNumbersAndQuadraticArithmetic:GN.2:** Hermitian determinant/norm and lattice classification, nearby two-place invariant switch, Landherr/Hasse statements and isocrystal realization.
- **ReductiveGroupsPartII:RG2.3:** the full polarized O_L-multichain automorphism group and its smoothness, including ramified Weil restrictions; the GL/GSp stabilizer and closed fixer alone do not provide this.
- **LubinTateFormalModulesAndQuasiCanonicalLifts:LT.3:** integral full Drinfeld level as a torsion Cartier-divisor equation, finite flatness, regular deformation rings and generic congruence identification. Its existing marked universal deformation is imported; no second tower is planned.
- **AdicSpacesPartII:R2:** generic fibres and generic finite étale/image comparisons of the mixed local space, without quasi-compactness assumptions on the whole RZ space.
- **ShimuraCompactifications:C5:** the exact bad-type unitary ampleness and integral properness argument; proper generic fibre alone is insufficient.
- **FaltingsFinitenessAndIsogenyTheorems:R28.4:** finite-field Tate and the basic algebraically closed residue-field comparison used in RZ96 §§6.27–6.30, beyond the current number-field theorem.
- **AbelianSchemesAndArithmeticModuli:A6:** the F-linear and connected-family characteristic-polynomial exports of Zhang21 Lemmas 7.10(b) and 7.11. Existing nodes already own 7.10(a).

The packet records twelve restructuring proposals: the Part III split and an owner extension/rescope for each requested export. There is no edit to any supplier, atlas data or upstream roadmap. This roadmap is outside the current top-tier bundle; no current-tier downward move was made.

## Audited baseline and current upstream

Pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.

The baseline records full declarations and surrounding assumptions, including finite-free characteristic polynomials; Scheme, Flat and Smooth; Tau Ceti’s field-based AbelianVariety and its existing smooth structural morphism; and the matrix, residue-ring and polynomial carriers used in the companion. A field-based abelian variety is not claimed to be an integral abelian scheme.

The current read-only TauCetiRoadmap tree was checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, and its current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine roadmaps newer than the atlas snapshot were checked for the relevant carriers. AlgebraicVectorBundles imports the general relative Grassmannian direction; IntegralLattices’ symmetric lattices do not supply Hermitian unitary chains. Existing PEL M0–M4, abelian A4/A6, reductive RG2.3, LT.3, ET.6a, Grassmannian, generic Shimura and compactification targets were read and imported in their actual ranges. Formal relative unitary moduli were not found in either library checkout. No build was run in the read-only trees.

## Source reading and corrections

The reader’s source catalogue and packet identify all fifteen files by edition, URL, read date, read sections and SHA-256. Read mathematics includes:

- Zhang21 §§3.1, 6, 7.3 and Lemmas 7.10–7.11, published pp. 879–881, 901–905, 908–913.
- LZ22 arXiv v3 §§2, 4, 10–11, 13–14, printed pp. 10–12, 21–23, 63–65, 73–77, 80–85.
- LL21 dated author copy §§4–9, especially admissibility and (8.2); LL22 dated author copy §2.1, §2.8, §§4.3/4.5, especially Proposition 2.62, Corollaries 2.65–2.66 and Proposition 4.30.
- HLSY23 v2 Definitions 2.1–2.2 and §10, pp. 10–12, 76–79; Howard19 §2, pp. 5–7.
- RSZ20 local/global moduli, split finite-Hom level, Lemma 8.16 and Appendices A–B; RSZ21 §§3–6, including the rank-two reflex warning.
- Mih19 v2 Definitions 2.7–2.8, Theorems 3.1/3.3 and relative-display proof, plus strict-module appendices; Cho18 Theorem 1.2 and the local-model/uniformization proofs; Wu16 Theorems 5.17–5.18; Krämer03 Definition 4.1, Proposition 4.3, Theorem 4.5 and (4.11).
- RZ96 public author scan: Definition 3.21, Theorem 3.25, local model 3.27 and §§6.13–6.16, 6.24, 6.27, 6.29–6.30, printed pp. 81–89, 282–295. In particular, the full basic locus needs the stated Hasse/framing-class condition, not just the component represented by a chosen framing.
- LTXZZ22 cleared published text: Definition 3.3.4 p. 147, §§4.1–4.2 pp. 159–163, §§5.1–5.2 pp. 188–193. Read in the maintainer’s library; neither the file nor passages were copied. Sections for Part III remain that design’s source-reading obligation.
- LRZ26 arXiv v2, revised 1 May 2026, Theorem 14.6.2 and §§15–16.5, pp. 60–71: the mixed first projection is integrally finite flat of degree q+1 and the second is a proper resolution with exceptional projective spaces, rather than an integral isomorphism with its lifting divisor. That divisor/intersection theory belongs to the cycle consumer; it is not assumed by the moduli uniformization here.

Seven edition-scoped source findings are recorded without inherited review objects. Five were already in the input extractions and were independently rechecked: HLSY’s missing framing-polarization clause and introductory filtration rank; LTXZZ’s adelic base, integral-properness proof obligation and vacuous period-line condition. Two are recorded as new after the searches listed in the packet: LZ’s printed mixed degree q contradicts the necessary local degree q², and the dated LL22 copy applies rank-n exotic conditions to A₀ instead of A on pp. 58 and 66. The degree finding is scoped to the required v₀-primary degree; away-p factors of a global representative are retained. No assertion about an unexamined published edition is made.

There is no missing source for the certified targets. The two mathematical extensions in G1/G2 remain unresolved; this is why the layers are planned rather than closed. No book outside the cleared-index permissions was used.

## Validation and Lean shape

`python3 scripts/check_blueprint.py research/blueprint/packets/PELModuliPartII.json` reports **0 errors and 0 warnings**. The routing ledger has 264 distinct items, exactly matching the six input routes. The dependency graph is acyclic and the packet is ordered by dependency. The reader contains every target, API name, named test and acceptance condition. Planets are confined to definitions, constructions and theorems, with at most six per layer and labels of at most sixty characters.

`lean-check research/blueprint/suggested/PELModuliPartII.lean` **compiled successfully at the pins**, exit 0. Its only warnings are the nine proof placeholders allowed by the suggested-file convention. It imports individual modules and has one light, real-bodied 2×2 matrix definition. There are no placeholder data definitions, invented framework carriers or arbitrary proposition fields. The arithmetic checks and imported abelian-variety smoothness are proved using existing infrastructure.

WORKERS.md’s binding shape of 12 October 2026 explicitly restricts the companion to statements over existing pinned carriers. It supersedes the older full-signature template in the generated issue/PROTOCOL §13. Consequently the 167 heavy API specifications and 129 mathematical tests are in the definitive reader, rather than encoded with fake carriers in Lean. The companion lists every target by layer and gives the easily statable signature, matrix, crossing, dimension and degree checks. Successful elaboration establishes that this companion typechecks, not that any integral moduli theorem has been formalized.

The only changed repository paths are the issue’s four deliverables and this handoff. No second job was claimed. Scratch source files and generators are disposable; all information needed for review and continuation is retained in these deliverables.
