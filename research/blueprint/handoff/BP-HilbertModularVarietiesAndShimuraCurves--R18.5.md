# BP-HilbertModularVarietiesAndShimuraCurves--R18.5

Issue #9422. Agent: Codex. Session: codex-wJAkd1. Date: 13 October 2026.
Branch: codex-wJAkd1-bp-r18-5. Complete target-level planning pass, awaiting independent review. This is not a checkpoint or an implementation claim.

## Deliverables and counts

- [Packet](../packets/HilbertModularVarietiesAndShimuraCurves--R18.5.json): eight new nodes, comprising two definitions, two theorems and four comparisons; eight API items and eight unit tests; seven checked baseline declarations; six explicit gaps and ten supplier requests. All new nodes have implementation status unchecked.
- [Reader](../readmes/HilbertModularVarietiesAndShimuraCurves--R18.5.md): twenty full targets, with hypotheses, locators, prerequisites, proof routes, APIs, tests and worked Checks. The twelve original R18.5 targets are imported from the accepted R18.2 packet, not copied into the new packet's node inventory. They contribute two definitions, three constructions, three theorems, four comparisons, twenty API items and sixteen tests. Combined mathematical specification: twenty targets, twenty-eight API items and twenty-four tests.
- [Suggested file](../suggested/HilbertModularVarietiesAndShimuraCurves--R18.5.lean): 140 lines; four real light definitions (the height set and its two maps, and the chart-action predicate), seven terminal theorem statements and eight examples. It contains no developed formal/module/tower theory and no placeholder data definition.
- Planets: five retained in R18.2, one new Kurihara graph with lengths, six combined for R18.5. R18.6 has zero.

R18.5 is **planned**, with six remaining conditions. R18.6 is **source_decomposed**, with no mathematical nodes and an explicit consumer/export index, as required by accepted RS-23. Neither stage is advertised as a proved mathematical development.

## Mathematical refinements

The new paired-height definition fixes the lattice Λ={(a,b):2 divides a+b}, its diagonal quaternionic labels and the difference quotient. The new chart condition fixes strict displacement greater than two for the effective projective action. Its quotient theorem is a sufficient small-level construction, not a classification of all free quotients.

The auxiliary PEL factor, inverse-diagonal central kernel, cofinal CM-level injectivity and complete component-coverage arguments provide a source-specific division-prime route through Boutot–Zink. It does not depend on Carayol's split-place comparison or Yuan–Zhang's ramified determinant repair. The actual universal formal-module comparison is required before identifying the compatible higher-level torsion covers. Division-uniformizer powers are kept distinct from central-uniformizer powers.

Kurihara's graph deletes reversal-fixed edge orbits, retains loops and parallel edges elsewhere, and records oriented-edge stabilizer lengths. Thickness-m nodes resolve to m unit segments, preserving weighted cycle pairings. For positive genus, minimal regular reduction contracts successive valence-one rational components; it does not contract all unstable rational components. Worked cycle and parallel-edge calculations distinguish the weighted pairing, its dual-lattice cokernel and Frobenius invariant arithmetic points.

## Exact remaining work and supplier ownership

1. **Formal arithmetic quotient and algebraisation.** AdicSpacesPartII Part II must supply the discrete arithmetic quotient, its separatedness/gluing, proper algebraisation and effective finite quotients. Generic-fibre machinery alone is insufficient.
2. **Basic PEL uniformisation.** PELModuli Part II must state Boutot–Zink Proposition 6.2 for its actual auxiliary datum and group, including deformation etaleness, polarized Hasse-principle coverage, local levels and Weil equivariance. The public KRZ unitary argument does not automatically identify that group. The cited Rapoport–Zink Theorem 6.30 was not independently read.
3. **Universal module at fine levels.** R07.1–R07.2 must supply the actual strict special-module and deformation carriers. Establish `DrinfeldLevelStructureComparison` on fine levels, with quotient/descent equivariance, before deducing the all-level tower. A coarse universal family is not available by assertion.
4. **Weighted monodromy extension.** Import R11.4's character and monodromy targets and discharge its existing thickness-resolution condition through R11 Part II. The new packet owns only the arithmetic graph/thickness identification, not generic graph or Néron theory.
5. **Cross-part finite-component fields.** Reconcile the old R18.2 `finite-pel-comparison` with the new `SplitPlaceDescentBoundary`: level-zero neutral components and the union of level structures descend to F_p^nr, whereas the selected level-n component in Carayol §4.5.5 is over F_p^n. The auxiliary tame level may depend on n; the place is split. This is an interpretation correction to an imported interface, not a new source erratum. The R18.2 packet was outside this issue's editable files and has not been changed.
6. **Typed formal signatures.** Formal Drinfeld, strict special-moduli, PEL and tower carriers must exist before the main theorems can be represented in Lean. The present suggested file elaborates elementary interfaces only.

The ten requests name AdicSpacesPartII:R2, PELModuli:M2 and M4, R07.1 and R07.2, ReductiveGroupsPartII:RG2.2, R11.4, and existing StableReduction layers 1, 4 and 5. Current generic StableReduction node and blow-up machinery is imported, never replanned. No notion was moved down from a higher-tier consumer; the R19/R20/R22/R23/R31/S5 references are outputs only. R18.6 retains the inherited Ihara, neatness, Khare exact-statement and H6 local-realization conditions.

## Assembly instructions

Keep all twelve imported node IDs and the five existing planets. Add only the eight new IDs and the sixth planet. The accepted owning packet is HilbertModularVarietiesAndShimuraCurves--R18.2.json, reviewed by independent-review-REV-FIX-RT-AREA-automorphic-1~5 on 8 October 2026. The H0 owner has its accepted 7 October review. The RS-23 boundary remains authoritative.

Use `QuaternionicPelUniformisationTransfer` as the expanded division-prime proof route for the existing totally-real target. Do not make it depend on the split-place field comparison. Place the elementary chart predicate before the arithmetic quotient construction; it assumes a given tree action, not a quotient theorem. Place `DrinfeldLevelStructureComparison` before the all-level theorem; it does not assume that theorem. The current reachable node graph is acyclic, including imported targets.

At the finite-component reconciliation, retain Carayol's extension-group equivariance and O_p-linear group comparison. Do not enlarge it to division places or one tame level uniform in all n. Preserve the older Yuan–Zhang determinant/integral conditions under their original owners without making them assumptions of the independent Boutot–Zink theorem. The reader's R18.6 contracts specify exactly what the consumers receive.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/HilbertModularVarietiesAndShimuraCurves--R18.5.json --json`: exit zero, no errors and no warnings. All baseline references were found in the declaration index.
- `lean-check research/blueprint/suggested/HilbertModularVarietiesAndShimuraCurves--R18.5.lean`: successful elaboration; fifteen warnings, all declaration proof placeholders; no other warning or error. Memory was checked before the run and exceeded the required threshold.
- The shared build's Mathlib source commit was verified as the exact pin, 082e2d37e8b0463410cdb532e111cd43d5a66174. Its Tau Ceti tree has no Git identity, so its source revision could not be certified. The file imports no Tau Ceti module; elaboration uses only the exact pinned Mathlib. The packet retains the protocol Tau Ceti pin f790474821cf4256814db967cb154e7af3d0c369, and makes no claim of validating a Tau Ceti-dependent signature in that build.
- Submission preflight: `research/blueprint/intake.py check-files` reports four files and zero problems; `scripts/check_sorry_data.py` exits zero; `git diff --check` reports no whitespace errors.
- Mechanical consistency: all twenty target IDs, statements and source locators agree with the reader; every API and test name appears; the two new definitions each have four APIs and four tests; no packet/reader Lean block, proof placeholder, private path or source excerpt; six combined planets; reachable prerequisite graph acyclic (522 target nodes visited). These are consistency checks, not an independent mathematical review.
- Adverse mathematical checks: odd paired height rejected; opposite/negative paired heights accepted; one-coordinate descent shift rejected; free displacement-two action distinguished from very free; ramified node distinguished from regular node; weighted pairing invariant under subdivision; parallel edges preserved; Frobenius invariants distinguished from the geometric cokernel.

## Sources and current-library audit

Source versions, public URLs, exact reading scopes and SHA-256 hashes are in the packet and reader. Read: Boutot–Carayol local geometry and representability plus arithmetic §§5.2–5.5; Boutot–Zink local factors and §§6–7 descent/uniformisation; CDN20 half-plane/model, division levels and Proposition 5.4; Kurihara §3 including Proposition 3-4 on p.289; Carayol pp.184–189, with images of pp.188–189 checked; Yuan–Zhang §8.3 pp.619–620; KRZ's polarized Hasse/descent argument; and KW's definite coefficient/neatness boundary on author pp.57–60,73,77. Kurihara's scan has no usable text layer and was read directly from page images. No source passage was copied into the repository.

Rapoport–Zink's book is not cleared in the maintainer's library index and was not read or copied. The public KRZ preprint is an explicitly scoped source, not a substitute certification of that book. No new source erratum is claimed; inherited findings are left with their existing owning packets.

The reviewed library coverage, stage links, RS-23, accepted H0/R18.2 specifications and R11 supplier statements were read. Current read-only upstream StableReduction, AdicSpaces and ReductiveGroupsPartII documents/signatures were checked, together with the nine roadmaps newer than the atlas snapshot. Current Tau Ceti generic node declarations were read; the current tree was used to avoid duplication, never as an off-pin elaboration dependency. Neither current upstream checkout was built. Scratch contains only disposable source files and verification aids; everything needed for continuation is in these four deliverables.
