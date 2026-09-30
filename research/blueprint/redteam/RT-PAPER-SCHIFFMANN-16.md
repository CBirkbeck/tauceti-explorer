# Red team: PAPER-SCHIFFMANN-16 (Schiffmann, *Indecomposable vector bundles and stable Higgs bundles over smooth projective curves*)

Job `RT-PAPER-SCHIFFMANN-16` (issue #4122), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-SCHIFFMANN-16.result.json`, in the format of PROTOCOL section 17.

**Result:** 13 findings: 3 high, 5 medium and 5 low.

- The extraction is careful, and Theorems 1.1, 1.2 and 1.6 stand.
- The paper has a new mathematical error, in Corollary 1.9 (v2) = 1.4 (print). The recorded correction (E4) makes it worse.
- Item 11 copies a preprint identity that is false and was corrected in print.
- Route 1 duplicates routes of PAPER-YU-23 that were accepted earlier the same day.

## Independence

- **Who did the work.**
  - The extraction is by Claude Code `cc-7b31c4` (issue #1181, 22 September).
  - The review is by Claude Code `cc-d67081` (issue #1183, 23 September).
  - There is no separate errata file.
  - `cc-f805bf` appears in none of these files.
- **Disclosure.** This session wrote PAPER-DELIGNE-74/80 (the Weil I and II routes to WC and DWP). It also red-teamed PAPER-BERGSTROM-FABER-PAYNE-24 (PR #4699). That red team's finding /7 said plethystic Exp/Log had no owner.
  - Finding 3 quotes the review of that red team, which found two owners.
  - I used the Deligne extractions only to confirm a reference point that FIX-RT-AREA-etale already covers. No finding rests on them.
  - No finding asks for a change to this session's files.

## What was read

- **The Annals text, the version of record.** Fetched 30 September 2026. Its SHA-256 is `8e486963…c7a5`, the same as the review's.
  - I read all 66 pages.
  - I checked page images of pp. 300–301; Corollary 1.4 again at 300 dpi.
- **arXiv v2**, the last version. Its SHA-256 is `7e5cbf6e…9bb2`, the same as the review's. I collated it against the Annals text wherever an item or a finding depends on the wording.
- **Mellit, arXiv:1707.04214**, Theorem 1.1, for the status of Conjecture 1.7.
- **The rest of the repository.**
  - Every item, route and source issue.
  - The cited stages: GS.0, ET.2b, DWP.0–10, R09.2, QM.0, and the Tau Ceti quiver roadmap.
  - The GS, DWP.0, QSeries and HabiroNahm packets.
  - The overlapping extractions: Yu 23, GWZ 20 and 20-B, Esnault–Groechenig 20, BFP 24, CLP 24 and Garoufalidis–Scholze–Wheeler et al. 24.
  - The pinned libraries: Mathlib 082e2d3 and Tau Ceti f790474.
  - RT-AREA-etale and FIX-RT-AREA-etale, which already treat route 3.

## What holds up

- **Recomputed:**
  - Theorem 1.6 at r = 1 gives A_{g,1,d} = ∏(1−α_i).
  - The printed closed formula for A_{g,2,d} gives 0 at g = 0 and (1−α_1)(1−α_2) at g = 1, as Atiyah's classification requires. At α = 0 it gives g. I checked with exact rationals.
  - Siegel's formula at g = 0 for r = 1, 2 (with q = 2).
  - The bound d > (g−1)r(r−1) of Proposition 2.1 (print) is exactly what the slope-gap argument gives.
- **Source issues.** E1–E3 are confirmed, and E4's two index slips are confirmed.
- **Routes.**
  - Every missing item is routed once.
  - There is no cycle.
  - No route goes into a finished blueprint: GS is partial, DWP.0's route is being redone, and ET.2b has no packet.
  - FIX-RT-AREA-etale's re-routing of item 36 to the LPV Part II is sound. So are its new E5 (the `[Del74, 3.5.3]` reference should be Weil II), E6, E7 and the `sourceVersions` it adds. I do not repeat them.

## Findings

| # | Severity | Kind | Where | What |
|---|---|---|---|---|
| 1 | high | error | item 12, E4 | Corollary 1.9 (v2) = 1.4 (print) has both exponents wrong. The Poincaré dual is q^{1+(g−1)r²}A(z^{−1}), and the components are counted by H^{2(1+(g−1)r²)}. At r = 1, Λ = Pic^d and \|Jac(F_q)\| = q^g·A(σ^{−1}). E4 "fixes" a parenthesis into a false formula. |
| 2 | high | error | item 11 | The Poincaré-polynomial identity lacks (−1)^n and is false at r = 1: t^{2g}(1+t)^{2g} ≠ t^{2g}(1−t)^{2g}. Print (Corollary 1.3) corrects this, as it does v2's "dimension 1+(g−1)r²"; neither correction is recorded. |
| 3 | high | duplicate | route 1 vs Yu 23 routes 7, 12, 13 | Yu's accepted routes send Schiffmann's Theorem 1.2, the counting polynomial, purity, Krull–Schmidt, the Higgs moduli, the density of Weil tuples, the plethystic Log and the GSp character ring R_g to other owners. Both design jobs are pending. |
| 4 | medium | error | item 8, route 1 brief | Independence of d and integrality are recorded "as open". Mellit's Theorem 1.1 proves both for g ≥ 1, and GWZ-20/70 proves the coprime case. Mellit is not a prerequisite. |
| 5 | medium | error | items 54, 55 | Both items claim Q[T_g]^{W_g}. v2's Corollary 8.1 is corrected to K_g in print. Theorem 7.1 claims integrality that its "parallel" proof does not give; for N = 0 that integrality is the paper's own conjecture (p. 300). |
| 6 | medium | error | item 9, route 4, brief (7) | ET.2b has no canonical twist ("sufficiently positive divisor"), no stability, no coarse moduli and no properness of the Hitchin map. The brief plans these in route 1, while the review says they are imported from ET.2b. |
| 7 | medium | library-claim | items 15, 16 | Tau Ceti already has Krull–Schmidt in Azumaya's generality and Fitting's lemma (`KrullSchmidt/DirectSum.lean:154`, `Indecomposable.lean:263`). Only the transfer to Coh(X) is missing. |
| 8 | medium | missing | §§5.5–5.8, 2, 6 | No items for the derivation (5.14)–(5.22), including the key identity (5.21). Also missing: dependence on d mod r, the Galois descent of Lemma 2.6, the fact that coprime indecomposables are absolutely indecomposable, and the r = 2 formula as a test. |
| 9 | low | library-claim | items 4, 17, 19, 43, 45, 59 | Uncited: `YoungDiagram.armLength` and `legLength`, `Matrix.card_GL_field`, `TauCeti.Quiver.Kronecker`, `Module.Grassmannian`, and QM.0's q-binomial node, of which Heine's formula is a case. |
| 10 | low | missing | sourceIssues | In print, two references to the relabelled Lemma 6.1 are stale: (b) should be (a) on p. 340, and (d) should be (c) on p. 347. v2 is correct. |
| 11 | low | missing | prerequisites | Missing: Mozgovoy–Schiffmann [MS14], García-Prada–Heinloth(–Schmitt) [GPH13, GPHS14] and Harder–Narasimhan [HN75]. |
| 12 | low | error | items 14, 43 | GS.0 does not plan the Euler form of Coh(X) or the C_{≥ν} categories. R09.2 does not mention tangent spaces or strong generation. |
| 13 | low | other | E1–E4, source.read, item 10 | The files still say "The published version could not be consulted" next to the review's published locators. Item 10's note has "q^{dim}/2" where it should say q^{dim/2}. |

## The two errors in the paper

**Corollary 1.4 (print), 1.9 (v2).** Write D = 1+(g−1)r², so that dim Higgs^st = 2D.

- **Part (i).** Theorem 1.2 gives |Higgs^st(F_q)| = q^D·A(σ). Higgs^st retracts onto the proper variety Λ.
  - Poincaré duality turns each Frobenius eigenvalue λ into q^{2D}/λ.
  - Since q(σ^{−1}) = q^{−1}, this gives |Λ(F_q)| = q^D·A(σ^{−1}).
  - The printed factor is q^{2D}.
- **Part (ii).** The number of components of the D-dimensional variety Λ is the dimension of H^{2D}(Λ), not of H^{D}(Λ).
  - Published Corollary 1.3 gives the coefficient of t^{2D} as A(0) = dim H^{2D}_c(Higgs) = dim H^{2D}(Λ).
- **The case r = 1.** Here Λ = Pic^d.
  - |Pic^d(F_q)| = ∏(1−σ_i) = q^g·A(σ^{−1}); the printed formula gives q^{2g}·A(σ^{−1}).
  - H^{2g}(Jac) is one-dimensional, but H^g(Jac) has dimension C(2g, g).
- **The case g = 1, r = 2, d = 1.** Here Λ ≅ E, and the correct formulas give |E(F_q)| and dim H²(E) = 1.
- **E4.** It reads the printed "q^{2(1+(g−1)r²}" as a missing ")". The fix is to delete "2(".

**Item 11 (v2, Corollaries 1.6 and 1.7).** The multiplicity of σ^I is a_I, where A = Σ a_I(−z)^I. So the unsigned series is t^{2D}·A(−t, …, −t), and the signed series is t^{2D}·A(t, …, t), which is the form print uses.

## Duplication with Yu 23 (finding 3)

Yu's items, the Schiffmann items they duplicate, and where Yu routes them:

| Yu item | Schiffmann item | Yu's route |
|---|---|---|
| 037, Higgs count | 10 (Theorem 1.2) | GS counting Part II |
| 046, counting polynomial | 2, 3, 7 | GS counting Part II |
| 131, purity and Poincaré polynomial | 11 | GS counting Part II |
| 178, top-weight term | Corollary 1.5 in 11 | GS counting Part II |
| 027, Krull–Schmidt | 15 | GS counting Part II |
| 036, Higgs coarse moduli | 9 | GS counting Part II |
| 100, density of Weil tuples | 36 | GS counting Part II |
| 044, plethystic Log | 5 | QM.0 |
| 099, GSp character ring | 1 | ClassicalGroupsPartII |

Yu's routes were accepted at 17:28 and 18:02 on 23 September. This paper's review, at 23:14, says "no other extraction proposes it". The proposed owners are:

- **CountingBundles** owns Schiffmann's theorems. Yu's Part II imports them.
- **QM.0** owns the plethystic Exp/Log.
- **R_g** is identified with the GSp character ring of Yu's item 099.
- **The density of Weil tuples** goes to the LPV Part II, following FIX-RT-AREA-etale. Yu's item 100 imports it from there.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-SCHIFFMANN-16.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on both files: 0 problems.
- No Lean was written or compiled.
