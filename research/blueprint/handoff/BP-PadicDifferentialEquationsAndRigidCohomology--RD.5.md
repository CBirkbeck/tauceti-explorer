# BP-PadicDifferentialEquationsAndRigidCohomology--RD.5 — handoff

Job #9747, follow-up blueprint for layer RD.5 (finiteness, duality and Künneth) of
*P-adic differential equations, rigid cohomology and p-adic weights*. Worker: Claude
(session `claude-eC9wQT`), 14 October 2026. The bot confirmed
[the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9747#issuecomment-6171225275).

## Deliverables

- [Packet](../packets/PadicDifferentialEquationsAndRigidCohomology--RD.5.json): part `RD.5`,
  scope `RD.5`, status **complete**, coverage of RD.5 **planned** (together with the 73 RD.5
  nodes of the first-pass packet, which is not edited). 35 nodes: 3 definitions, 3
  constructions, 16 theorems, 11 lemmas, 2 applications; 44 API items, 26 unit tests, 5
  planets, 4 baseline declarations, 3 requests, 4 gaps, no new source issues.
- [Reader](../readmes/PadicDifferentialEquationsAndRigidCohomology--RD.5.md): rendered from the
  packet (every node with its statement, hypotheses, proof, API, tests, uses, acceptance,
  dependencies and sources), with hand-written block introductions, conventions and
  dependencies.
- [Suggested Lean](../suggested/PadicDifferentialEquationsAndRigidCohomology--RD.5.lean): compact
  shape, namespace `TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD5`,
  `import Mathlib`. Real-bodied light definitions over pinned carriers only (`HasFiniteIndex`,
  `finiteIndex`, `affineCurveH1Dim`, `localPairing` on `LaurentSeries`,
  `RankOneResidueUnipotent`, `IsStrictMap`, `gradedTensorDim`), the index-additivity and
  square milestones, nilpotence of a residue conjugate to q times itself, and examples; a
  closing comment lists every definition and construction of the packet with its API and
  check names, and every theorem, as roadmap targets whose carriers are not at the pins.
  **Compiled** with `lean-check` at Mathlib 082e2d3: exit 0, the only diagnostics are 13
  `declaration uses 'sorry'` warnings; no sorry'd data.

## What is closed (first-pass RD.5 coverage items)

- *Tsuzuki 2003, proper descent* (first-pass gap): planned through Le Stum's overconvergent
  site (`overconvergent-site`, `overconvergent-site-comparison`) and Zureick-Brown's public
  proof (`modification-cohomological-descent`, `fppf-cohomological-descent`,
  `proper-surjection-cohomological-descent`, `proper-hypercover-descent-spectral-sequence`).
  Tsuzuki 2003 itself remains unread.
- *Tsuzuki 1999, Poincaré-pairing functoriality and Künneth construction*: from Berthelot's
  *Dualité* note (author's copy, read in full): `supported-duality-morphism` (ψ_{Z,X} and its
  morphism of triangles) and `kunneth-pairing-on-tubes`. Tsuzuki 1999's RD.4 uses (Gysin,
  compact-support excision, finite étale pushforward) stay with RD.4.
- *Berthelot's trace and Lemme 2.1*: `rigid-trace-morphism`, `overconvergent-germ-hom-lemma`,
  `compact-support-gysin-and-trace`, `top-degree-dimension-one`, `finite-etale-trace-projector`,
  and `rigid-cohomology-base-field-extension` (Berthelot's closing remark).
- *Lattice index argument for dim H¹ = 2g + d − 1*: replaced by a generic-fibre computation
  (`curve-lift-with-boundary`, `dagger-curve-mayer-vietoris` after Crew's proof of his Theorem 7.5,
  `principal-parts-index-computation`); van der Put, Proposition 6.1, states the same formula
  (checked in the cleared copy).
- *Crew Part I §5 and Schneider 9.4*: `frechet-and-dual-frechet-finite` (Crew 2.8),
  `strictness-transpose-criteria` (Crew 2.9, 3.8–3.12), `robba-topological-residue-duality` (Crew 5.1–5.4; distinct from the cohomological `RD.1/robba-residue-duality` of the RD.1 follow-up),
  `robba-plus-minus-duality` (Crew 5.5). Hahn–Banach is imported from
  `LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach`, which supersedes the first-pass
  `RD.5/nonarchimedean-hahn-banach`.
- *Mixed full faithfulness, docility and semistable reduction*:
  `unipotent-monodromy-along-boundary` (docility), `extension-across-boundary`,
  `dense-open-restriction-fully-faithful` (D'Addezio 4.1.6), `convergent-log-isocrystal`,
  `log-extension-of-unipotent-isocrystal`, `global-semistable-reduction`, `docility-acceptance`.
- *Dagger–Berthelot comparison consumer (RD.5 part)*: `finiteness-for-smooth-quasi-projective-models`;
  this is also the answer to AG2.4's request to RD.5.
- *Igusa finiteness (RD.5 part)*: `log-rigid-comparison-for-curves`, `igusa-theta-cokernel-finite`.
- *Smooth proper direct images of convergent F-coefficients*: `relative-convergent-crystalline-comparison`
  (Shiho), `convergent-direct-image-smooth-proper` (Xu), `convergent-direct-image-perfect-complexes`
  (Guo–Reinecke Theorem 6.13, arXiv v3 pp. 60–61; the first pass's NSF-copy locator pp. 97–98
  is the same theorem).
- *Kedlaya Finiteness Chapter 2* (dagger and fringe algebras): belongs to RD.0 and
  AdicSpacesPartII:F1; nothing is planned here and nothing is left open for RD.5.

## Red-team findings handed to this job

- **RT-AREA-padic-2/33.** (a) The cover theorem keeps its first-pass id
  `RD.3/etale-cover-of-affine-space` (parent and realised stage RD.5, exported to RD.6); its source,
  Kedlaya's finite projection étale off the hyperplane at infinity (More étale covers, Theorems
  1–2, Lemmas 3–6, proofs on p. 5), is the new node `projection-etale-off-hyperplane`, with a
  consumer retarget. (b) De Jong 4.1 is imported from `SchemeAndStackFoundations:SF.4/de-jong-alteration-theorem`;
  the descent node is the Chiarellotto–Tsuzuki/Tsuzuki spectral sequence, planned with its
  hypotheses (`proper-hypercover-descent-spectral-sequence`), not L5's étale descent.
- **RT-AREA-etale/21.** The proposed `L5:alterations` prefix does not exist: the accepted
  AdicCoefficientsAndComparisons packet's restructure and the SF.4 packet make
  SchemeAndStackFoundations:SF.4 (tier 2) the single owner of de Jong 4.1/5.8/6.5, because an L5
  prefix (tier 10) would be cited upward by SF.4. RD.5 imports SF.4 (alteration, Chow's lemma,
  flattening, modification domination) and keeps rigid descent. The SF.4 packet is still
  `needs_changes`; its node ids are cited as they stand.
- **RT-AREA-padic-2/32.** RD.5's part is `finiteness-for-smooth-quasi-projective-models`; the
  functorial Grosse-Klönne comparison is an RD.4 target, cited at stage level (the concurrent
  RD.4 follow-up, #9746, should plan it with HLTT Lemma 6.8's tube and functoriality).

## What remains (precisely)

1. Kedlaya's semistable reduction proof interiors (Semistable reduction II, Propositions 3.3.4
   and 3.4.5; III, Theorem 6.3.1; IV, Theorem 5.0.1); the Riemann–Zariski space has no owner (gap).
2. Berkovich 1993, Corollary 4.3.2 and Proposition 4.1.2 (coherent descent for finite and flat maps
   of good analytic spaces), used by Zureick-Brown's Proposition 5.19 (gap).
3. Xu's Frobenius descent (arXiv:1802.09060v1, Theorem 1.5, §6) and Ogus 1990, Theorem 0.7.7
   (gap); Shiho's Theorem 2.36 is read with its short proof.
4. The verifications Berthelot's note sketches (1.3 residues, 1.4 strict neighbourhoods,
   3.3 Künneth compatibilities) (gap at the three nodes using them).
5. First-pass gap 47 (nonflat strengthening of Kedlaya, Finiteness, Proposition 7.2.1; source
   issue E92) is not addressed. Note for whoever takes it: without a Frobenius structure the
   strengthening is false for H⁰ (A = K⟨x⟩†, N = [[0, x], [0, 0]], C = A/(x)-type base change
   gives ker N_C of rank 2 against ker N ⊗ C of rank 1), and a Frobenius structure forces
   N F = q F N^σ with F invertible, so the Fitting ideals of coker N are σ-stable; showing that
   σ-stable ideals of an integral MW-type dagger algebra are 0 or A would give constant rank,
   hence projective kernel and cokernel, and remove flatness.
6. Requests: EnhancedDerivedSheaves:E2 (calculus of universal cohomological descent:
   Zureick-Brown 3.16–3.18), SchemeAndStackFoundations:SF.0 (ample-bundle lemmas behind Kedlaya's
   Lemmas 3–4), LocallyAnalyticDistributions:L0 (Mackey's theorem, null-sequence hulls of
   linearly compact sets, non-reflexivity of infinite-dimensional Banach spaces, Fréchet–Montel
   duals).
7. Same-roadmap stage citations to be pointed at nodes when the concurrent follow-ups land:
   RD.4 (Grosse-Klönne comparison; Pan's theta-cokernel identification), RD.3 (Étesse's
   overconvergence of R¹f_* for abelian schemes), RD.0 (LF topology of the Robba ring).

## Assembly instructions

- Keep the first-pass packet as is; apply `consumerRetargets` (12 first-pass nodes gain
  prerequisites; two drop `RD.5/nonarchimedean-hahn-banach`), drop the superseded Hahn–Banach node,
  and use `closesGaps` to remove the closed first-pass gaps 16 (RD.5 part), 17, 18 (RD.5 part),
  19, 20, 36, 39 (RD.5 part), 40 (RD.5 part) and 41.
- Planets: the first pass marks six in RD.5 and this part five; adopt the five-sub-layer
  proposal in `restructure` (RD.5a–RD.5e, extending the first pass's RD.5a–RD.5d with RD.5e for
  full faithfulness, docility and semistable reduction).
- `CrystallineCohomology:CR.6` (tier 9) requests Stein-exhaustion Fréchet interfaces from RD.5
  (tier 12): an upward citation that RD.5 does not serve; CR.6 should plan them itself.

## Checks run

- `python3 scripts/check_blueprint.py` on the packet with the pinned index: 0 errors, 0 warnings.
- Node-level cycle check over the first-pass and this packet with `consumerRetargets` applied:
  no cycle. Stage-level check (atlas `requires` and `stageEdges` plus this packet's induced
  supplier edges): no supplier stage is downstream of RD.5. All foreign suppliers are of lower
  tier (SF 2, AdicSpacesPartII 3, LocallyAnalyticDistributions 4, EnhancedDerivedSheaves 4,
  CrystallineCohomology 9, ModularCurvesPartII 11).
- Every source locator (89 of 90 node–source pairs; van der Put checked by hand) was checked
  against the text of the version read, with page offsets confirmed from running headers. One
  wrong attribution (a Semistable reduction IV locator for wild alterations) and four loose page
  ranges were corrected; the supplier statements of all 88 foreign node prerequisites were read.
- `lean-check` on the suggested file: exit 0, sorry warnings only (memory checked first).
- `research/blueprint/intake.py check-files` on the four deliverables.
- The packet and reader avoid the forbidden words and contain no `sorry`.

## Sources

Read for this job (URLs, SHA-256 and dates in the packet): Berthelot, *Dualité* (author copy);
Zureick-Brown, arXiv:1204.5246v4; Le Stum, Mém. SMF 127; Chiarellotto–Tsuzuki (Numdam);
Kedlaya, Finiteness (arXiv v6), Semistable reduction I (v5), II (v3), IV (v4), More étale covers
(v3); Crew 1998 (Numdam); D'Addezio, arXiv:2012.12879v4; Pan, arXiv:2209.06366v1; HLTT,
arXiv:1411.6717v1; Grosse-Klönne 2000 (arXiv:1408.3329v1); Guo–Reinecke, arXiv:2203.09490v3;
Shiho, arXiv:0707.1742v2; Xu, arXiv:1802.09060v1; van der Put 1986 (maintainer-cleared copy).
Not read: Tsuzuki 1999 and 2003, Berkovich 1993, Ogus 1990, Kedlaya Semistable reduction III,
Coleman 1996/1997, Schneider's *Nonarchimedean Functional Analysis*.
