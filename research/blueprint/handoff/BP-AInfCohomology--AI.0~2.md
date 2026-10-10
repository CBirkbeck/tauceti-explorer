# BP-AInfCohomology--AI.0~2 handoff

Completed revision of issue [#6915](https://github.com/CBirkbeck/tauceti-explorer/issues/6915) by Codex, session `codex-lnF2Fv`, on 2026-10-10. The confirmed claim was [comment 6093517559](https://github.com/CBirkbeck/tauceti-explorer/issues/6915#issuecomment-6093517559). This is a completed target-level planning pass, not a checkpoint or a mathematical implementation.

## Deliverables and status

- [Packet](../packets/AInfCohomology--AI.0.json): status `complete`, all implementation statuses `unchecked`.
- [Reader](../readmes/AInfCohomology--AI.0.md): regenerated catalogue with matching statements, hypotheses, prerequisites, APIs, tests and full locators.
- [Suggested Lean file](../suggested/AInfCohomology--AI.0.lean): every promised export and API has a resolving signature; all test contracts have examples.
- The previous `review` object is unchanged, including its historical `needs_changes` verdict. The next independent reviewer replaces it. No acceptance or stage closure is asserted.

All 131 previously reviewed node identifiers remain. Six key reconstruction inputs were added under the current upstream ownership order. Counts: 137 nodes (3 definitions, 25 constructions, 45 lemmas, 24 comparisons, 3 applications, 37 theorems), 118 API items, 85 unit-test contracts, 31 planets and 33 baseline declarations. Each definition/construction has at least three tests. All eight stages are planned, none closed. The pass stops at target-level coverage below the 300-node budget.

| Stage | Nodes | Planets | Coverage |
| --- | ---: | ---: | --- |
| `AInfCohomology:AI.0` | 17 | 3 | planned |
| `AInfCohomology:AI.0:integral` | 5 | 2 | planned |
| `AInfCohomology:AI.0:period-comparison` | 1 | 1 | planned |
| `AInfCohomology:AI.1` | 41 | 6 | planned |
| `AInfCohomology:AI.2` | 24 | 6 | planned |
| `AInfCohomology:AI.3` | 15 | 4 | planned |
| `AInfCohomology:AI.4` | 18 | 5 | planned |
| `AInfCohomology:AI.5` | 16 | 4 | planned |

## Changes addressing the independent review

1. Added all 75 declaration signatures listed in [REV-AInfCohomology--AI.0](../reviews/REV-AInfCohomology--AI.0.md). They retain the actual coefficient maps, complexes, localizations, module conditions and comparison conclusions. Unavailable geometric or enhanced hypotheses are stated beside the prototype, rather than encoded as opaque propositions or conclusion-bearing fields.
2. Replaced `wittPre_lambda` by a genuine unique family of maps from the supplier-relative Witt source, over a unit-preserving multiplicative coefficient family, with explicit F,V,R compatibility, the Teichmüller differential identity and odd-square condition. The native source/operations are data-valued prototypes of the missing CR.4 interface.
3. Replaced `wittImproved_universal_map` by the corresponding unique compatible family under positive-level, nonnegative-degree p-torsion-freeness. It no longer extends an arbitrary degree-zero chain map. The improved hypotheses imply the odd-square condition, including at p=2.
4. `reconstruct_modification` now states equality with the supplied Xi under the canonical realization-pair map, including surjectivity onto its lattice. The shifted-lattice example supplies inverse BKF morphisms and their Frobenius compatibility. Its unavailable analytic sheaf and leg are named omissions.
5. Rechecked the reviewer’s in-place corrections against their sources and reflected them in the reader: Verschiebung uses a lift of V(1); the punctured-spectrum proof uses A_inf localized at (p); AI.3 contains only integral coefficient assertions; both D and D/xi are connective; Lemma 12.8 is the bounded-PD source; mu-inverted local comparison is Rnu_* A_inf, and the proper primitive and non-Noetherian crystalline bridges remain precise requests.
6. Kept the actual completion counterexample, finite-Witt, Koszul, Frobenius, period and adjacent-degree hypotheses in the added interfaces. Reviewed sourceIssues E1–E5 remain confirmed, with the mistake paraphrased in our own words.
7. Removed all 133 inherited source-excerpt fields. The packet and reader contain our own mathematical statements, source locators and explanations. The historical review’s reference to its old excerpt audit is retained unchanged as historical evidence.

## Ownership moves required by the current upstream order

The 2026-10-09 [Caraiani–Newton order](../upstream/CaraianiNewton.md) and [drops list](../upstream/drops.json) move the RF4 linear patching required by AI.2 into AInfCohomology. AInf is in the tier-13 bundle; CohomologyComparisons is higher, and VectorBundlesAndIsocrystals lies outside this order. No RF, VB or CP reference remains in this packet’s prerequisites or supplier requests. Downstream use records remain valid consumer references.

| Previous owner/input | Current owner/export | Repointing needed |
| --- | --- | --- |
| RF4 module patching | `AInfCohomology:AI.2/linear-module-patching` | RF4’s principal affine finite-projective input imports this full non-Noetherian module patching theorem. Its relative/torsor generalizations remain distinct. |
| VB0 requested integral Witt descent | `AInfCohomology:AI.2/integral-frobenius-descent` | VB0 and any BKF consumer import this integral finite-module theorem, including torsion. Mathlib already supplies rational isocrystal carriers. |
| RF4 requested Robba/no-leg chain | `AInfCohomology:AI.2/integral-robba-frobenius-descent` | Import SW 12.3.4/12.3.5 with the integral coefficient maps and shared Y. |
| RF/VB requested analytic interval classification | `AInfCohomology:AI.2/annulus-isocrystal-classification` | Import SW 13.4.1 with its specified residue-field section; do not substitute algebraic curve classification. |
| RF4 requested extension theorem | `AInfCohomology:AI.2/frobenius-extension-infinity` | Import SW 13.2.1: the missing endpoint is infinity, with unique extension. |
| RF4 requested finite-free reconstruction | `AInfCohomology:AI.2/analytic-vector-bundle-extension` | Import SW 14.2.1 on the existing analytic Y. The pair-to-one-leg construction stays a proof step of the existing reconstruction node. |
| CP.1 requested proper de Rham prefix | `DerivedDeRhamCohomology:DD.5/proper-smooth-cohomological-control` | CP.1 should alias/import this existing lower-tier coefficient-free theorem. AI.5 now cites its exact id; no duplicate de Rham target was added. |

The generic analytic Y, its Huber topology, Frobenius and radius windows are already in upstream AdicSpaces Layer 6 and current Tau Ceti. Those are imported through the actual atlas stage id, with a reuse contract. The AdicSpacesPartII:R3 request supplies the affinoid finite-projective/vector-bundle equivalence and analytic descent, while AI.2 owns the global finite-free A_inf theorem. The old RF0 crystalline-input request was removed: the direct SW reconstruction chain needs analytic annulus classification and extension, not a proper crystalline comparison. Prismatic PR.7’s requested use of SW 14.2.1 can also be repointed to this exact AI.2 export; its weak-admissibility applications are outside this packet.

No other owner’s files or atlas data were edited. Existing CP.0 finite-Witt coherence and CP.5 perfectness/Tor/structure aliases retain the issue #664 ownership correction: AI.0 supplies coherence, AI.2 supplies Lemma 4.9 and Proposition 4.13, and AI.5 supplies the specialization algebra.

## Library and upstream checks

The packet’s historical baseline pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The prior independent audit checked all 29 inherited baseline entries. This revision read four additional actual Mathlib declarations at that pin: `AdicCompletion`, `TensorProduct`, `WittVector.Isocrystal` and `WittVector.FractionRing.frobenius`. These carriers are reused rather than planned again. Generic derived completion, relative Witt construction and enhanced geometry are still supplier interfaces.

The reviewed AUDIT-35 AInf entries and their accepted review were read. The generated library-coverage file has no AInf entries. The current read-only TauCetiRoadmap checkout was checked at `dea8191cc6047d6142a65872ebce6eeeb841a29b`; current Tau Ceti was checked at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. AdicSpaces and DGAInfinity READMEs were read in full, AdicSpaces Suggested was inspected, and current Tau Ceti’s Fargues–Fontaine Y interfaces were read. Generic A_inf topology/Y/Frobenius/radius targets are existing work. No read-only checkout was modified or built.

## Sources read and unavailable

The ten public PDFs matched the recorded SHA-256 digests. The versions and targeted recheck dates/scopes are in `sourceVersions`. The source text was read only in scratch and is not retained in the repository. No private book or uncleared copy was used.

- BMS1 arXiv v3: the coefficient, finite-Witt, module-structure, décalage/Koszul, toric, relative-Witt, PD and proper comparison locators used by the corrected interfaces. In particular §§3–4 (pp.19–44), §§6–7 (pp.49–60), §§8–11 (pp.61–95), §12 (pp.96–103), Proposition 13.21 (pp.116–117), and Theorems 14.1/14.3/14.5/14.6 (pp.118–122). The corresponding published Lemma 6.9 proof was checked for E1.
- Scholze–Weinstein: Lemmas 5.2.8–5.2.9 (p.38), Theorem 11.4.5 (p.97), integral Robba descent and one-leg construction (pp.103–107), extension and annulus classification (pp.109–113), and the finite-free BKF/vector-bundle equivalences (pp.115–117). These printed pages are ten below PDF page numbers.
- BMS2: Proposition 5.8, Remark 5.9 and Corollary 5.10 (pp.32–33), Proposition 6.5 and Remark 6.6 (pp.40–41).
- Scholze 2013 author copy: the integral/sheaf/perfectoid and primitive comparison locators; the complete 2016 three-page corrigendum supplies the corrected covering definition.
- Zavyalov: twist conventions (pp.9–10) and Theorem 3.3.3 with its proof (pp.35–36). Anschütz–Le Bras v4: Definition 4.1.24 (p.34), perfectoid dictionary and Proposition 4.3.5 (pp.47–49); the author erratum was read.
- BLM December 2019 author copy: the saturation/eta consumer, the four corrected findings in §§7–8, and crystalline realization locators §§10.2–10.4. The complete published §§7–8 interior is unavailable; E2–E5 remain explicitly scoped to the public author copy.
- Stacks tags 077J/091N specify flat-resolution/completion suppliers. The proper-de Rham supplier’s exact existing DD.5 statement was read; no new copy of its proof or new duplicate target was introduced.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AInfCohomology--AI.0.json`: zero errors, zero warnings.
- `python3 scripts/check_errata.py` on an own-words scratch errata-v1 projection: all five sourceIssues passed.
- `lean-check` on the full suggested file plus 255 generated declaration/API name checks: exit 0, 481 warnings, all intentional proof-placeholder warnings. Every one of the 137 export names and 118 API names resolved; all 85 test labels are followed by actual examples.
- Available memory was 96 GB before the final inventory run. One compile at a time; no language server, build, update or cache retrieval was started.
- The shared build has exactly the required Mathlib pin. The suggested file imports only Mathlib, so its different Tau Ceti build revision does not enter elaboration. This is not a claim that a Tau Ceti import compiled at the historical Tau Ceti pin.
- All 131 old ids and the complete historical review object were compared with the original; every implementation status remains unchecked; excerpt fields are absent; the reader contains every catalogue contract and no forbidden planning deferral or Lean code.
- `git diff --check`: passed. Only the four authorized deliverables changed.

Elaboration checks proposed signatures, not source theorem proofs. The geometric and enhancement omissions are stated explicitly. In particular the six new analytic/Frobenius interfaces use native module/sheaf carriers and finite-projective, affine or essential-surjectivity slices; the full equivalence statements and uniqueness remain the definitive packet/reader contracts.

## Remaining refinements and resume point

The next action is independent review of this completed revision, concentrating on the 75 signatures, three repaired APIs, shifted-lattice Frobenius regression, six ownership additions and reader consistency. The following nine refinements remain; no stage is proof-closed.

### Enhanced ringed-topos and invertible-line signatures

Pinned Mathlib has the ordinary derived category but not the requested coherent stable enhancement, derived sheaf tensor/pushforward, or invertible-ideal line-power interface. The Lean prototype uses actual affine complexes and derived-category objects; it omits precisely these unavailable hypotheses and records the narrower signatures in the reader.

Needed by `AInfCohomology:AI.1/ideal-decalage-complex`, `AInfCohomology:AI.1/decalage-products`, `AInfCohomology:AI.3/aomega`.

### Continuous completed cochain forgetful comparison

Mathlib continuousCohomology is in TopModuleCat with N-indexed cochains. The comparison must construct the completed p-adic cochain complex and its forgetful functor to Z-indexed ModuleCat complexes, with the finite-reduction hypotheses. It cannot be obtained by an unproved identification of discrete and continuous carriers.

Needed by `AInfCohomology:AI.1/continuous-cochains-koszul`, `AInfCohomology:AI.3/toric-perfectoid-cover`.

### Perfectoid minuscule-window supplier extension

R07.2 currently states field-valued Dieudonne theory, not the full perfectoid prismatic window interface. Request an early Part II dictionary with the PR.0 initial prism, before the subsequent classification applications that consume AI.2. Its proof is not assumed to follow from the finite-free Fargues equivalence alone.

Needed by `AInfCohomology:AI.2/minuscule-prismatic-dictionary`.

### Analytic reconstruction refinement on the shared Y

The exact SW analytic chain is now planned in AI.2 with source statements and prerequisite chains. Its geometric carriers, local-ring restriction maps and sheaf descent are unavailable in the pinned Lean substrate. The new native module/sheaf prototypes state the indicated affine or essential-surjectivity slices and explicitly omit the analytic identifications; they do not certify the full equivalences. Refinement stays with AI.2, not RF4/VB2.

Needed by `AInfCohomology:AI.2/integral-robba-frobenius-descent`, `AInfCohomology:AI.2/annulus-isocrystal-classification`, `AInfCohomology:AI.2/frobenius-extension-infinity`, `AInfCohomology:AI.2/analytic-vector-bundle-extension`, `AInfCohomology:AI.2/fargues-essential-surjectivity`.

### Agreement of the two crystalline comparison maps

BLM10.3–10.4 supplies the canonical saturated realization, but identification with every all-coordinate PD comparison map requires the shared degree-zero/Bockstein universal-map audit. This exact map agreement is requested from CR.4; no equality of unnamed isomorphisms is asserted.

Needed by `AInfCohomology:AI.4/blm-crystalline-route`.

### Geometric hypotheses absent from Lean substrate

The packet gives the full smooth/proper/formal/site hypotheses. The compilable signature proposal leaves out those not yet expressible on pinned carriers and marks each affected block. It is a proposed API, never a theorem verified by the elaborator.

Needed by `AInfCohomology:AI.3/aomega`, `AInfCohomology:AI.5/proper-perfectness`, `AInfCohomology:AI.5/global-bkf`, `AInfCohomology:AI.2/analytic-vector-bundle-extension`.

### Integral Frobenius-descent proof refinement

AI.2 now owns integral Witt descent, including finite torsion modules, and its invariant/scalar-extension signature. Artin–Schreier–Witt descent and the integral coefficient identifications remain source-supported proof refinements; Mathlib’s rational isocrystal carrier does not prove them. No supplier request to the higher/outside VB0 plan remains.

Needed by `AInfCohomology:AI.2/integral-frobenius-descent`, `AInfCohomology:AI.2/bkf-etale-realization`.

### Primitive proper integral comparison

P8:local-rational supplies local rational period sheaves, not Scholze Theorem 5.1 etale finiteness and primitive almost comparison. The request specifies an early primitive-comparison child and BMS1 Theorem 5.7. Until supplied, proper etale comparison is source-supported planning, not closed.

Needed by `AInfCohomology:AI.5/global-etale`.

### Non-Noetherian rational crystalline bridge

The inspected CR.3 rational Frobenius theorem assumes a Noetherian PD base (or W(k)). It does not by itself prove BMS1 Proposition 13.21 over A_crys. The section-dependent Berthelot–Ogus bridge and its qcqs Frobenius/descent inputs are requested from an early CR.3 extension.

Needed by `AInfCohomology:AI.5/rational-crystalline-frobenius`, `AInfCohomology:AI.5/global-bkf`.

## Fourteen supplier contracts

These are retained or narrowed planning endpoints, not a claim that the missing bridges exist. The prior 16 contracts became 14: four upward/outside-owner contracts were removed and two precise adic reuse/descent contracts were added.

### EnhancedDerivedSheaves:E1

Refine the existing K-flat replacement node to a termwise-flat K-flat replacement on ringed sites (strongly K-flat, BMS1 Lemma6.1); construct comparison roofs compatible with the chosen ordinary DerivedCategory and the invertible-ideal line-power/coherent tensor interface.

Needed by `AInfCohomology:AI.1/ideal-decalage-complex`, `AInfCohomology:AI.1/decalage-cohomology`, `AInfCohomology:AI.1/derived-decalage`, `AInfCohomology:AI.1/decalage-filtered-colimits`, `AInfCohomology:AI.1/decalage-truncations`, `AInfCohomology:AI.1/decalage-products`, `AInfCohomology:AI.1/bockstein-differential`, `AInfCohomology:AI.1/bockstein-reduction`, `AInfCohomology:AI.1/strongly-k-flat-replacements`.

### DerivedDeRhamCohomology:DD.1

Extend the existing scalar Koszul node to Koszul complexes of commuting endomorphisms, with cohomological exterior signs and the continuous completed-cochain comparison; generic derived completion and Beilinson infrastructure are already imported by exact node ids.

Needed by `AInfCohomology:AI.1/koszul-decalage-calculation`, `AInfCohomology:AI.1/koszul-products-and-cohomology`, `AInfCohomology:AI.1/continuous-cochains-koszul`, `AInfCohomology:AI.3/q-de-rham-model`.

### DerivedDeRhamCohomology:DD.0

Supply the integral perfectoid completed-cotangent results: Lhat_(O_C/Z_p)=O_C{1}[1] and Lhat_(S/O_C)=0 for p-complete integral perfectoid O_C-algebras S. Use cotangent transitivity and derived p-completion, not vanishing of ordinary differentials alone.

Needed by `AInfCohomology:AI.0:integral/completed-cotangent-twist`.

### PadicHodgeTheory:R06.1

Supply the actual topology, principal kernel, discrete valuation and common-map identification for the existing BDeRhamPlus/BDeRham carriers and B_crys^+; continuous Galois actions and coefficient scalar twists. AI.0 integral constructions precede this request and have no dependency on it.

Needed by `AInfCohomology:AI.0:period-comparison/common-rational-period-maps`, `AInfCohomology:AI.2/bkf-galois-descent`.

### PadicHodgeTheory:P8:local-rational

Supply an early primitive-comparison child, independent of the proper rational suffix: Scholze Theorem 4.9, Lemma 4.12 and Theorem 5.1 (finite etale F_p cohomology and the O^+/p almost comparison), then the derived A_inf version BMS1 Theorem 5.7 by finite p-level induction and derived completion. The current local rational period-sheaf statements alone do not supply it; use the corrected pro-etale covers.

Needed by `AInfCohomology:AI.5/global-etale`.

### AdicEtaleGeometry:A1

Supply the corrected analytic pro-etale site, unchanged underlying category, transfinite covering towers whose successors pull back finite etale surjections, and the generic-fiber/formal-Zariski morphism of ringed topoi. Do not use deleted 2013 point claims or splitting of arbitrary open profinite surjections.

Needed by `AInfCohomology:AI.3/completed-integral-sheaf`, `AInfCohomology:AI.3/aomega`.

### PerfectoidSpaces:P1

Supply the perfectoid field and valuation-ring setup for O_C^flat, its nondiscrete valuation, residue field and finite-generated torsion-free module lattice criterion; the Fontaine-kernel and perfectoid-basis nodes are imported separately by exact ids.

Needed by `AInfCohomology:AI.2/valuation-special-fiber-bound`.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2

Early Part II of the field-valued Dieudonne stage: define admissible prismatic windows over the initial perfectoid prism and prove their evaluation dictionary with minuscule linearized BKF modules. This dictionary must precede classification applications that import AI.2; do not import the full subsequent perfectoid p-divisible-group classification backwards.

Needed by `AInfCohomology:AI.2/minuscule-prismatic-dictionary`.

### PrismaticCohomology:PR.0

Supply only the initial perfectoid prism and its Frobenius-shifted identification (A_inf,tilde-xi); generic delta rings/prisms and their initial-prism theorem stay with PR.0. No final AΩ/prismatic comparison is a prerequisite.

Needed by `AInfCohomology:AI.2/minuscule-prismatic-dictionary`.

### EnhancedDerivedSheaves:E5

Supply coherent E_infinity algebra objects, lax symmetric monoidal localization and the characteristic-two Sq^0 test for the noncommutative q-model; the q-model is not forced into a strictly commutative dga.

Needed by `AInfCohomology:AI.3/enhanced-noncommutative-regression`.

### CrystallineCohomology:CR.4

Audit the agreement of BLM10.3–10.4 saturated-de-Rham–Witt universal maps with the absolute all-coordinate AΩ crystalline comparison, preserving degree-zero maps, Bockstein differential and Frobenius. Existing relative Witt and crystalline objects are imported by exact node ids.

Needed by `AInfCohomology:AI.4/blm-crystalline-route`.

### CrystallineCohomology:CR.3

Early Berthelot–Ogus bridge BMS1 Proposition 13.21: after fixing k→O_C/p, rational crystalline base change from the proper smooth special fiber over W(k) to A_crys[1/p], with canonical phi-equivariant map. Include rational Frobenius bijectivity for qcqs smooth O_C/p-schemes over non-Noetherian A_crys and descent through p^(1/p^n) thickenings. The existing Noetherian-base Frobenius-isogeny theorem alone is insufficient; the bridge must not depend on AI.5 BKF freeness.

Needed by `AInfCohomology:AI.5/rational-crystalline-frobenius`, `AInfCohomology:AI.5/global-bkf`.

### tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve

Reuse the existing shared A_inf adic Y, Frobenius and radius windows from AdicSpaces Layer 6 and its current Tau Ceti carriers. AI.2 adds only the coefficient-module restriction, patching and classification theorems; no duplicate Y construction is requested.

Needed by `AInfCohomology:AI.2/integral-robba-frobenius-descent`, `AInfCohomology:AI.2/annulus-isocrystal-classification`, `AInfCohomology:AI.2/frobenius-extension-infinity`, `AInfCohomology:AI.2/analytic-vector-bundle-extension`, `AInfCohomology:AI.2/fargues-essential-surjectivity`.

### AdicSpacesPartII:R3

Supply the analytic affinoid finite-projective-module/vector-bundle equivalence for the source two-open cover, including the exact non-Noetherian sheaf descent hypotheses of SW Theorem 5.2.8, printed p.38. The existing analytic coherent-sheaf infrastructure is imported; AI.2 owns the global finite-free A_inf equivalence on the shared Y.

Needed by `AInfCohomology:AI.2/analytic-vector-bundle-extension`.

No scratch file is needed to resume. The packet contains the precise refinements, requests, source versions, locators and upstream reuse notes; this handoff records the ownership repointing and verification results.
