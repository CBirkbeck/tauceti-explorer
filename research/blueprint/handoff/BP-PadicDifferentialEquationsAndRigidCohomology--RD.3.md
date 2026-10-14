# Handoff: BP-PadicDifferentialEquationsAndRigidCohomology--RD.3

Issue #9745. Worker: Claude (session claude-SgXQhP), 2026-10-14. Follow-up of
BP-PadicDifferentialEquationsAndRigidCohomology (main packet accepted by REV-PadicDifferentialEquationsAndRigidCohomology).

Deliverables:
- `research/blueprint/packets/PadicDifferentialEquationsAndRigidCohomology--RD.3.json` (part `RD.3`, status `complete`, coverage `planned`)
- `research/blueprint/readmes/PadicDifferentialEquationsAndRigidCohomology--RD.3.md`
- `research/blueprint/suggested/PadicDifferentialEquationsAndRigidCohomology--RD.3.lean`

## What this pass did

The main packet's RD.3 coverage record listed six open items. The decisive find is that Berthelot's
preprint *Cohomologie rigide et cohomologie rigide à supports propres, première partie* (IRMAR 96-03,
1996), which the main pass treated as unpublished, is public: an archived copy of the author's Rennes
page is at
<https://web.archive.org/web/20130515094802/http://perso.univ-rennes1.fr/pierre.berthelot/publis/Cohomologie_Rigide_I.pdf>
(sha256 0630136e…; the live Rennes URL now returns 404). Chapters 1–2 of it were read in full
(pp. 32–89). Kedlaya's "[Be4] Théorème 2.5.7" is Théorème (2.5.7) of this preprint.

1. **Fibration theorems, gluing in the independence theorems, stack property, Theorems A/B (closed).**
   New nodes `etale-tube-isomorphism` (1.3.1), `standard-strict-neighbourhoods` (1.2.1–1.2.11),
   `etale-strict-neighbourhood-isomorphism` (1.3.5), `j-dagger-exactness-and-functoriality`
   (2.1.1–2.1.8), `coherent-j-dagger-modules` (2.1.9–2.1.11), `coherent-j-dagger-gluing` (2.1.12),
   `overconvergence-is-a-property` (2.2.1–2.2.11), `taylor-series-convergence-criterion`
   (2.2.12–2.2.14), `isocrystals-glued-from-local-frames` (2.3.2; the independence of the gluing
   choices, left to the reader by Berthelot, is supplied and recorded as source issue E301),
   `zariski-stack-of-overconvergent-isocrystals` (2.3.3), `affine-frame-global-sections-equivalence`
   (2.5.2), `mw-pullback-realises-frame-pullback` (2.5.3–2.5.6), `frobenius-structure-forces-overconvergence`
   (2.5.7–2.5.8). The `continuations` field gives the proofs of the main nodes weak/strong fibration,
   independence of frame (2.3.1) and of compactification (2.3.5; the Chow-type reduction uses
   Raynaud–Gruson I Cor. 5.7.14, p. 52, read from the cleared library, or equivalently
   SchemeAndStackFoundations:SF.4/modification-domination twice plus 2-out-of-6), and the affine
   smooth description (2.5.8). The main hypothesis on `strong-fibration-theorem` is made precise:
   v proper on the closure of X in P′ ×_P Y.
2. **Tsuzuki's finite étale pushforward (closed).** Constructed from public sources: étale lifting of
   Monsky–Washnitzer algebras with Frobenius (`finite-etale-lifting-of-mw-algebras`, Étesse 2002
   §1.2 and Prop. 1; Étesse Padova 2002 Thm 4), restriction of scalars (Kedlaya, Finiteness,
   Def. 3.4.2), Frobenius forces overconvergence, Zariski gluing. See the continuation of
   `RD.3/finite-etale-pushforward-of-isocrystals`.
3. **Abe's counterexample (replaced; Abe still unread).** Abe (IMRN 2011) has no public copy.
   New nodes `kummer-isocrystal`, `liouville-exponent-sequence` and `liouville-extension-counterexample`
   give an explicit, fully proved counterexample on G_m: an extension M of O by the Kummer isocrystal
   K_λ, λ = −Σ p^{m_k} (m_1 = 2, m_{k+1} = N_k − k), with Hom_{Isoc†}(O, M) = 0 and
   Hom_{Isoc}(O, M) = K. The main RD.5 node `full-faithfulness-requires-frobenius` now depends on it.
4. **Log-decorated and partially overconvergent variants (boundary decision).** Not RD.3 targets:
   log isocrystals serve docility/semistable reduction, which the main coverage assigns to RD.5;
   partially overconvergent isocrystals are Isoc(X, Y, P) with Y not proper, already planned.
5. **Ordinary convergent coefficient model and crystalline Frobenius comparison (planned, Ogus gap).**
   `convergent-isocrystal`, `convergent-f-isocrystal` (planet "Convergent F-isocrystal"),
   `f-crystal-to-convergent-f-isocrystal` (Berthelot 2.4.1, e ≤ p − 1),
   `convergent-f-isocrystals-are-crystalline` (Berthelot 2.4.2; Kedlaya Notes Thm 2.2; Guo–Reinecke
   Thm 2.14, Rem 2.15; D'Addezio §2.2 fn. 2 — this realises D'Addezio /72),
   `underlying-bundle-of-convergent-isocrystal` (Guo–Reinecke Prop. 2.17). `RD.3/restriction-to-convergent`
   now targets these (continuation); the CR.3 request is met by existing CR.1 nodes. The *cohomological*
   Ogus–Shiho comparison is left to RD.7 (it needs RD.4's cohomology; RD.7 combines
   `convergent-f-isocrystals-are-crystalline` with `RD.4/proper-rigid-equals-convergent`).
6. **Étesse and Crew (planned, with gaps; Étesse Thm 7 moved).** `unit-root-f-isocrystal`,
   `crew-unit-root-correspondence` (Kedlaya Notes Thm 3.7; D'Addezio Prop. 3.3.4; Lang-torsor outline
   supplied, Crew/Katz unread), `weak-completion-henselian-descent` (Étesse Padova 2002 Thm 3–4,
   Elkik 1973 Thm 3 / Cor. 1, both on Numdam), `direct-summands-of-overconvergent-f-isocrystals`
   (Étesse Thm 6), `etale-descent-of-overconvergent-f-isocrystals` (Étesse Thms 1–3, Ogus's convergent
   descent unread). Étesse's Théorème 7 and Berthelot's Théorème 5 need relative rigid cohomology;
   Berthelot's Thm 5 is proved in Tsuzuki, Documenta Math. Extra Vol. Kato (2003), Thm 4.1.1,
   pp. 906–908 (public, read). Both are proposed for RD.5 in `restructure` (entry 1), with Zarhin's
   trick moving down from ArakelovGeometryAndAbelianHeights:R35.6 (tier 16).

27 new nodes (14 theorems, 5 lemmas, 4 constructions, 3 definitions, 1 application), 53 API items,
32 unit tests, 1 planet, 19 continuations, 3 gaps, 0 requests, 3 source issues (E301–E303).

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicDifferentialEquationsAndRigidCohomology--RD.3.json`:
  0 errors, 0 warnings (no declaration index on this machine, so baseline names were checked for form
  by the script and confirmed by hand in the pinned Mathlib source, 082e2d3).
- The union of the main packet, this packet and the continuation edges is acyclic, and no RD.3 node
  depends on a node of RD.4 or later (script check). Two continuation edges that would have created
  cycles (main definition/lemma depending on the new theorems about them) were removed.
- `lean-check` on the suggested file: elaborates against Mathlib 082e2d3 / Tau Ceti f790474 with no
  errors; the only warnings are 9 `declaration uses sorry`. Two statements are proved outright
  (`IsOverconvergentCoeffs.isConvergentCoeffs`, the zero connection is convergent). The definition
  `IsUnitRootIsocrystal` needs `set_option backward.isDefEq.respectTransparency.types false in`, the
  same option Mathlib's own Isocrystal file uses when applying Φ(p, k).
- `python3 research/blueprint/intake.py check-files` on the four files: see the pull request.

## What remains (precisely)

- Ogus's convergent-site theorems (gap): 1990 Prop. 7.3 (essential surjectivity in Berthelot 2.4.2),
  1984 Ex. 2.7.3, Prop. 2.18, Rem. 2.8.1, Thm 2.15, Prop. 2.21 (Guo–Reinecke Rem. 2.15, Prop. 2.17),
  1984 Thms 4.5–4.6 (Étesse's descent). Not public.
- Crew 1987 Thm 2.1 / Katz LNM 350 Prop. 4.1.1 (gap): refine the Lang-torsor outline into lemma-level
  nodes, or read the sources.
- Étale descent of Isoc† without Frobenius, or on non-smooth X (Kedlaya Notes Defs 2.4, 2.7 via Le
  Stum, not cleared): not planned. The main node's `IsocDagger.isStack` API is read for the Zariski
  topology (continuation).
- RD.5 follow-up (#9747) should plan, per restructure entry 1: Berthelot–Tsuzuki overconvergence of
  R^q f_rig* for liftable proper smooth families (Tsuzuki 2003 Thm 4.1.1, with his Thm 3.3.1
  criterion), and Étesse's Thm 7 for abelian schemes, consuming
  `direct-summands-of-overconvergent-f-isocrystals`, `etale-descent-of-overconvergent-f-isocrystals`
  and `f-crystal-to-convergent-f-isocrystal`; Zarhin's trick to be planned at tier ≤ 12
  (AbelianSchemesAndArithmeticModuli or RD.5 itself). Siegel moduli with level: AlgebraicModuli R09.4.
- RD.7 follow-up (#9749): the cohomological Ogus–Shiho comparison, as above.
- Main gap `review-quillen-suslin-proof-inputs` (RD.3/rigid-quillen-suslin) is untouched.
- Assembly: planets — main has 5 for RD.3 (Frame, Tube, Berthelot's j† functor, Independence of the
  frame, Overconvergent F-isocrystal); this part adds one (Convergent F-isocrystal), total 6.
  Restructure entry 2 proposes sub-layers RD.3a/b/c. When assembling, apply the 19 continuations
  (additionalPrerequisites) to the main nodes; the combined graph has been checked acyclic.
- Notation: the Dwork isocrystal here is ∇(1) = −π dt with Frobenius exp π(t − t^p) (Berthelot 96-03);
  the main RD.3 acceptance nodes use the dual object ∇(1) = π dt with exp π(t^p − t) (Mém. SMF 23).
  The assembled document should pick one and mention the other as its dual.

## Moves and boundaries recorded

- Zarhin's trick: needed (through Étesse Thm 7, now at RD.5) at tier 12; its only atlas owner,
  ArakelovGeometryAndAbelianHeights:R35.6, is tier 16 — it moves down (restructure entry 1).
- Relative rigid cohomology results (Berthelot Thm 5 / Tsuzuki 4.1.1, Étesse Thm 7): RD.3 → RD.5.
- Ogus–Shiho cohomological comparison: RD.3 remaining item → RD.7.

## Sources

Read (public; URLs and sha256 in the packet): Berthelot IRMAR 96-03 ch. 1–2; Berthelot Mém. SMF 23
§4.2–4.3; Kedlaya, Notes on isocrystals v6 §§2, 3, 5; Kedlaya, Finiteness v6 §§3.4, 4.1–4.3; Étesse
ASENS 2002 (whole paper except the L-function part); Étesse, Rend. Sem. Mat. Padova 107 (2002)
§I.1–I.2; Elkik ASENS 1973 §III.1; Guo–Reinecke arXiv:2203.09490v3 §2.2; D'Addezio arXiv:2012.12879v4
§§2.2, 3.1–3.3; Chiarellotto–Tsuzuki 2003 §2.6–2.12; Tsuzuki, Documenta Kato volume (2003)
introduction and §4.1; Shiho arXiv:0707.1742v2 introduction; Raynaud–Gruson 1971 Cor. 5.7.14 (cleared
library scan, page image).

Not read: Abe IMRN 2011, Ogus 1984 and 1990, Crew 1987, Katz LNM 350, Tsuzuki Duke 2002 (no public
copies), Le Stum's *Rigid Cohomology* (not cleared).
