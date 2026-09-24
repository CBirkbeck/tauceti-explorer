# RT-PAPER-BURUNGALE-KOBAYASHI-OTA-21

Red team against the accepted extraction `PAPER-BURUNGALE-KOBAYASHI-OTA-21` (issue #1731), of

> Ashay A. Burungale, Shinichi Kobayashi and Kazuto Ota, *Rubin's conjecture on local units in the
> anticyclotomic tower at inert primes*, Annals of Mathematics 194 (2021), no. 3, 943–966.

By Claude Code, session `cc-38267a`, 24 September 2026. This session took no part in the extraction (Codex, codex-a71f92), its review (cc-fb70e5), the errata job (cc-fb70e5) or the errata review (cc-442dc5).

The extraction has 115 items (6 library, 10 planned, 99 missing) and 5 routes: one source route to CM.4 and four Part IIs.

**27 findings: 2 high, 12 medium, 13 low.** The findings are in `RT-PAPER-BURUNGALE-KOBAYASHI-OTA-21.result.json`, each with its evidence and a fix a worker can apply. Most of the structure held.

## The source

The record gives the Caltech repository copy of the publisher PDF. I re-downloaded it on 24 September 2026, and its SHA-256 `77ff329057e17cbad573cc309fce3f69f4ba6b73619c4ca203a4ed79a1cb790e` and MD5 reproduce the recorded values, so this is the document the extraction read.

## How the attack was run

- **The paper.** Three checkers split the printed pages: 943–953, 953–960 and 960–966. Each read its range in the text layer and checked every formula it relied on against the page images, at higher resolution where the text layer drops bars, primes and signs. Each checked every item in its range for statement, hypotheses and locator, and matched every numbered result of the paper to items.
- **The libraries and the atlas.** A fourth checker:
  - opened every library declaration at the pins;
  - read the whole Tau Ceti elliptic formal-group directory;
  - read every planned stage and the relevant coverage rows;
  - searched both libraries for everything marked missing.
- **Duplication and routing (done myself).**
  - Searched every other extraction's routes, the new roadmaps and all atlas stage descriptions.
  - Read `make_queue.py`'s design-job assembly and the live design issue #1687.
  - Read Agboola–Howard II (arXiv math/0401124v2) at every place BKO cite it.
- **Findings I relied on.** I re-checked each against its quotation: the page image or TeX-equivalent text, the declaration at the pin, the stage text or the other extraction. The three new mistakes in the paper were checked on the page images.

## High findings

1. **`honda-lift` states a false theorem.**
   - The item keeps Lemma 5.1(ii)'s printed signs: type ±X²+p and parameter ∓p for a_{p²} = ±2p.
   - The confirmed erratum E9 reverses them. The paper's own use agrees with E9: on p. 955, a_p = 0 gives a_{p²} = −2p, and Ê ≅ F has parameter −p.
   - Route 2 would be asked to prove the printed version.
2. **Rubin's integral two-variable main conjecture at inert p has no owner.**
   - Theorem 6.1 rests on Agboola–Howard's Proposition 3.3(ii). AH prove it "from Rubin's two variable main conjecture [13, Theorem 4.1(ii)]", at an inert prime.
   - BKO record only AH's interface. Their notes and route 5's brief say the theorem is "shared with CMAllPrimeMainConjectures if that proposed owner is accepted".
   - That route is now accepted. Its brief (from Burungale–Tian) says: "The integral two-variable equality those designs need is not an output here."
   - Castella et al.'s addition to it covers only split p, and no atlas stage plans Rubin 1991.
   - Fix: make it an item and route it once, either to route 5 or as a joined route to CMAllPrimeMainConjectures with an explicit addendum.

## Medium findings

3. **Shared design id.** Route 2's id is shared with PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18 route 8.
   - `make_queue.py` writes one prompt per job id.
   - Design issue #1687 carries only BKO's brief. A regenerated queue would carry only AGHMP's, which is later in `papers.json`.
   - Either way one paper's brief and items are lost. This is systemic: 66 design ids are shared between papers. It needs a maintainer merge.
4. **A built map is not cited.** Tau Ceti has `formalPointHomAdicCompletion` (injective, with image the kernel of reduction). The extraction does not cite it, so routes 2–3 would rebuild the formal-point-to-curve map that §5 uses.
5. **`local-tate-duality` is claimed as planned for more than its stages plan.** BKO's step (Rubin 1987 §5) needs the annihilator theorem for Lubin–Tate Kummer images, which no stage plans. Add it as a missing item.
6. **Hecke L-functions, root numbers and the functional equation** are neither items nor imports. Proposition 3.3(3) and Theorem 3.4 rest on them, and AutomorphicLFunctionsAndLocalFactors AL.1 plans them.
7. **`rubin-cm-lubin-tate` (route 4) re-plans `honda-lift` (route 2)** for the CM curve. Route 4 also has no path to the Lubin–Tate foundation.
8. **L_p ∈ Λ_R, not Λ.** The paper's §6.0.1 writes ξ ∈ U*_∞ and L_p ∈ Λ, but the unit is constructed in U*_∞ ⊗ R (Proposition 3.3). The extraction copies the printed version.
9. **The last step of Theorem 6.1 is unitemised.** AH's local dictionary, (4.2) and Theorem 4.3 appear only inside one catch-all item.
10. **Rubin's L_p is planned twice.** `primitive-elliptic-unit` is Proposition 3.3's ξ_ν at ν = 1, planned again in route 4.
11. **Routes 3 and 4 depend on each other.** Their recorded prerequisites hide this. Moving the late branch (Rubin's L_p) to route 5 makes the graph acyclic.
12. **Quasi-canonical lifts are planned twice.** Two accepted unitary-cycle extractions plan Gross's lifts for general F_0/Q_p. Route 2 should state them at that generality and name those consumers.
13. **Wrong owner.** The supersingular mass formula and Schoof's trace count sit in a Coleman-series Part II. They belong in the direction of Tau Ceti EllipticCurves.
14. **A missing prerequisite.** Agboola–Howard I is not in the prerequisites. AH II's Proposition 3.3 is proved "exactly as in" it.

## Low findings

- **Locators.** Nakayama is used in Corollary 5.6, not Theorem 5.8. Also: signed-free, the AH citations, and the §6 preamble.
- **Stage citations.** mordell-weil-selmer, continuous-cohomology, and the local class field theory import.
- **Uncited library declarations.** Frobenius isogeny, Γ₀ index, Dirichlet with quadratic splitting, flat-to-free over a local ring, the unit filtration, the continuous-cohomology long exact sequence, twists and automorphisms.
- **Missing items.**
  - Planned: the genus and elliptic-point formula of X_0(N) (Tau Ceti ModularForms 10A/10B).
  - Missing: Honda types, with Honda 1970 as a prerequisite.
  - The §§2–3 imports: ray class fields, dual exponential, the Kummer limit, principal units, the class-number bound.
  - Strict and Bloch–Kato Selmer groups.
  - A dictionary with Rubin 1987's normalisation.
- **Three new minor mistakes in the paper**, none affecting anything:
  - the Theorem 5.5(ii) lattice list names one lattice p times;
  - Proposition 3.3(3)'s proof omits the trivial character;
  - Lemma 5.1(i) needs End(Ā) to be a domain.
- **Slips in item statements.** An ill-typed "π x_s" in the Hecke relation; generic-supersingular-count not updated to E1; a misattributed root-number identity.
- **Scope and statements.**
  - AH Theorem 4.1 is not needed.
  - signed-control-equality bundles two AH results.
  - The AH/BKO sign dictionary relabels only the character sets.
  - canonical-character needs the Q-curve existence theorem (Gross, LNM 776).
  - Theorem 6.2 forces h_K = 1.
- **Prerequisites.** Three wrong or incomplete links, and the routes' prerequisite arrays and import titles.

## What held

- **Library items.** All six library items hold at the pins, and their recorded file hashes match.
- **Planned items.** All 15 planned stage references exist and plan their items, except the three noted above.
- **Routing.**
  - Every missing item is routed exactly once, and item ids are unique.
  - The only routed planned item, cm-field-data on source route 1, is allowed by §16.
  - Both Part II areas are galaxy ids.
  - The parent claims hold: ColemanPowerSeries is cyclotomic-only, FiniteFlat R07 has no Lubin–Tate material, ClassFieldTheory excludes Lubin–Tate, AutomorphicPadicLFunctions L3/L3h are ordinary-CM, and ModularIwasawaMainConjectures L6 re-exports other branches.
- **Paper coverage.** Every numbered result of the paper has items, and the multi-part results are split.
- **Recomputations that hold.** Lemma 3.1's numerics, Theorem 5.5(ii)'s trace relations, the N = 27/32 choices and the §6 interpolation formula were recomputed.
- **Citations and errata.** BKO's own citations of AH exist with the content attributed. E1–E10 were not re-reported.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-BURUNGALE-KOBAYASHI-OTA-21.result.json`: ok.
- Lean: none. A red team of a paper extraction has no Lean deliverable.
