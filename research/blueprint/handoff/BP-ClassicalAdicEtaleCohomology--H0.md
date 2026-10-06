# Handoff: BP-ClassicalAdicEtaleCohomology--H0

Issue #692. Worker: Codex, session `codex-M87Gdx`; branch
`codex-M87Gdx-classical-adic-h0`. This continues the 192-node checkpoint from PR #3281.
The packet is now `complete` at the 300-node budget of PROTOCOL §0 and is ready for
independent review. This is completion of a planning pass, not mathematical closure:
all implementation statuses are `unchecked`, and no stage is `closed`.

Only the packet, reader, suggested Lean file and this handoff changed. The eight
stage ids, reviewed decomposition ids and accepted RS-05 ownership boundaries are
preserved. H1 is an umbrella; D0/E1 supply general sheaf/derived carriers and H0 their
analytic instances. H0 continues to own the general tilde-limit and continuity theorem.
The upstream AdicSpaces and JacobianChallenge documents were read in full for this pass.

## Coverage and counts

| Stage | Nodes | Planets | Coverage |
|---|---:|---:|---|
| H0 | 80 | 6 | planned |
| H1:henselian | 42 | 6 | planned |
| H1:formal-adic-comparison | 58 | 6 | planned |
| H1:valuation-nearby-cycles | 20 | 6 | partial |
| H1:valuation-exports | 11 | 6 | partial |
| H1 | 11 | 0 | planned |
| H2 | 11 | 4 | planned |
| H3 | 67 | 6 | partial |

300 nodes: 21 definitions, 41 constructions, 83 theorems, 110 lemmas, 38 comparisons,
7 applications. They have 550 API items, 274 unit tests, 40 planets, 170 cited baseline
declarations, 728 source passages from 36 sources, 40 gaps, 37 supplier requests,
7 source issues and 6 restructuring proposals. The earlier checkpoint contained
210 tests; its handoff's figure of 240 was incorrect.

## Added targets and mathematical boundaries

- **H0:** arbitrary-preadic integral, isogeny and rational local systems from KL §8.4;
  finite étale factorization near a point; rational descent; bounded-lattice moduli;
  integral Spec–Spa equivalence, rational full faithfulness and extension descent.
  The preadic carrier and scheme local-system theory are explicit R0/A1 and SF.2
  imports. These additions do not extend all cohomology theorems to non-sheafy rings.
  De Jong's covering category, geometric fibre functor, analytic fundamental group,
  paths, prodiscreteness, covering/action duality and rational representation
  equivalence are planned here. The covering category needs its disjoint-union
  enlargement to realize all continuous discrete actions. The algebraic comparison
  is a universal profinite quotient with dense image; surjectivity is not claimed.
  Tate uniformization supplies the noncompact-monodromy example, with local lattices
  and no global integral lattice. The scheme Galois category IG.0 is not its owner.
- **H1:henselian:** Česnavičius §4.10's finite Noetherian models, henselized generic
  fibres, completed-colimit tilde-limit, coherent-site/hypercover continuity,
  all-degree perfectoid comparison and tilt export. The finite generic scheme is
  `Spec(R_j^h[1/p])`, while the analytic model is `Spa(R_j[1/p],R_j)`.
  Noetherian Huber 3.2.9 is applied at finite stages, never to the perfectoid limit.
  Every perfectoid-specialization node has the henselian parent; the proposed suffix
  imports H0's general continuity, P5 and L2 rather than making H0 depend on H1.
- **H1:formal-adic-comparison:** canonical semistable formal log structure, formal
  nearby-cycle sheaves, Kummer symbols, mod-p² factorization, U/V filtration,
  log differentials and all four parts of CDN Theorem 2.4, with non-quasi-compact
  gluing. The range is strictly `0 < m < pe/(p−1)`; the first differential quotient
  distinguishes `p ∤ m` from `p | m`. The cutoff includes the integral endpoint in
  the étale sheaf sense. Negative differential degrees are zero. General log
  algebra is imported from CR.5; the algebraic p-torsion BKH theorem is a recorded
  gap with an early LPV Part II supplier proposal, not assigned to prime-to-p LPV.0.
  Completion-comparison base-change naturality now has its own statement, with
  generic mate coherence requested from D0; base-change maps are not assumed invertible.
- **H3:** taut rigid/Berkovich geometry, strict-site comparison, overconvergent sheaves,
  support comparison A.15, counit compatibility A.19, the relative 2d bound and the
  arbitrary-dimensional smooth trace with composition, dimension-zero adjunction,
  surjectivity and geometric-fibre normalization. A.15 applies to θ-pullbacks of
  Berkovich complexes; A.18 identifies overconvergent sheaves, not arbitrary adic
  sheaves. The trace permits finite coefficients invertible in K, including p-power
  coefficients in mixed characteristic; classical Poincaré duality requires
  coefficients invertible in O_K. Proper finite-coefficient relative duality and
  local-system pairings retain their hypotheses and explicit D0/E1 coherence inputs.
  The ℤ_p trace exported to Guo–Reinecke 7.16/7.17 retains the integral inverse-limit
  proof gap. It does not construct the prismatic trace or Zavyalov's mod-p duality.
  Rigid results over `Spa(K,O_K)` do not resolve the general higher-rank plus-ring case.

The current planet choices are in the packet and the reader. They include rational
local systems, analytic monodromy, the BKH filtration and the general smooth trace;
generic sheaf carriers remain supplied by D0/E1.

## Confirmed ownership findings

- **RT-AREA-etale/15:** L2 owns Noetherian approximation and affine-limit Hom/Dᵇ_c
  continuity. Valuation-base Rj_* constructibility remains at H1:valuation-nearby-cycles,
  with compatible exports at H1:valuation-exports. The packet proposes the required
  GeneralBasesFourier imports: ABE/A10's continuity base and ABE/A11 at L2,
  YZ/A07 and ABE/A14 as extensions with comparison to the H1 object, action and
  base-change map. Its nondominant and finite-boundary limitations remain explicit.
- **RT-AREA-etale/20:** H1:henselian owns affine Gabber–Huber 3.2.5 and Noetherian
  proper Fujiwara 3.2.11. ArcTopologyAndDescent imports these and supplies the broader
  non-Noetherian Bhatt–Mathew 6.11, strongly Noetherian Tate extension and affinoid
  Artin vanishing. Early affine/Noetherian consumers do not wait for those extensions.
- **RT-AREA-etale/26:** propose `H1:henselian:perfectoid-limit` importing
  H1:henselian, P5, H0 continuity and L2. P5 acquires no classical-cohomology ancestor.
  Nodes keep their current henselian parent until the split is accepted; no extra
  stage id was added to this packet's scope.

These findings are recorded in `restructure` and the reader. Other roadmaps' briefs,
paper routes and atlas edges are outside this issue's allowed deliverables and were
not edited. The maintainer can apply the proposals after review.

## Sources and baseline checked

New public sources and exact versions/hashes are recorded in the packet:

- De Jong, Compositio 97 (1995), Numdam: §2 definitions and Lemmas 2.2–2.7,
  Theorems 2.9–2.10 with proofs; §4 including Theorem 4.2 and Corollary 4.4;
  the beginning of §5 for rigid translation.
- Kedlaya–Liu, arXiv:1301.0792v5: §§1.4.1–1.4.9 and all of §8.4.
  The new version metadata supplements the retained source version.
- Česnavičius, author PDF of Duke Math. J. 168 (2019): full §4.10 proof,
  formulas (4.10.2)–(4.10.7) and footnotes 2–4.
- Colmez–Dospinescu–Nizioł, published Forum Math. Pi 11 (2023), e16:
  full §2.1.1/Theorem 2.4, printed pp. 22–24, including local algebraization.
  The reviewed PAPER-CDN extraction was checked; no new source error is asserted.
- Zavyalov, author PDF of Annals 201 (2025): Theorem 1.1.3, §1.4 conventions,
  all of §5.3 and Appendix A. Its cited Huber proofs are still gaps.
- Guo–Reinecke, published Inventiones PDF: Theorem 7.16 and Remark 7.17,
  printed pp. 114–115, for the classical étale trace normalization only.
- Berkovich, IHÉS 78 (1993), Numdam: all §7.2 including Lemma 7.2.2's
  independence proof; §7.3 statement/initial reduction; Theorems 7.4.1–7.4.4
  and 7.4.9–7.4.10. The full §7.3 proof is not claimed read.

The 110 public excerpts attached to new nodes were matched against normalized text
of the downloaded versions, with none unmatched. The one new Huber excerpt was
checked against its retained, previously verified passage. The inherited passages
were retained, not claimed rechecked against inaccessible book text this run.

All 170 cited baseline statements were inspected at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The three new citations are actual
`Submodule`, `Padic` and `PadicInt` declarations. The reviewed library audit was read
before planning. No definition already provided by a supplier roadmap was reconstructed.

Huber 4.2.8–4.2.9 still lacks a verified public finite-boundary statement. The Springer
chapter preview was checked and is subscription-only for that passage. The exact
4.2.6–4.2.7 numbering/hypotheses and several Huber proof chains remain unverified.
The seven inherited source issues remain recorded; no additional erratum is invented.

## Validation and suggested Lean

- Blueprint checker: 0 errors, 0 warnings.
- Intake `check-files` on all four deliverables: 0 problems.
- `git diff --check`: passed.
- Atlas stage edges plus the packet's induced prerequisite edges have no cycle
  through any of the eight stages in scope. All packet tests have entries in the
  suggested file; the new lattice core occurs exactly once.
- The reader contains no Lean code and none of the prohibited scheduling terms.

The suggested file has 128 individual imports. Its inherited real signatures are
retained; the additions include a real two-sided lattice core on Mathlib p-adic
fields and submodules, five API lemma signatures and three test examples. Missing
analytic spaces, sites and coefficient carriers have named mathematical signatures
and explicit suppliers in comments, as PROTOCOL §13 requires, rather than dummy
proposition carriers.

**The full suggested file did not compile in this run.** The permitted `lean-check`
stopped before elaboration because the shared build has no compiled
`TauCeti.AlgebraicGeometry.AdicSpace.Spa.HuberPair` dependency. Four other direct
imports also lack objects: `Spa.Spectral`, `Huber.Padic.Field`, `Valuation.Microbial`
and `Topology.Spectral.ProConstructible` (all under their listed TauCeti namespaces).
No library was built or downloaded to remedy this. Existing alternative builds
were inspected but their Mathlib revisions differ from the pin.

Shared Mathlib is at the exact pin. Shared Tau Ceti is at
`cf386627e9176a3827c1a5fe804989fd94a4d216`; all 28 imported/transitively imported
Tau Ceti source modules were byte-for-byte compared with the Tau Ceti pin, with no
differences. This source audit does not supply the missing compiled objects and is
not a claim that the whole checkout is pinned.

An isolated extraction of the new lattice core was checked with `lean-check`
against pinned Mathlib: **0 errors, 8 warnings, all declaration uses of `sorry`**.
Memory was checked before each compilation and exceeded 20 GB. No Lean process was
left running. The previous worker's full-file compilation is historical validation
of the inherited portion, not validation of the assembled file in this run.

## Open work for independent review and follow-up

The packet's per-consumer 40 gaps, 37 requests and stage `remaining` lists are the
worklist. Planned stages have all target statements but retain proof/carrier
obligations. The three partial stages need:

1. **H1:valuation-nearby-cycles:** nondominant Cartesian valuative base change,
   Hub96 4.2.4. The public Orgogozo proof uses alterations currently owned by a late
   consumer L5; apply the early alterations supplier proposal first. Close the
   exact §4.2 proof gaps without replacing the valuation base by a trait.
2. **H1:valuation-exports:** obtain and verify 4.2.8–4.2.9's finite-boundary
   alternative, including its hypotheses; verify the relation of the supported
   4.2.6–4.2.7 forms to the book. No fabricated node covers the missing alternative.
3. **H3:** prove curve trace/duality for `C⁺ ≠ O_C` without local smooth models,
   the case needed in ECD 24.1; proper base change for non-algebraizable proper adic
   spaces (4.4.3); general higher-rank/compactifiable dimension assertions
   (5.3.11, 5.5.8); universal-compactification gluing/properness (5.1.5, 5.1.6,
   5.1.14) and §8.3 comparison proofs. The new partially proper rigid 2d result
   leaves these generalities open.

Across the planned targets, assign/read the early algebraic semistable p-torsion BKH
supplier, justify the integral inverse-limit trace and its surjectivity, and close
support-comparison base-change/tensor/internal-Hom coherence with D0/E1. Remaining
suppliers include SF.2, R0/R1/A1, CR.5, L2, P5, LPV.0–LPV.1, EDC.2, R02.1–R02.2,
and the anchor/profinite upstream roadmaps. Every request gives the exact statement
and consuming nodes in the packet.

Once a complete pinned shared build is available, rerun `lean-check` on the entire
suggested file. Review the six restructuring proposals, especially the perfectoid
suffix and early BKH supplier, before applying downstream changes. A follow-up
must preserve the source's coefficient and plus-ring hypotheses and continue from
the recorded target gaps rather than duplicate another roadmap's constructions.
