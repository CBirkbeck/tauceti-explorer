# Handoff: BP-SchemeAndStackFoundations--SF.4

Session cc-ebcf9c (Claude Code), 2026-10-09. Baseline Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

## Deliverables

- `research/blueprint/packets/SchemeAndStackFoundations--SF.4.json`: status `complete`, part `SF.4`, 57 nodes (17 definitions, 4 constructions, 32 theorems, 3 lemmas, 1 application), 139 API items, 89 unit tests, 6 planets, 79 baseline declarations read at the pinned commits, 10 requests, 3 gaps, 2 source issues. The SF.4 coverage record is `planned`.
- `research/blueprint/readmes/SchemeAndStackFoundations--SF.4.md`: the layer document, generated from the packet together with introduction, boundaries, conventions, sub-layer introductions and layer acceptance tests.
- `research/blueprint/suggested/SchemeAndStackFoundations--SF.4.lean`: compiled with the swarm's `lean-check` tool (`lake env lean` in the shared build at Tau Ceti f790474 + Mathlib 082e2d3) on `research/blueprint/suggested/SchemeAndStackFoundations--SF.4.lean`. It elaborates with no errors and no warnings other than `declaration uses 'sorry'`. It contains no `True`-statement or `Prop := sorry` placeholders. The declarations it cannot type are listed by their packet names in comment blocks, with the reason in each case: anything needing Tau Ceti StableReduction Layers 1–4, algebraic stacks (SF.1), or coherent cohomology. The Tau Ceti modules `Cohomology/Basic` and `DVRExtension/Basic` are not compiled in the shared build, so the file does not import them.
- Checker: `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.4.json` reports 0 errors and 0 warnings, both with the pinned declaration index (`TAUCETI_BASELINE` pointing at the worker baseline), where every baseline reference is resolved, and without it.

## What is planned

The stage text and the AUDIT-01 target list are covered at target level, in five proposed sub-layers (packet `restructure`):

- **SF.4a**: thickenings and formal smoothness of morphisms; the infinitesimal lifting criterion; the torsor of lifts; the Artinian coefficient category; deformation functors with (H1)–(H4); hulls; Schlessinger's theorem; obstruction theories; square-zero deformations classified by the naive cotangent complex; deformations of smooth schemes and line bundles; the versal deformation of a node.
- **SF.4b**: Spf; formal schemes; formal completion; coherent formal modules; the theorem on formal functions; Stein factorization; Grothendieck existence; algebraization of subschemes and morphisms; Grothendieck algebraization; effectivity for curves.
- **SF.4c**: modifications; strict transforms; generic flatness; Raynaud–Gruson flattening; domination of modifications by admissible blowups; Chow's lemma; regular schemes; Serre's criterion; Bertini; resolution of curves by normalization.
- **SF.4d**: Grassmannian; Hilbert/Quot schemes; the stack M̄_{g,n}; Isom finite unramified; algebraicity and properness; smoothness; the level-structure finite cover; extension of stable pointed curves after an alteration.
- **SF.4e**: alterations; SNC divisors; making a normal-crossings divisor strict; split semistable curves; local structure and resolution of nodal families (de Jong §3); generic projections; curve fibrations (4.11–4.12); the three-point divisor (4.13); stable-model domination (4.18–4.21); Theorem 5.8; Theorem 4.1; traits and S-varieties; strictly semistable varieties; strict semistable pairs; Faltings' lemma (2.13); Theorem 6.5.

Imported, not planned: models over a DVR and their base change (Tau Ceti StableReduction Layer 0), nodal and stable families (Layers 1, 3), coherent pushforward, projective morphisms and ampleness (Layer 2), blowups and admissible blowups (Layer 4), and semistable/stable/pointed reduction over a DVR (Layers 7–9). These are recorded as `requests` to the Tau Ceti stages, as other packets do. Rational and birational maps are Mathlib baseline.

## Upstream order: what moved down into SF.4

SchemeAndStackFoundations is tier 2 (`research/blueprint/upstream/CaraianiNewton.md`). No node cites a roadmap of a higher tier. The following notions are planned here, and their higher-tier planners should be pointed at the SF.4 nodes:

| Notion | Previously planned or requested at | SF.4 nodes |
|---|---|---|
| Moduli stack of stable pointed curves, algebraicity, properness, smoothness, finite cover, extension after alteration | StableReductionPartII MC.0/MC.1/MC.2/MC.4/MC.6 (key/moduli-curves); AlgebraicModuli R09.4/R09.5 (RT-AREA-algebraicgeometry/17 fix) | SF.4/stable-curve-stack, isom-stable-curves, stable-curve-stack-algebraic, stable-curve-stack-smooth, level-structure-cover, stable-extension-after-alteration |
| Hilbert/Quot schemes, Grassmannian, Chow's lemma | AlgebraicModuli R09.2 | SF.4/hilbert-scheme, grassmannian-scheme, chow-lemma |
| Formal schemes, completion, coherent formal modules, formal functions, existence, algebraization | AdicSpacesPartII F0 (tier 3) | SF.4b nodes |
| Deformation functors, Schlessinger, hulls, obstruction theories | DeformationAndDerivedPatchingAlgebra R03.1/R03.2 (tier 10); AlgebraicModuli A0-extension/R09.6 | SF.4a nodes |
| de Jong 4.1, 5.8, 6.5 and inputs | AdicCoefficientsAndComparisons L5 (tier 10); RD.5's request to L5 | SF.4e nodes |

The full cotangent complex (DerivedDeRhamCohomology DD.0) is **not** moved down: no SF.4 target needs it. SF.4 uses the naive cotangent complex, which handles smooth and lci inputs.

## Confirmed red-team findings

- **RT-AREA-algebraicgeometry/16**: applied. SF.4 is the single owner of de Jong 4.1 and 6.5 in the forms L5 names, with 5.8. The inputs are blowups from StableReduction Layer 4 and flattening and strict transforms from SF.4c. The packet proposes SF.4 → L5 and SF.4 → RD.5.
- **RT-AREA-algebraicgeometry/17**: applied, with the owner moved down. The stack, the finite unramified diagonal, properness from StableReduction Layers 8–9, smoothness from SF.4a, and the finite cover with a universal family are all planned in SF.4d, because R09.4 (tier 4) and StableReductionPartII sit above this roadmap.
- **RT-AREA-etale/21**: the ownership part is applied (one purely schematic owner with no H1/H5 dependency), but in the opposite direction. The owner is SF.4 itself, not a new L5:alterations prefix, because L5 is tier 10. L5 keeps tasks 4–5. RD.5 and the proposed PrimeToDegreeAlterations Part II import SF.4.
- The parent packet's gap "Conflicting confirmed alteration ownership directions" is resolved by the upstream order as above.

## What remains

The coverage `remaining` list in the packet gives the details:

1. **Knudsen II (Math. Scand. 52, 1983) was not read.** The public scan has no text layer. The pointed statements of SF.4d rest on de Jong §2.24's citation of it and on the unpointed proofs in Deligne–Mumford. This is recorded as a gap; the next step is to read it and add locators.
2. **Routed paper items not planned as nodes:**
   - PAPER-CESNAVICIUS-19 route 3 (henselian approximation, Elkik–Tougeron, SGA 2 VIII–IX); coordinate with the PerfectoidSpaces P3 Elkik node;
   - PAPER-QIAN-23 route 9 (KKMS toroidal semistable reduction);
   - PAPER-HACON-WITASZEK-23 route 2;
   - PAPER-BHATT-ETAL-23 route 2 (Cossart–Piltant, Saito);
   - PAPER-TEMKIN-17 route 4;
   - PAPER-CESNAVICIUS-22 route 4;
   - PAPER-FARB-KISIN-WOLFSON-24 routes 11 and 15;
   - PAPER-XIE-YUAN-22 pencil blowup;
   - PAPER-WITASZEK-22 route 3.

   PAPER-BHATT-18 route 6 and the alteration items of PAPER-BHATT-SCHOLZE-17 route 1 are planned: module strict transform, flattening 0815/081R, flat generic isomorphism 081M, domination 081T, the p-adic instance of Bhatt 6.2, and de Jong.
3. **Requests to SF.4 beyond the stage targets:**
   - non-Noetherian p-adic formal schemes with smooth and étale morphisms and étale-site invariance (PrismaticCohomology PR.1, DerivedDeRhamCohomology DD.2/DD.5, IgusaVarieties IG.0/IG.3);
   - de Jong 1997 Corollary 5.10 (ClassicalAdicEtaleCohomology H1);
   - the Kodaira–Spencer map (HodgeStructuresPartII H.8);
   - Lipman's theorem beyond StableReduction Layer 4.
4. de Jong 1996 §7 (Theorem 7.3) and §8 (Theorem 8.2) are not stage targets and are not planned.
5. **Cross-layer inputs for the assembly.** The SF.0–SF.3 packets, written in parallel, must plan exactly the following:
   - SF.0: relative Spec of a finite algebra, and finiteness of normalization over excellent (Nagata) schemes;
   - SF.1: algebraic spaces, Deligne–Mumford quotient stacks [H/PGL], fppf descent of polarized schemes, and Chow's lemma for algebraic spaces;
   - SF.2: H¹-classification of torsors, and Ext groups of O_X-modules;
   - SF.3: the relative Picard scheme of a smooth proper curve over a base.

   This is the second gap in the packet.
6. Mathlib lacks "a regular local ring is a normal domain". It is planned as an API item of SF.4/regular-scheme and recorded as the third gap; DeformationAndDerivedPatchingAlgebra R03.3 should import it.

## Notes for the maintainer

- **Drop the RS-25 links NeronModelsAndSemistableAbelianVarieties R11.1 → SF.4 and R11.3 → SF.4.** They point upward (tier 8 → tier 2), no SF.4 node uses them, and they create the cycle R2 → … → R11.1 → SF.4 recorded in AdicSpacesPartII. Consumers of Néron models already have direct RS-25 links. The natural direction is SF.4 → R11.1, since smoothening uses modifications.
- **StableReductionPartII is under revision** (DESIGN-StableReductionPartII~2). Its MC.0–MC.2, MC.4 and MC.6 should import the SF.4d nodes rather than re-plan them.
- **The suggested Lean file prototypes formal schemes by their systems of reductions.** The packet's definition is the topologically locally ringed space. Mathlib has no sheaves of topological rings on spaces, and the packet records the comparison as API.

## Sources read (2026-10-09)

| Source | Version and SHA-256 | Read |
|---|---|---|
| de Jong 1996 | Numdam scan, 9e4e7dab… | §§1–6 and 7.1–7.2 in full |
| Deligne–Mumford 1969 | Numdam, 79316edb… | §1, 2.7, §5 |
| Deligne, *Le lemme de Gabber* (1985) | Numdam, acb2b283… | §§1, 3 |
| Nitsure, arXiv:math/0504590v1 | edbab836… | §§1–5 |
| Bhatt, arXiv:1608.08882v2 | 08578ca1… | §6 |
| Stacks Project | online | about 150 tags, each fetched and its title checked; list in the packet's `sources` |

Not available or not read:
- **Knudsen 1983:** scan without a text layer.
- **Schlessinger 1968:** the AMS server refuses non-browser clients; it is cited through the Stacks Project's Formal Deformation Theory chapter.
- **EGA I and EGA III:** cited only through the Stacks Project's statements and reviews.
- **Raynaud–Gruson 1971:** cited through Stacks 0815/081R.
