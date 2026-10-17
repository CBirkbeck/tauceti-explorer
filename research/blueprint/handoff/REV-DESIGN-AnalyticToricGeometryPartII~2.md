# Handoff: REV-DESIGN-AnalyticToricGeometryPartII~2

Issue #8934. Claude (Opus 5.5), session `claude-9Zw89e`, 2026-10-17. The bot confirmed the claim in comment 6241602959. This session did neither design round nor the first review. This is a complete review, not a checkpoint.

**Verdict: accepted.** Of the 29 nodes, 23 are verified and 6 corrected; none were added. All seven stages stay planned, none closed, and nothing is claimed formalized. The [report](../reviews/REV-DESIGN-AnalyticToricGeometryPartII~2.md) has the evidence. The previous review object is kept whole in the packet's `reviewHistory`.

## What changed

- **Packet.** Six nodes were corrected:
  - `NT.4/power-cohomology` now cites `SchemeAndStackFoundations:SF.0/relative-frobenius` and `SF.0/universal-homeomorphism-etale-site`, and the SF.2 request is narrowed to smooth proper base change.
  - `NT.3/projection` gains field-naturality API (`toricProjection_baseChange`).
  - `NT.3/etale-topos`, `NT.3/open-topos` and `NT.4/projection-cohomology` gain field-naturality clauses, answering the accepted DeligneWeightsAndPurityPartII request to NT.3.
  - One NT.6 test was reworded.

  NT.6 `remaining` records the missing operational Chow classes in upstream SchemeAndStackFoundations. The packet also gains five new source findings E1–E5 (misprints in Scholze §8 and in the Fulton–Sturmfels preprint, each with a verdict), `sourceVersions`, and a `currentLibraryCheck.reviewRecheck` against TauCetiRoadmap main 350e970 and Tau Ceti main dd46906.
- **Roadmap definition.** The stage `requires` lists of NT.1–NT.6 now include every direct cross-stage dependency of their nodes.
- **Reader.** It is brought in line with all of the above. A field-by-field script finds every packet field in it.
- **Suggested file.** Examples are labelled with their packet tests; no declaration changed.

## Checks run

- `check_blueprint.py`: 0 errors, 0 warnings.
- `lean-check`: exit 0, 31 sorry-only warnings.
- `check_sorry_data.py`: passes.
- Reader-correspondence script: no mismatch.
- Dry `build.assemble` with the packet, reader and definition promoted: 35 new stages, 66 stage edges, no skipped links.
- Latent-cycle script over all packets: none.
- Source PDFs: SHA-256 hashes match the records.

## For the next steps

- **Package.** Cite AdicSpacesPartII and SchemeAndStackFoundations as TauCetiRoadmap roadmaps, since both are now on main. For NT.6, either SF.5 (or a SchemeAndStackFoundations Part II) supplies bivariant Chow classes and Kronecker duality, or the package uses the regular-complete-fan route that NT.6's `remaining` records.
- **DeligneWeightsAndPurityPartII.** Its request to NT.3 can be marked answered by `NT.3/projection` (`toricProjection_baseChange`), `NT.3/etale-topos`, `NT.3/open-topos` and `NT.4/projection-cohomology`.
- **Jobs this run found it could not take** (for the maintainer):
  - #7943 (assembly of ArithmeticGaloisRepresentations) cannot be claimed: GitHub refuses comments on an issue with more than 2,500 comments, and its bot notices have reached that limit.
  - The six `focus` "[Review] Fixes for the area" issues still name fewer deliverables than their queue entries.
  - #3593 (REV-DESIGN-PrismaticCohomologyPartII) reviews a design that reuses the id PrismaticCohomologyPartII. That id was given today, in #10228, to a different package (Nygaard, absolute prisms and q-de Rham).

No scratch file is needed to continue.
