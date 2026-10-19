# BP-NoncommutativeAndEquivariantIwasawa~3 — maintainer-directed revision (round 3)

Issue #10953. Worker: Claude (Opus 5.5), session `claude-9F2aqq`, 19 October 2026. Branch `claude-9F2aqq-BP-NoncommutativeAndEquivariantIwasawa-3`. The bot confirmed the claim. This is a complete planning pass, not a checkpoint. It claims no implementation.

## Starting point

The stall detector opened this round at 14:37Z, citing the needs_changes verdict of the first review (REV-NoncommutativeAndEquivariantIwasawa). REV-NoncommutativeAndEquivariantIwasawa~2 then accepted revision 2 at target level (PR #10984, merged 16:33Z). That review left no objection to resolve; it listed 20 open obligations and 28 supplier requests.

So this round keeps every node and statement of revision 2 and its review, and does what was still open:

- consumes the roadmaps that are now open upstream pull requests or on TauCetiRoadmap main;
- applies the GENERALITY rule to the seven requests other roadmaps address to these stages;
- closes the obligations that can be closed by proof, and narrows the rest to what no supplier states.

The accepted `review` object is REV~2's and is left unchanged for REV-NoncommutativeAndEquivariantIwasawa~3.

## What changed

### Upstream consumed

These are recorded in the new top-level `upstreamImports`, in each node's `currentUpstreamInputs` and in the reader.

- **CompletedCohomologyPartII, TauCetiRoadmap #1035 (head e816649).** Its package moved five NE.0 facts down into itself (PKG-CompletedCohomologyPartII handoff, "Notions moved down"):
  - §0.1: the uniform convention and `analytic_exists_open_uniform`;
  - §3.11: `iwasawa_isLocal_iff_pro_p`;
  - §5.1: `iwasawa_noetherian_left` and `iwasawa_noetherian_right`;
  - §5.5: Auslander regularity, grade, Ore rank and finite-index invariance;
  - §5.8: Hilbert growth.

  The NE.0 nodes `uniform-pro-p-group`, `compact-padic-analytic-group`, `iwasawa-local-iff-pro-p`, `iwasawa-noetherian`, `iwasawa-auslander-regularity` and `iwasawa-finite-global-dimension` keep their ids, because other packets cite them (CompletedCohomologyPartII, LocallyAnalyticDistributionsPartII, ModpRepresentationsOfGL2OverLocalFields, ArithmeticLocallySymmetricSpacesPartII). They are now import interfaces: their proofs cite the CC section. NE.0 keeps only what CC does not state: the Ω(G) clause, semilocality, and the extension from uniform U to compact analytic G without p-torsion.

  CC's atlas packet still cites these NE.0 nodes. So CC is cited in text and in `upstreamImports`, not as a prerequisite; otherwise the atlas graph would have a cycle. `consumerRetargets` lists the five CC edges to drop.
- **ClassicalArithmeticCompletion, Tau Ceti main (c785fa3).** Layer 7 is the Chinburg–Pappas–Taylor determinant-image theory. Its atlas nodes `ClassicalArithmeticCompletion:CA.7/continuation/*` are now prerequisites of eight NE.2/NE.3/NE.6 nodes:
  - semilocal elimination, §7.27 (`semilocal-determinant-stability`);
  - the integral group logarithm, §7.46 (`integral-group-log`);
  - its integral images, §7.62 (`group-log-integrality`);
  - its kernel Det(G), §7.73 (`group-log-commutator-isomorphism`);
  - induction reduction, §7.63 (`p-elementary-determinant-reduction`);
  - fixed-point descent, §7.109 (`determinant-fixed-point`).

  Node-level cycle check: none.

  NE.6/integral-logarithm now derives the kernel μ(O)×G^ab from §7.73 plus a scalar computation: on O^× the logarithm is (1−F/p)log, and F−p is bijective on unramified O. The image of the logarithm contains O·[1]+φ(A).
- **AlgebraicKTheory, #1142 (head 7ecab00).** This is not an atlas roadmap. Its A4 (stable range one for semilocal rings) is a second source for units surjecting onto K₁.
- **GeneralAlgebraicKTheory, #1212 (head b1b14e6).**
  - §6.19 supplies request 2's category.
  - §10.6 and AlgebraicKTheory A2 partly supply request 6.
  - It has no determinant Picard functor, no Ore localization sequence and no complete-ideal K₀ invariance. Requests 3, 4 and 15 stay open, and obligation 16 says so.
- **SelmerIwasawaCohomology #869, ArithmeticGaloisDuality #858, PadicMeasuresIwasawaAlgebras (main).** Each was read at its head. Request 5 is supplied (PMIA §§4.2 and 4.6) and request 1 partly (§1.7). For requests 7, 8, 17, 20 and 28 the notes now say exactly which parts these READMEs cover; those requests stay open.
- **LocallyAnalyticDistributionsPartII (accepted atlas packet).** Its ND.0 is the registered owner of the analytic side of obligation 1: p-valuations, ordered-basis charts, the passage from uniform to p-valued groups at odd p, the analytic structure and the Lazard Lie lattice.
  - NE.0/p-valuation duplicated ND.0/p-valuation. It now cites that node as a prerequisite and imports the notion; this creates no cycle.
  - The other ND.0 nodes consume NE.0/uniform-pro-p-group or NE.0/compact-padic-analytic-group, so NE.0/ordered-uniform-coordinates and obligation 1 cite them in text.
  - A `merge-duplicate` restructure proposal records the split: LocallyAnalyticDistributionsPartII owns valuations and charts, NE.0 owns uniform groups.
  - The obsolete "no registered owner" wording for NoncommutativeAnalyticDistributions is replaced.
  - The existing `rescope` proposal now notes that ClassicalArithmeticCompletion covers most of the proposed KTheoryLowDegrees extension.
- **Read, found nothing to import:** #854 LocallyAnalyticDistributions, #323 GorensteinHomologicalAlgebra, #1154 InductionRestrictionPartII (request 19 stays open), #785 IHG, #1039 DirichletPadicLFunctions (which covers Q only).

### Requests from other roadmaps (GENERALITY)

There are seven requests, in the new `incomingRequests` and in the reader section *Requests from other roadmaps*:

- **Met.** PeriodsAndSpecialValues' NE.7 request: revision 2's shifted global determinant nodes already answer it. The same request also appears in its PS.0 part.
- **Withdrawn: owned by the requester.** CompletedCohomologyPartII's two NE.0 requests; its package now owns these facts.
- **Owned upstream.** ArithmeticLocallySymmetricSpacesPartII's two requests.
  - The Ore division ring and its rank are CC §5.5, and the canonical topology is CC §5.1.
  - AW13 Lemma 10.13 is a consequence the consumer derives from CC §§5.5 and 5.8.
  - No NE node is added, since one would restate CC.
- **Partly met.**
  - GlobalGaloisDeformationsPartII. NE.0/iwasawa-finite-global-dimension now states the finite free resolution of Z_p of length at most d+1. The Ext comparison waits on request 20. Lazard V (2.4.10) belongs to the analytic Lie-lattice owner.
  - ModpRepresentationsOfGL2OverLocalFields. NE.0/ordered-iwasawa-series' API `weightedGraded` now covers every p-valued group of finite rank: Schneider Theorem 28.3, p. 199, and Corollaries 28.5–28.6, pp. 200–201. A test `ordered_iwasawa_series_5` was added. The graded-enveloping Auslander regularity, the central-regular-sequence grade shift and amalgam coherence stay with the consumer.

### Obligations

- **Closed by proof: the former obligation 16** (noncommutative prime radical and finite p-group augmentation ideal).
  - NE.0/iwasawa-local-iff-pro-p proves I_Δ^|Δ|=0 by induction through a central element of order p.
  - NE.1/nilpotent-transition-kernel uses this.
  - NE.1/regular-modulo-prime-radical proves three things:
    - the prime radical of a noetherian ring is the sum of its nilpotent ideals, hence nilpotent (an m-system argument);
    - the radical of the central localization V is NV, because Ω(G/J) is free over F_p[[Π]];
    - in an Artinian ring, regular elements are units.
  - Two new acceptance tests: σ−1 is not nilpotent in Z_p[C_p]; the prime radical of M₂(F_p[ε]) is not its set of nilpotents.
  - The later obligations are renumbered; old 17–20 are now 16–19.
- **Narrowed.**
  - **1:** CC owns open uniform subgroups; the constant-index criterion stays.
  - **5:** CA.7 supplies most of the finite logarithm theory. Still unread in Oliver's book: the abelian image in Theorem 6.6 (L(1+I)=I∩ker ω, ω∘L=1), triviality of SK₁ for p-adic semisimple algebras, Theorems 11.2 and 2.10, and Propositions 11.6 and 12.7.
  - **9:** CC owns the uniform ring theorems, including ramified O. Serre's theorem is now read in the cleared Ribes–Zalesskii, Theorem 7.3.7(a), pp. 265–266. Brumer and Björk remain open.
  - **15:** the semilocal theorem is supplied; only the Conjecture 4.8 evidence remains.
  - **16 (old 17):** the determinant and localization contracts, with the #1212 audit.
  - **17 (old 18):** the compact-homology request, with the #869 and #858 audits.
- **Obligation 19 (old 20), uniform smoothing in Ritter–Weiss II.** I re-read arXiv:1001.2091v3 in full (SHA-256 unchanged). The obstruction is now explicit.
  - The admissible g form a closed subgroup, since s_(gh)=s_g+ver(g)s_h; so do the g that satisfy (4⋆) at one level.
  - Proposition 5's g for the conductor 𝔣 is the image of the idèle with components 1+f. Its transfer is trivial at the level of ε, and its norm tends to 1 as 𝔣 grows.
  - So no compactness argument yields a common g with nontrivial cyclotomic image. On p. 3 Ritter–Weiss note that their earlier theorem [RW7] now holds only for special g; the present theorem's existence statement needs one such g for every test function at once.
  - This is the one genuine mathematical leaf on the Kakde/RW route to NE.6/kakde-main-theorem.

### Lean

`TauCeti.NoncommIwasawa.of_sub_one_pow_char` states that (z−1)^p=0 in (ZMod p)[Δ] when z^p=1. It has a real proof, from `sub_pow_char_of_commute` and `charP_of_injective_algebraMap`. It is added to `leanPrototype.milestones`, and the header comment names the new imports.

## Counts and checks

- 136 nodes, none added or removed: 22 definitions, 28 constructions, 26 lemmas, 53 theorems, 5 comparisons, 2 applications.
  - 240 API items and 187 unit tests (+1); 33 planets; 35 baseline declarations.
  - 28 requests: 19 open, 2 extension-requested, 4 supplied on main, 1 partly supplied on main, 1 supplied in an open PR, 1 partly supplied in an open PR.
  - 19 gaps (−1); 7 incoming requests; 7 upstream imports; 26 sources (+8).
  - All eight stages are planned, none closed.
- `scripts/check_blueprint.py` on the packet, with the shared pinned declaration index: 0 errors, 0 warnings.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: 0 problems. `scripts/check_sorry_data.py`: passes. `git diff --check`: clean.
- **The suggested file compiles.** `lean-check` at Mathlib 082e2d3 and Tau Ceti f790474 reports the same eight `declaration uses 'sorry'` warnings as before and nothing else. The new theorem is proved.
- **Reader.**
  - It is regenerated from the packet by a renderer that first reproduced every unchanged block. That covers all 136 node blocks, in each block's own test-kind and uses-link style, and all 28 contracts and 20 obligations.
  - 21 node blocks were re-rendered; the contracts, obligations, references, coverage, conventions and upstream sections were updated; two sections were added.
  - Parity script: every statement, hypothesis, proof step, check, API item, test, source locator, upstream input, prerequisite, contract, obligation and incoming-request note is present. No dangling local links, no duplicate anchors.
- Node-level cycle scan over all packets from the NE nodes: no cycle.
- A Sonnet subagent cross-checked the new citations against the upstream READMEs and books; see "Citation cross-check" below.

## What remains

- **NE.0.** The constant-index criterion for uniform groups (DDMS not cleared); Brumer's theorem; the Björk transfer; registering the analytic-distributions supplier; the ports of current upstream foundations to the pin.
- **NE.2/NE.7.** The determinant Picard functor, the Ore localization sequence and complete-ideal K₀ at GeneralAlgebraicKTheory (requests 3, 4, 15).
- **NE.6.** The remaining Oliver inputs (obligation 5) and the Ritter–Weiss uniform smoothing (obligation 19). Obligations 2–4, 6–7, 10–14 and 18 are unchanged.

## For the maintainer

- **Packets to repoint when next revised (`consumerRetargets`):**
  - CompletedCohomologyPartII.json: drop five NE.0 prerequisites now owned in its package.
  - LocallyAnalyticDistributionsPartII.json: ND.0 and ND.2 still cite `NE.0/lower-p-series`, removed in revision 2.
- **Restructure.** The new `merge-duplicate` proposal: LocallyAnalyticDistributionsPartII ND.0 owns p-valuations, ordered bases and charts; NE.0 owns uniform groups.
- **Bare-stage citations.** ArithmeticLocallySymmetricSpacesPartII, GlobalGaloisDeformationsPartII and ModpRepresentationsOfGL2OverLocalFields cite the bare stage NE.0. The incoming-request table names the exact nodes, or the CC sections, they should cite.
- **Obligation 19** decides whether the Kakde/RW route to the totally real main conjecture is complete. A targeted source job could check whether a later RW paper, or Kakde's Inventiones version, gives a uniform smoothing element. Otherwise a mathematical repair is needed.
- **Books to buy or clear:** Oliver, *Whitehead groups of finite groups* (obligation 5); Brumer 1966 (obligation 9); DDMS (obligation 1).

## Notions moved

This round moved nothing. It records that CompletedCohomologyPartII's package moved §§0.1, 3.11, 5.1, 5.5 and 5.8 down from NE.0 (`ownershipChanges`). It also records that the Oliver/Taylor finite-group inputs once requested from KTheoryLowDegrees U.3/U.5 are now supplied by ClassicalArithmeticCompletion:CA.7.

## Sources read in this round

- **Upstream READMEs, at the heads above; SHA-256 values are in the packet's `sources`:**
  - CompletedCohomologyPartII §§0.1, 3.11, 5.1, 5.5, 5.8 and F.5;
  - ClassicalArithmeticCompletion §§7.27, 7.28, 7.46, 7.62, 7.63, 7.73, 7.80, 7.86, 7.93, 7.101, 7.109;
  - AlgebraicKTheory A0–A4;
  - GeneralAlgebraicKTheory §§6.3, 6.9, 6.19, 8.2, 10.6;
  - SelmerIwasawaCohomology §§2.12, 2.21, 3.3, 3.11;
  - ArithmeticGaloisDuality §§R02.4.4 and D7.5;
  - PadicMeasuresIwasawaAlgebras §§1.7, 4.2, 4.6, 5.2.

  None was copied; only section numbers and names are cited.
- **Ritter–Weiss, arXiv:1001.2091v3:** read in full.
- **Cleared books (atlas library), read in place, with no text retained:**
  - Schneider, *p-Adic Lie Groups*, §28, pp. 197–201;
  - Ribes–Zalesskii, *Profinite Groups*, §7.3, pp. 261–266.

No needed source was missing, apart from the three books listed above.
