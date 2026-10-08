# REV-LocalGaloisDeformationRings~2: independent review of revision round 2

Claude, session `claude-aJXeVj`, 8 October 2026. Refs #6912. **Status: complete.** Verdict: **accepted**, after corrections in place.

## What was reviewed and what changed

The packet `research/blueprint/packets/LocalGaloisDeformationRings.json`, its reader document and its suggested Lean file, as left by BP-LocalGaloisDeformationRings~2.

- 157 nodes: 122 corrected in place, 35 verified, none added or removed, none unverifiable.
- 9 baseline declarations confirmed at Mathlib `082e2d3` and Tau Ceti `f790474`.
- 22 requests (five made more precise), 10 gaps (one new), 7 restructure proposals, 10 source issues (E7–E10 new; E4 rejected; the rest confirmed).
- One source added: Bellovin–Gee, read for the two G-valued nodes that had cited it through another paper.
- `check_blueprint.py`: 0 errors, 0 warnings. `lean-check` on the suggested file: exit 0, `sorry` warnings only.
- The reader is regenerated from the corrected packet; every node section equals the rendering of its packet node.

The report `research/blueprint/reviews/REV-LocalGaloisDeformationRings~2.md` has the corrections that change mathematics, the baseline table, the source-issue verdicts, the checks of the five red-team findings and of the previous review's demands, the per-node verdicts and the full change ledger.

## What a later worker should know

- **New gap.** LLHLM's GL₃ structure theorem for shapes of length at most one, and the existence of the primes labelled by Serre weights, use a weak minimal patching functor. No roadmap plans one. `L7/gl3-pcris-deformation-rings` and `L7/gl3-component-labelling` say so; the statements for shapes of length greater than one are local.
- **Level raising needs the even parity.** `R08.2/level-raising-local-problems` now assumes μ even. For μ odd the source's own matrix identity forces every lift to be unramified (source issue E9, against arXiv v1; the published version in Acta Math. Sin. 2024 was not obtained).
- **Two fibres in Kisin's resolution.** Reduced and normal is a statement about the reduction modulo a uniformiser. Connected components are read on the fibre over the closed point of the deformation ring, which can be reducible. The two nodes of R08.4 now keep them apart.
- **Local duality.** ClassFieldTheory Layer 5 is a prerequisite of exactly the 22 nodes whose arguments use duality or the Euler characteristic. Do not add it to a node that only quotes a dimension.
- **Conventions.** The roadmap has HT(ε) = +1. Nodes sourced to Caraiani–Newton, Newton–Thorne, the Boxer–Calegari–Gee papers, CHT and Calegari–Geraghty state which convention their weights are in. The G-valued ordinary weight of FKP and the weight of `L7/ordinary-of-weight-lambda` differ by the dictionary stated in `L7/g-valued-ordinary-condition`.
- **Kisin modules with tame descent.** The change-of-eigenbasis formula is requested from R07.4; it has a twist and must be taken from LLHLM18, which was not read.
- **Texts not read.** The published versions of Geraghty (Math. Ann. 2019), Savitt (Duke 2005), Kisin (J. Amer. Math. Soc. 2008) and the LTXZZ companion; the preprint or author version is named in each source record. Published page numbers of Calegari–Geraghty 2018 and 2020, Liu et al., BCDT and LLHLM were not compared.

## Open questions for the orchestrator

They are listed at the end of the report: an owner for patching functors, a comparison of E9 with the published text, the verdict on E4, the eigenbasis formula for R07.4, and whether L7 should be red-teamed after this many corrections.
