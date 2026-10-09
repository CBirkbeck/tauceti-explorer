# A0-extension continuation — handoff

Issue **#6332**, job **BP-AlgebraicModuliForArithmeticGeometry--A0-extension-2**. Agent **Codex**, session **codex-doMn09**, branch **codex-doMn09-6332-a0-extension**. The bot confirmed comment 6081764513 at 2026-10-09 13:23:05 UTC. This submission finishes this job's target-level pass; it is not a checkpoint. No second job was claimed.

## Result and coverage

The packet has **43 nodes**: 31 theorems, 8 definitions, 3 constructions and 1 application. It has **35 API items**, **33 named unit tests**, **6 planets**, **18 pinned baseline declarations**, **6 explicit gaps**, and **11 request records** (8 open supplier contracts and 3 verified existing-roadmap imports). Every one of the **33 routed items** has a distinct disposition. `AlgebraicModuliForArithmeticGeometry:A0-extension` is **planned**, not closed; packet status is **complete**.

The target-level pass covers approximation before the selected Artin criteria, arbitrary-base perfect cohomology, Picard stack/space algebraicity and neutral components, space analytification and nonarchimedean proper GAGA, normalization and specified valuation prolongations, finite Picard torsors and the Brauer obstruction, Raynaud's trait criterion, regular-Cartier duality restriction, ramified divisor trace and K/O dévissage. The six previous relative-Picard nodes are imported unchanged. No prior packet, atlas data, source extraction, application code or unrelated deliverable was edited.

The six planets are Artin representability criterion, Perfect cohomology and base change, Relative Picard space, Picard identity component criterion, Cartier dual torsor correspondence, and Algebraic space analytification.

## Validation and native Lean boundary

- `scripts/check_blueprint.py` with the shared pinned declaration index: **0 errors, 0 warnings**.
- `research/blueprint/intake.py check-files` on the four deliverables: **passed**.
- Packet/reader/suggested-file name consistency: every node name, API name and named test appears in both documents; all 33 routed ids are distinct; no source `excerpt` or Lean code appears in the packet/reader.
- `lean-check` on the suggested file: **compiled at the pinned Mathlib/Tau Ceti build, with only declaration-uses-sorry warnings**. Available memory exceeded 20 GB. No Lean server, Lake build, update or cache command was used.
- `git diff --check`: **passed**.

The compiled native declarations include the affine set-valued strong infinitesimal gluing, all-orders formal point, explicit effectivity restriction, tangent fibre, boundary-compatible linear functional and fractional tensor quotient. Their **20 API items** and **18 named tests** have native signatures; the boundary test also includes a permitted dual-number functional. The two valuation adapters have native polynomial/valuation/integrality signatures. This is signature elaboration only; every node retains `implementationStatus: unchecked`.

The geometric groupoid, relative-base, algebraic-space, derived-sheaf, analytic and duality statements are recorded with their precise hypotheses and names in the **explicit omission ledger**. It gives all 15 unavailable API items and 15 unavailable named tests. There are no invented geometric carriers, replacement axioms, or Prop-valued fields standing for unavailable conditions. The raw affine tangent fibre does not provide its vector-space structure; raw set-valued effectivity does not provide stack morphism effectivity; the tensor quotient does not prove its flat-DVR/sheaf exact sequence. Those full interfaces belong to the recorded suppliers. A follow-up must realize these signatures against the actual supplier categories and then elaborate their geometric tests.

## Ownership and confirmed findings

**RT-AREA-algebraicgeometry/2.** The G-ring finite-type permanence, polynomial approximation, finite-jet formal-object approximation and common étale neighbourhoods are explicit A0 prefix nodes. SF.0 supplies regular completion and Popescu. The selected criteria are Stacks **98.16.1/98.17.1** with all their G-ring, size, diagonal, effectivity, tangent and open-versality conditions. Accepted RS-27 keeps **A0→R09.6**, so the older suggestion to import approximation back from R09.6 is superseded. R09.6 and the two Kisin-family extraction consumers should point to this prefix. Packaging must distinguish A0 criterion → R09.4 coherent-sheaf stack → A0 Picard, so stage-level aggregation does not manufacture a cycle.

**RT-AREA-algebraicgeometry/14.** JacobianChallenge **Layer C** and StableReduction **Layer 2** already supply proper coherent cohomology over locally Noetherian bases in every relative dimension. They are imported, never replanned. New A0 cohomology is only the arbitrary-base finite-presentation/perfect/Tor-amplitude extension and its rank-locus consequences.

**RT-AREA-algebraicgeometry/18 and RT-AREA-etale/25.** Accepted RS-27 gives **SF.2** the sole classical coherent-duality ownership, including the universally coherent extension as **SchemeAndStackFoundations, Part II**. This supersedes the older etale finding's suggested A0 owner. A0 has only Cartier and boundary adapters. Repoint general f!, fundamental classes and residue-symbol routes to SF.2; AS.1 keeps its comparison/solid direction. The packet explicitly routes every imported item and requests the missing general fundamental-class export from SF.2. No higher-tier EnhancedDerivedSheaves import is used: it is a separate tier-4 unit, not an A0 bundle partner.

A2 owns abelian-specific Picard lifting and identification with the dual abelian scheme. PEL M2 and Hilbert–Siegel H1 own their application checks. ComplexComparisonPartII C3 owns complex coherent GAGA and imports A0 complex local comparison; it is not an A0 prerequisite.

## Open supplier contracts and proof boundaries

1. **SF.1:** actual ringed étale algebraic-space sites, represented diagonals, finite-presentation descent and smooth-presentation bootstrap; neutral components and the exact algebraic-space extension of Kleiman 5.20. Smooth geometric fibres over a nonreduced base are insufficient: require formal smoothness there.
2. **DiamondsAndVStacks:D0:** ordinary categories fibred in groupoids, stack morphisms and étale descent. This is an ordinary stack import, not diamond geometry.
3. **R09.4:** coherent-sheaf stack for proper flat finitely presented algebraic spaces, with the invertible locus open. If it uses Artin, it uses the criterion prefix, not the Picard conclusion.
4. **R09.3:** coherent invertible-module descent and the space Chow/coherent dévissage for proper GAGA. Preserve the distinction between general quasi-coherent descent and coherent locally Noetherian statements.
5. **SF.4:** proper-space Grothendieck existence and Chow modifications. Formal restriction must be an equivalence of coherent-module groupoids, not just existence on isomorphism classes.
6. **AdicSpacesPartII:R1:** Berkovich/rigid bridge, closed-diagonal étale quotients and completed-local comparison, extending its existing scheme analytification direction. Conrad–Temkin's locally separated surface counterexample prevents asserting general nonarchimedean existence. Proper scheme GAGA is already R3.
7. **SF.2:** general determinant/finite-flat fundamental classes, agreement under the precise normal/CM/Gorenstein and codimension-two conditions, perfect-coefficient comparison and permitted base-change compatibility; cofinite torsion-DVR duality and filtered-colimit cohomology for K/O.
8. **SF.2 Part II:** universally coherent scheme duality under Zavyalov's exact qcqs/universally-coherent hypotheses. Separately extend D_QCoh/perfect/Tor-amplitude/tensor/derived-image interfaces to qcqs algebraic spaces by étale descent, needed over arbitrary bases for the perfect-cohomology target. Universally coherent duality is not asserted over arbitrary bases.

The six gap groups are native geometric/Artin interfaces, Picard neutral components, formal space effectivity/Coh moduli, analytic quotient/GAGA substrate, Cartier-duality fpqc descent/Ext vanishing, and duality/derived-space/K/O finiteness interfaces. The inherited six-node Picard native-interface boundary is retained. The follow-up must supply these exact contracts, update all their consuming node signatures/tests, and then revisit closed coverage; it must not duplicate the imported schemes, curve cohomology or coherent-duality theory.

## Existing-library and roadmap audit

Pinned Mathlib is **082e2d37e8b0463410cdb532e111cd43d5a66174**, pinned Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. Every cited baseline declaration's actual statement was read at the pin. The reviewed library audit was checked before planning.

Current read-only TauCetiRoadmap main was **094dd0a7ca814cab4f0dbb8c1778c567ea1cc0c2**. Read the JacobianChallenge README and Suggested.lean, StableReduction's general cohomology/base-change and curve-theory targets, and AlgebraicVectorBundles README/Suggested.lean. Current Tau Ceti was **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039**; its rigidified Picard functor is existing work, not general space representability. No command built or modified the read-only environment.

The existing **ComplexComparison proposal, PR196 head 4bd72379658126cbe9be935656396f0c9dac4de0**, supplies Layers 0–2 scheme analytification, including nilpotents, products and étale local biholomorphisms. Its full README was read. It is absent from the current atlas stage catalogue: register its exact Layer 2 id for a machine-resolved prerequisite edge. `upstreamImports` and `existingRoadmapImports` preserve its verified contract and hash without inventing a baseline declaration or replanning the proposal.

Pinned Tau Ceti already has the affine group-scheme Cartier anti-equivalence and double-dual isomorphism in `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`. The supplied declaration index omits `TauCeti` from these two entries. The graph cites the correctly indexed native Hopf-algebra anti-equivalence `TauCeti.FiniteLocallyFreeBicommutativeHopfAlgCat.cartierDuality`; the existing affine transport is audited and not replanned. The only requested extension is group-scheme fpqc descent and the Raynaud local Ext comparison.

Mathlib already has valuation domination, maximality of valuation local subrings, restriction, and the general integral-closure/intersection theorem. These are imported. A0 plans only the specified-prolongation-family adapter and its independent root-coefficient argument. The proof extends a valuation by domination of its image local subring and contracts using maximality. It does not assume Frac(B)=F or separability, and it retains repeated roots.

## Sources and corrections

The packet and reader contain URLs, access dates and SHA-256 hashes for all inspected public sources, with theorem/section/page locators for every node. No source passages were copied. No cleared or uncleared library book was needed. All downloaded primary files were public author or Stacks PDFs; none is a repository deliverable.

Read Stacks Artin axioms 98.5–10, 98.13–18 and 98.21–22; G-ring permanence 15.51.10; approximation 16.12–13; perfect cohomology/rank loci 75.25–26; Picard stacks/spaces 99.10–11 and separation 108.9. Read Artin 1969 1.10 and 2.5–6; Kleiman 5.19–24 and 5.27; Conrad–Temkin 2.2–3, 3.1, 3.3 and 4.1–3; Raynaud 6.1.4, 6.2.1 and 8.2.1; Schröer 4–5 and 8.1; Dittmann–Pop 3.8 and 5.3; BCGP v3 3.8.8–17; Calegari–Geraghty 3.2/Lemma 3.7; Pilloni 4.1–2; Fakhruddin–Pilloni 2.1–3; Zavyalov 2.2. Exact read pages are listed under `sources.readSections`.

Four source observations are recorded for independent review, after bounded correction searches:

- **E2001:** Stacks 75.25.4 writes flatness over S; the required condition is flatness over Y. The dual-number closed immersion gives a counterexample to the printed version.
- **E2002:** Stacks 75.26.6's final lowest-degree rank clause uses H⁰ where Hᵃ is required. A shifted rank-one complex distinguishes them.
- **E2003:** BCGP v3 Lemma 3.8.10 calls the comparison invertible for arbitrary locally free F; it has rank rank(F). The identity map with F=O² distinguishes the wording. Scoped to the preprint inspected.
- **E2004:** Fakhruddin–Pilloni author-file Lemma 2.4 inputs O_X into h!:D(O_S)→D(O_X); the well-typed input is O_S, as the following proof also uses. Scoped to the hashed author copy inspected.

General duality references invoked by these papers were not independently re-proved from unavailable books; their exact SF.2 imports and extra comparisons are the supplier boundary. The extension of Kleiman's represented-scheme component result to spaces and the analytic quotient/GAGA substrate are likewise explicitly requested, rather than presented as already established consequences of the inspected sources.
