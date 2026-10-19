# DESIGN-SelmerIwasawaCohomologyPartII — issue #3430

Worker: Codex, session codex-dxT7LL, 2026-10-19. Branch: `codex-dxT7LL-selmer-heights`.
The bot confirmed claim comment 6261429481 in comment 6261431865. This run takes
one job only. The higher-priority available focus assembly #7943 could not accept
a claim comment because GitHub rejected its more-than-2500-comment thread; no
claim was acquired there.

## Completed pass

The roadmap definition, blueprint packet, reader document and suggested Lean file
are complete for the first independent continuation explicitly permitted by the
issue: cycle heights and the crystalline bi-extension theorem of Disegni–Liu.
The reader gives full target statements, hypotheses, proof routes, APIs, tests,
dependencies, source locators, worked checks and source corrections. All wording
is original; no source passages or source-section recaps are included.

There are 30 nodes: 4 definitions, 8 constructions, 17 theorems and 1 lemma;
61 API items; 47 unit tests; 25 planets; and 2 baseline declarations. Every
definition and construction has uses and at least three discriminating tests.
Every implementation status remains `unchecked`.

All six stages, HP.0 through HP.5, are **planned**. None is closed: eight exact
supplier requests remain open, and G1 records a source-proof verification gap.
The packet status `complete` means that its target-level planning pass is
complete, not that the mathematics has been formalized or all suppliers built.

## Scope and ownership

The packet's `inputDisposition` accounts for all 231 routed item IDs exactly once.
All 14 `PAPER-DISEGNI-LIU-24` height items have targets here. The first
`restructure` proposal assigns the independent 198 `PAPER-LIU-ETAL-22` items to
`ArithmeticLevelRaisingAndBipartiteEulerSystems`, and the 19 appendix items from
`PAPER-CALEGARI-GERAGHTY-20` to `AdjointSelmerGroupsFromModularityLifting`.
Both proposals include their full item lists, proposed layer sequences, supplier
boundaries and inherited source warnings. They are ownership proposals based on
the existing extraction and complete route briefs; this run does not claim to
have independently re-proved either assigned source. Accepting these proposals
requires the maintainer's restructuring process and separate design jobs.

The second proposal moves the generic Panchishkin and canonical mixed-extension
height interface down from NE.7 to HP.1. NE.7 keeps its equivariant Bockstein,
leading-term and semisimplicity applications. NC.5 and GZ.9 keep curve-specific
constructions and comparisons. CR.6, RD.4 and PH keep their existing log,
support, weight and period infrastructure. This continuation must be packaged
after its geometric period/purity suppliers; it does not inherit the parent's
earlier tier or import a higher-tier height application. No upstream roadmap is
modified by this proposal.

## Exact remaining inputs

The requests in the packet give their consumer node IDs and full interfaces:

1. AG R02.1: continuous equivariant site cohomology after derived inverse limit
   and rationalization, including finite flat coefficients, topology and the
   geometric-kernel edge.
2. EDC.0: enhanced localization/Mayer–Vietoris, cup and trace with singular cycle
   supports, and the equivariant alteration pullback/degree-trace splitting.
3. SF.5: raw cycle groups, finite flat pullback and proper pushforward before
   rational equivalence. Existing Chow correspondences do not provide raw
   support transport.
4. PH R06.2: strict exact de Rham/crystalline realization interfaces,
   semistable finite-condition complexes, the weight −1 consequence
   H¹_st = H¹_f, localized finite-condition exactness, and exceptional quotient
   terms in local heights.
5. CP.4: potential semistability for smooth **open** algebraic cohomology with
   localization and subquotient compatibility. A proper comparison alone does
   not supply the Abel–Jacobi extension argument.
6. DWP.7: the arithmetic good-prime/base-change consequence of its existing
   smooth proper finite-field purity node, excluding eigenvalue 1 on global
   quotients at good unramified primes away from p. Crystalline purity of
   special-fiber components is separately imported from RD.6 and RD.7.
7. PH R06.5: integral supported Kato/Sato comparisons, residue-zero refined
   cycle classes, divided Frobenius, Galois log-PD diagrams, the exact
   p-power-almost admissibility claims, stable period-map range and Tate-class
   cup products. These are stronger than the existing rational syntomic fiber.
8. Upstream ClassFieldTheory, layer 11: the p-completed finite-idelic quotient,
   local maps, finite generation, almost-everywhere vanishing and principal
   relation used to sum the local terms. Artin reciprocity itself stays upstream.

**G1:** verify the canonical local filtered-semistable Kummer-torsor splitting,
including exceptional H⁰(V⁻) terms and its normalization, from the original
Nekovář 1993 proof cited in DL24 §§A.7/A.15. A Panchishkin representation pure
of weight −1 can have H⁰(V⁻) nonzero, as the Tate curve shows. Selmer complexes
§11.3 constructs norm heights; §11.4's comparison has additional assumptions and
a correction. Those passages are not a substitute proof of the general DL24
local construction. G1 affects HP.1 local/global heights and the height-unit
part of HP.5's smooth-model corollary. The B.9/B.11/A.8 crystalline
bi-extension chain is independent of G1.

## Source and statement audit

The packet records URLs, access date 2026-10-19 and SHA-256 hashes for the
accessible source files. Sources actually read:

- Disegni–Liu, *A p-adic arithmetic inner product formula*, Inventiones 236
  (2024), Appendix A, pp. 320–331, and Appendix B, pp. 331–368. Every statement
  and proof in the two appendices was read in arXiv:2204.09239v3; journal
  locators and the relevant displays were compared with the version of record.
  The global target and local decomposition were checked in §1.3 and §4.5,
  equation (4.8), p. 293. The last listed arXiv revision remains v3, dated
  2024-02-23.
- Nekovář, *Selmer complexes*, Astérisque 310 (2006), the public Numdam scan:
  §11.3, pp. 363–374, and §11.4, pp. 375–382, including the sign and exceptional
  quotient corrections.
- Scholl, *Height pairings and special values of L-functions* (1994), author
  copy, Theorem 5.3 and proof, printed pp. 18–21. These pages were read as page
  images because text extraction was unreliable. The étale extension/cup-product
  calculation is distinguished from the stronger motivic setup of that theorem.

The originals of Nekovář 1993, *On p-adic height pairings*, and Nekovář 2000,
*p-adic Abel–Jacobi maps and p-adic heights*, were inaccessible at the author
endpoints. They are explicitly marked `UNREAD`, with no invented page claims or
claim to have checked their proofs. The latter's Theorem 3.1 can replace the
requested smooth-open comparison route once its primary proof is accessible.
The maintainer's cleared-source index was consulted; no restricted source was
copied, and no uncleared book copy was used.

Five `sourceIssues` are recorded. E1–E4 retain the provenance of the confirmed
extraction findings on cochain notation, the κ twist, the supported target open,
and finite flat coefficients/group subscripts. E5 is a new finding awaiting
independent review: Definition B.12's claimed canonical successive fibers need
an enhanced coherent diagram. The plan constructs the actual embedding/boundary
complexes in a dg/stable enhancement before totalizing. This repairs the
categorical formulation without alleging that the main arithmetic theorem is
false. Published/preprint displays and the author's publication record were
checked; no correction for these findings was located.

Other significant checks retained in the statements: geometric versus arithmetic
cycle-class kernels; both arithmetic vanishings for the Beilinson cup-product
realization, versus zero marginal AJ classes for the Kummer index; the −1
uniformizer trace-boundary sign; strictness/faithfulness rather than full
faithfulness of D_dR; global good-prime purity rather than arbitrary local
quotient purity; the étale inverse-image syntomic heart; d-density for the
supported cycle lift; exactly the asserted admissible period complexes; the
Frobenius restriction and shifted signs in the monodromy edge; the 4d−1
filtration bound; source U_t and target U; saturated disjointness for every
correspondence; and descent through the valuation quotient only.

## Baseline and validation

Pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
The actual Submodule and LinearMap structure statements were read at that pin.
The reviewed parent audit is AUDIT-27 in `data/library-coverage.json`.

The current read-only upstream roadmap checkout was also inspected at
`0d144d044dacebca17b654695b6f1ad58f159b27`, and the current read-only Tau Ceti
library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The search included the
nine roadmaps newer than the atlas snapshot; LocalGaloisGroups and
ProfiniteCohomology were read for the nearby interfaces. Existing local
completion/Kummer and continuous-cochain infrastructure is imported, not
planned again. No build command was run in either read-only checkout.

- `python3 scripts/check_blueprint.py research/blueprint/packets/SelmerIwasawaCohomologyPartII.json`:
  **0 errors, 0 warnings**.
- Submission intake file check: **5 files, 0 problems**. The admitted-data
  checker also passes. A consistency audit verified all 30 reader statements,
  every API/test statement, roadmap/packet stage agreement, unchecked statuses,
  planet limits and the exact 231-item source-route disposition.
- The 52-line suggested Lean file **elaborated successfully with `lean-check`**
  at the pinned Mathlib, exit status 0, with exactly five expected
  `declaration uses sorry` warnings and no other warnings. Available memory was
  checked first (85 GB). No language server or library build was started.
- It states the native filtration-lowering milestone and four small tests.
  Following WORKERS.md's current shape rule, targets needing geometric or
  period carriers absent at the pins remain in the reader; no ersatz carriers
  or admitted data definitions were introduced. The older blanket-signature
  instruction is superseded by this explicit shape rule.

## Resume and review

Start the independent review with the reader's main theorem in HP.5 and work
backward through HP.4, HP.3 and HP.2; review HP.0–HP.1's signs and G1 separately.
Check the new enhancement finding E5, and verify the strengthened supplier
interfaces rather than treating a cited stage as if it already promised them.
Then decide the two ownership proposals and generic-height rescope. No further
target refinement is required merely to finish this pass. Closing stages needs
the precise supplier inputs and G1 above; packaging follows acceptance and the
upstream tier constraints. No scratch artifact is needed to resume: all
mathematical obligations, item IDs, source provenance and decisions are in the
five deliverables.
