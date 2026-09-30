# Verification: the missing semisimple-to-quiver dependency

**Confirmed: the single medium finding.** The accepted SemisimpleAlgebras
packet deduplicates a valid prerequisite against an unreviewed research
packet. That prerequisite consequently does not reach the published graph.

Issue #4375; Codex — codex-rtOQ9t, 30 September 2026. This session is
independent of the original author cgp-7cf7c77d34d7, reviewer codex-hjdg0j
and red-team session codex-J6LwjP. Read the complete finding and red-team
report, then checked its evidence directly. This verification is limited
to the one finding; it does not repeat or endorse every unrelated library
audit in the red-team report.

The dependency runs from
`SemisimpleAlgebras#layer-2-artin-wedderburn-assembled-with-uniqueness` to
`QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`,
both under `tauceti:TauCetiRoadmap/RepresentationTheory/`.

The source supplies the block/simple-module indexing dictionary. The
consumer explicitly imports the Wedderburn side for A/J(A). I read both
full layer descriptions and checked both saved quotations as literal
substrings. The existing scoped reason is appropriate: the quiver owner
retains transport of simple modules, idempotent lifting, projective covers
and Morita reduction. This is not a request to reprove library Wedderburn
existence or to apply semisimplicity to the original nonsemisimple algebra.

The prior review says removing the proposal removes no graph edge while
acknowledging that the Quiver packet has no independent review. I checked
the current repository rather than assuming the historical state persisted:

- The accepted SSA packet contains the pair only under `alreadyRecorded`.
- A search through all research and promoted link packets finds the pair
  in `links` only in the unreviewed Quiver research packet.
- A promoted SSA packet exists; no promoted Quiver packet exists.
- `scripts/promote.py:46–73` skips packets without accepted review and
  routes reviewed links to `data/links`. Its review-signature guard also
  explains why a later research edit alone is not a publication update.
- `scripts/build.py:70–75` reads the promoted directory.
  `scripts/decompositions.py:267–313` consumes `links`, ignores
  `alreadyRecorded`, deduplicates ordered endpoint pairs and checks cycles.

I independently called `assemble(require_distances=False)` and the actual
`merge_links` function, entirely in memory. The observations reproduce
the finding:

| Check | Result |
|---|---|
| Assembled stages / edges | 2,840 / 8,007 |
| Both endpoints present | Yes |
| Exact edge, requires entry or directed path before repair | None |
| Merge with `alreadyRecorded` but an empty `links` array | No added edge |
| Restore the saved evidenced link | 8,008 edges; requires entry added; cycle check passes |
| Insert the same link again | Still 8,008 edges |

The corrected production route is therefore to restore the saved pair to
the accepted SSA packet's `links`, revise the `alreadyRecorded` entry and
summary, and correct the prior review's graph claim. The changed packet
then needs renewed independent acceptance and promotion. Do not edit the
generated graph directly, accept the unrelated Quiver packet wholesale,
or infer that the existing review signature will republish changed text.
The existing merge function already handles later duplicate publication.

The input link packet SHA-256 is
`7012bb7990816fcd08b20a8aa8e94e6fff2d94bcb6ba26a297aa83715f011249`, matching
the red team's reported hash. Exact checkout revision is recorded in the
review JSON. The public source locations are the repository's
[SSA roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/RepresentationTheory/SemisimpleAlgebras/README.md),
[Quiver roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/RepresentationTheory/QuiverRepresentations/README.md),
[promotion code](https://github.com/CBirkbeck/tauceti-explorer/blob/main/scripts/promote.py)
and [link merger](https://github.com/CBirkbeck/tauceti-explorer/blob/main/scripts/decompositions.py),
read in the recorded checkout on 30 September 2026. The finding requires
no new library availability assertion; the prescribed Mathlib/Tau Ceti pins
are unchanged.

Validation: every finding has exactly one verdict; `check_redteam.py`,
intake checks for both assigned files, and `git diff --check` pass. No Lean
file was required or compiled. No production or source packet was modified.
