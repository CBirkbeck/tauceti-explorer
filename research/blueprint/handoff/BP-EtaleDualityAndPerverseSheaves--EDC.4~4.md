# EDC.4: revision four (maintainer-directed)

Job [#10104](https://github.com/CBirkbeck/tauceti-explorer/issues/10104), `BP-EtaleDualityAndPerverseSheaves--EDC.4~4`. Worker: Claude — claude-htD0Pb, 2026-10-17.

This is a finished revision pass, submitted for independent review. The packet has status `complete`; its only stage, EDC.4, has coverage `planned`. The `review` object of REV-EtaleDualityAndPerverseSheaves--EDC.4~3 is left in place for the next reviewer to replace.

## What this round changed

1. **Scope.** The queue job and its issue name `EtaleDualityAndPerverseSheaves:EDC.4` as the only stage, while the packet still carried the original part job's scope EDC.4–EDC.8. Since then the accepted packets `--EDC.5`, `--EDC.6` and `--EDC.7` (EDC.7 and EDC.8) have planned the other stages. The packet's scope and coverage are now EDC.4 only.
2. **Retired drafts.** The 48 EDC.5 drafts and the 44 EDC.7/EDC.8 drafts are removed. Both accepted packets asked the next EDC.4 round to remove them: EDC.5 in `supersededDraftNodes`, EDC.7 in its rescope entry. The new top-level `retiredDraftNodes` maps each draft to its replacement and lists the consumers that still cite the old id (see "For the maintainer" below).
3. **EDC.6 nodes kept.** The twelve EDC.6 nodes stay in this packet because the accepted EDC.6 packet imports them by id (`importsFromPackets`). The accepted EDC.7, CC.8 and SF.0 packets also cite some of them. Their EDC.5 prerequisites now point to the EDC.5 packet's replacement ids. `importedBy` records every importer.
4. **Upstream consumption (the maintainer's instruction).** Every surviving node cites the statements of the open TauCetiRoadmap pull requests EtaleCohomologyFoundations #938 (head `c4ee54f`), EnhancedDerivedSheaves #908 (`b3ea60e`) and ClassicalAdicEtaleCohomology #875 (`e36805f`), and of SchemeAndStackFoundations on TauCetiRoadmap main (README at `d208139`), in place of the EDC.0–EDC.3 and SF.2 suppliers it used before. The cited material is the six operations, localization, proper supports, base change, Artin vanishing, finiteness, normalized adic realization, duality, purity, Gysin maps, the smooth trace, Tate twists, Frobenius, the projective-bundle and blow-up formulas, and weak Lefschetz for smooth ample sections. Statements that upstream makes are marked "imported, not planned here" inside the node, for example affine-vanishing (a), projective-bundle (a), the blow-up decomposition and smooth-section weak Lefschetz. Each node keeps only what upstream does not state:
   - weak Lefschetz for singular sections with lisse coefficients;
   - the Gysin and integral (Weil II 4.1.6) forms of weak Lefschetz;
   - ample-divisor chains and complete intersections;
   - the ring, pushforward, pairing and Frobenius-weight parts of the projective-bundle formula;
   - the sheaf-level blow-up decomposition with its explicit columns, retraction and weights;
   - axis blow-ups, split injectivity with supports, and the vanishing and restricted subspaces;
   - the λ-adic, coefficient-extension, analytic and diamond parts of the EDC.6 nodes.

   The new top-level `upstreamImports` lists each section used and the nodes that use it. Each upstream README is a packet source with its URL, head and SHA-256. Two EDC.3 prerequisites remain, because EtaleCohomologyFoundations does not state their content: `EDC.3/chern-classes` (higher étale Chern classes) and `EDC.3/cycle-class-map` (descent of cycle classes to Chow groups).
5. **Stage cycle removed.** Round three had EDC.4 nodes citing EDC.6 adic-category nodes, while an EDC.6 node cites `EDC.4/complete-intersection-cohomology`, which made a 2-cycle between the two stages. EDC.4 now uses the upstream ℤ_ℓ, ℚ_ℓ and finite-E realization (EtaleCohomologyFoundations §§F.4.1–F.4.5). It obtains O_E coefficients by restriction of scalars along the finite free map ℤ_ℓ → O_E, which changes neither the groups, the supports, the maps nor torsion-freeness. No EDC.4 node depends on EDC.6.
6. **Requests (17 → 7).**
   - Withdrawn because upstream states them or the EDC.5/EDC.7 packets own them: the SF.2 requests for Artin vanishing, proper/smooth/generic base change, the integral adic formalism, topological invariance and finiteness, good models, origin witnesses, descent and Hochschild–Serre.
   - Withdrawn because SchemeAndStackFoundations §5.4 on main states it: the SF.5 projective-bundle geometry.
   - Kept and narrowed: the SF.0 requests for the exceptional divisor, ample complements with Veronese, and complete-intersection chains with the universal family; the SF.3 ample-line bridge; the ComplexComparison request through SF.2; the AdicCoefficientsAndComparisons L3 request for strong transport.
   - New: an SF.5 request for c(T_X) of a smooth complete intersection. Together with étale Gauss–Bonnet (EtaleCohomologyFoundations §F.6) it replaces the old Euler-characteristic gap.
7. **Gaps (8 → 3).** Kept:
   - strong exceptional-pullback/duality transport to diamonds;
   - the relative perverse t-structure over a base: ULA is now upstream in §F.2.3, but relative perversity for schemes has no owner;
   - nearby cycles over general bases: compactifications are now upstream in §§G.1–G.3, but the general-base theory has no owner.

   The stack, perfect-scheme, coefficient-descent and semismall gaps went with the drafts to their owners.
8. **Planets (EDC.4).** Weak Lefschetz theorem, Integral weak Lefschetz, Cohomology of complete intersections, Projective bundle formula, Blow-up formula, and Vanishing and restricted subspaces. The two EDC.6 planets are unchanged.
9. **Proof-step corrections made while rewiring.**
   - Pushforward along a smooth proper map, and along a proper birational map of smooth schemes, is now derived from the smooth trace and purity together with the projection formula, not from closed-immersion Gysin maps.
   - The adic step of affine vanishing now accounts for the universal-coefficient support shift. The levels satisfy the same bound because q + d_{q+1} < (q+1) + d_{q+1}.
   - The Milnor lim¹ term of affine vanishing now vanishes by finiteness of the levels.

## Findings

| Finding | Disposition |
| --- | --- |
| REV~3: general semismall costalk step unverified | Resolved by retirement. The replacement `EDC.5/semismall-pushforward-perversity` (accepted EDC.5 packet) assumes that both i_α^*K and i_α^*D_X K are locally constant on the source strata, which are the two conditions BBD 4.2.8 uses. It derives cosupport by duality for self-injective or rational coefficients and asserts no integral form. GS0's two consumers must check that hypothesis. |
| REV~3 questions to the orchestrator | This round is the maintainer's routing. Part II proposals: see the next two rows. |
| RT-AREA-etale/3 (stacks) | Carried by the stacks Part II entries of the accepted EDC.7 and EDC.0 packets; no EDC.4 statement is used on stacks. |
| RT-AREA-etale/16 (perfect/equivariant) | Carried by the perfect-scheme Part II entry of the accepted EDC.7 packet; no Zhu item names an EDC.4 target. |
| RT-AREA-etale/17 (L3 → EDC.6) | Kept as a restructure entry; the EDC.6 packet records the same link. |
| RT-AREA-geomlanglands/18 (EDC.4 → GS1) | Kept as a restructure entry, with EDC.5/EDC.7 replacement ids: drop EDC.4 → GS1. |

Maintainer-added sources:
- Deligne, Weil II 4.1.6 is covered by `weak-lefschetz-integral` and `weak-lefschetz`.
- LTXZZ Lemma 5.11.3(3),(4) is covered by `pullback-injective-blowup-bundle`.
- Zhu has no EDC.4 target; its perfect-model transport belongs to the perfect-scheme Part II.

These are listed in `findingsCoverage` and `routeCoverage`.

## Inventory and checks

The packet has 25 nodes: 17 theorems, three lemmas, two comparisons, one definition, one construction and one application. They carry 12 API items, eight definition/construction unit tests and six further named tests. There are eight planets (six on EDC.4, two on EDC.6), three Mathlib baseline declarations, 15 sources, seven requests, three gaps, four restructure entries and five source issues. The source issues are E11–E15: E11–E13 stay because the accepted EDC.5 packet cites them from here as `inheritedSourceIssues`. The packet also records the 92 retired drafts.

- `python3 scripts/check_blueprint.py research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.4.json`, with and without the pinned declaration index: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/EtaleDualityAndPerverseSheaves--EDC.4.lean`: exit 0. The 292 warnings are all "declaration uses sorry", with nothing else. The file is 1,407 lines, down from 3,346. It was cut to the EDC.4 and EDC.6 sections plus their carrier stand-ins, a short stand-in section for the EDC.5 perverse interfaces they use, and the EDC.4 Frobenius-weight lemmas. Docstrings name the upstream owners.
- Every API item, unit test and suggested declaration name of the packet (122 names) occurs in the Lean file.
- The reader is generated from the packet and escaped for the site renderer; a Python port of `src/markdown.js`'s inline rules flags no stray mathematics or emphasis. Packet text appears in the reader after Markdown unescaping.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- Cross-packet: the EDC.6 and EDC.7 packets' prerequisites into this packet all still resolve. The EDC.5 packet has no prerequisite into this packet, so the new EDC.6 → EDC.5 edges close no cycle.

## For the maintainer

- **Repoint consumers of retired ids** (`retiredDraftNodes` gives each replacement):
  - GeometricSatakeAndFusion--GS0: prerequisites to EDC.5/affine-perverse-artin-vanishing, intersection-complex, perverse-recollement, perverse-t-structure, semismall-pushforward-perverse and EDC.7/proper-direct-image-decomposition.
  - IgusaVarietiesAndTorsionConcentration IG.4: prerequisites to EDC.5/affine-perverse-artin-vanishing, perverse-t-structure and t-exact-functor.
  - ExcursionOperatorsAndSpectralAction--ES7: prerequisites to EDC.8/correspondence-composition, correspondence-pushforward, correspondence-trace, lefschetz-verdier-formula and similitude-reciprocal-charpoly.
  - Text references in SchemeAndStackFoundations--SF.0, EndoscopicTransferAndUnitaryTraceComparison--ET.0 and --ET.5.

  Until these are repointed, those packets fail the checker if they are edited.
- **The EDC.0 packet** (EDC.0–EDC.3) still plans the six operations, Verdier and Poincaré duality, purity, cycle classes and projective-space and projective-bundle cohomology, which EtaleCohomologyFoundations now states. The second restructure entry proposes that the roadmap's package cite those upstream sections and keep only their residues. This job does not edit that packet.
- PKG-EtaleDualityAndPerverseSheaves can follow once this revision is accepted. The queue marks the earlier package job as created by mistake.

## Sources

Read for this round on 2026-10-17:

| Source | Sections read |
| --- | --- |
| EtaleCohomologyFoundations README, PR #938 at `c4ee54f` | scope, conventions and supplier contracts; §§0.5–0.11, F.1, F.2.1–F.2.7, F.3, F.4.1–F.4.6, F.5–F.8, F.10.2b |
| EnhancedDerivedSheaves README, PR #908 at `b3ea60e` | Layer 0, §§0.1–0.4, and the E4 headings |
| ClassicalAdicEtaleCohomology README, PR #875 at `e36805f` | scope, §8.2, §11.1 |
| SchemeAndStackFoundations README on main at `d208139` | §§4.11, 4.13, 5.4–5.5 |

The papers' locators are inherited from round three, whose review checked them against the public copies; no paper was re-read. No book from the maintainer's library was used. Statements are in the worker's own words; no source passage is reproduced.
