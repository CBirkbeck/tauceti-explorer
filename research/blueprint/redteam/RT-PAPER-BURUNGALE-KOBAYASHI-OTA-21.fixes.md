# RT-PAPER-BURUNGALE-KOBAYASHI-OTA-21: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #4979, job
FIX-RT-PAPER-BURUNGALE-KOBAYASHI-OTA-21).
- Findings: `RT-PAPER-BURUNGALE-KOBAYASHI-OTA-21.result.json`.
- Verdicts: `RT-PAPER-BURUNGALE-KOBAYASHI-OTA-21.review.json`. The red team has 27 findings, all
  confirmed. This job applies the fourteen of high or medium severity (1–14), the ones the issue lists.
  Where the verifier adjusted a fix, I applied its version.
- **The low findings (15–27)** are not part of this job. The one piece of them applied here is 21(b),
  xi-signed's trivial-character case, which finding 10's verification asks for.
- **Files changed.** `papers/PAPER-BURUNGALE-KOBAYASHI-OTA-21.result.json`, and
  `papers/PAPER-BURUNGALE-KOBAYASHI-OTA-21.md`, which has a new closing section.
- **Result.** 123 items (6 library, 12 planned, 105 missing) and seven routes. `check_paper.py` reports
  ok.
- **Independence.** I did none of the extraction (Codex), its review (cc-fb70e5), the red team
  (cc-38267a) or the verification (cc-58621d).
- **What I checked.** The Tau Ceti and Mathlib declarations cited, at the pinned index; the atlas
  anchors; PAPER-BURUNGALE-TIAN-26's route 7 key and integral-layer consumers; and the issue states of
  the grouped and per-route design jobs.

## /1 (high, error): honda-lift kept the reversed printed signs: fixed

- **The statement now follows erratum E9:** for a_(p²) = ±2p the Honda type is ∓X² + p and the
  Lubin–Tate parameter is ±p, so a_(p²) = −2p gives −p. It cites E9 by its errata-file id.
- **The note** records the verifier's direct proof without Honda types: [±p]_Â reduces to X ↦ X^q with
  linear term ±p. It also records the regression test a_(p²) = −2p ↦ −p.

## /2 (high, missing): Rubin's two-variable main conjecture at inert p had no owner: fixed (option b)

- **New item rubin-two-variable-main-conjecture:** Rubin 1991, Theorem 4.1(ii), in units form,
  integral, at inert p.
- **A new part-ii route 6** carries it. That route has exactly the key of PAPER-BURUNGALE-TIAN-26 route
  7 (parent ModularIwasawaMainConjectures, roadmap CMAllPrimeMainConjectures, same title, area iwasawa),
  so it joins that design.
- **Its brief** is an addendum to the integral layer. It states the result for p inert and derives it
  from the layer's (i) through 0 → Ē_∞/C̄_∞ → U_∞/C̄_∞ → X_∞ → A_∞ → 0. It names the consumer and
  forbids any dependence downstream of route 5.
- **As the verifier asked:**
  - Option (a) is not used, since it would duplicate the layer route 5 imports.
  - The new item's locator omits "Theorem 4.1".
  - Rubin's Theorem 5.3(iii) is not included.
- **Route 5's brief** names the new item as its import. The stale "pending"/"if accepted" wording is
  removed from the notes of rubin-two-variable-input, elliptic-zeta-class and primitive-elliptic-unit.

## /3 (medium, other): two design jobs for one roadmap: fixed in the file; issue cleanup for the maintainer

The make_queue.py change the red team asked for already happened (commit 7685a59f groups Part II
proposals by parent). Route 2's reason now records that AGHMP route 8 joins the same Part II, and that
grouped job #3355 quotes both proposals.

**For the maintainer.** Retire the stale per-route design and review issues that the grouped jobs
supersede, and drop the matching per-route jobs that `extra_old` keeps in `queue.json`:

| Stale issues | Superseded by |
|---|---|
| #1687 / #1728 | #3355 |
| #1688 / #1717 | #3396 |
| #1689 / #1729 | #3350 |
| #1690 / #1727 | #3338 |

All were open on 30 September.

## /4 (medium, library-claim): Tau Ceti's adic formal-point map was not cited: fixed

- **adic-elliptic-points** now cites `tauceti:WeierstrassCurve.formalPointHomAdicCompletion`,
  `formalPointHomAdicCompletion_injective` and `range_formalPointHomAdicCompletion`.
  - Its statement gains the unconditional injective map for adic completions of a Dedekind domain.
  - The image is written as Tau Ceti states it, {O} ∪ {P : 1 < Valued.v(x(P))}.
  - Its locator is corrected to §5.0.1, (5.1), p.958, and §5.0.2, pp.959. There is no Ê in §5.0.3.
  - Its note no longer suggests that the adic case is conditional.
- **The notes** of primitive-formal-cm-point, modular-quasicanonical-points and optimal-point-system
  cite the map and say how Φ and Ψ′_s are adic completions.
- **Route 3's brief** says that route 3 proves that presentation, because global-local-tower is
  downstream on route 5, and that the map is not rebuilt.
- **Route 2's existing "reuse … adic points" clause** now names the declarations.

## /5 (medium, error): local-tate-duality overstated what is planned: fixed

- **local-tate-duality** is cut back to finite-module pairings and their limits.
- **New item formal-kummer-duality,** missing, on route 3: the Cartier dual of F[π^m], exact
  annihilation of Kummer images, and the norm-limit duality.
- **formal-norm-vanishing** names it in its statement, and formal-points-units-dual in its note, since
  items here carry no prerequisites field.
- **The verifier's alternative,** the general statement in route 2, is recorded in the item's note.

## /6 (medium, missing): Hecke L-functions and root numbers had no owner named: fixed

- **Two planned, unrouted items:**
  - hecke-lfunction, at GlobalNumberFields Layer 9, AL.1 and AN.4;
  - hecke-root-number, at AL.1.
- **The notes** of xi-signed, canonical-sign and twisted-root-sign cite them.
- **Briefs.** Route 3's brief imports AL.1 for xi-signed. Route 4's brief names GlobalNumberFields
  Layer 9 and AL.1.

## /7 (medium, duplicate): the CM formal group re-planned route 2's comparison: fixed, as the verifier adjusted

- **Route 2** gains the general item lt-lift-identification: for any elliptic lift of a reduction with
  a_(p²) = −2p, Â ≅ F with differentials matched and Â[p^∞] ≅ F[π^∞].
- **rubin-cm-lubin-tate** (route 4) is restated as the CM input (Rubin 1987 Lemma 3.1) plus the
  application of that item.
- **Route 4** gains LubinTateFormalModulesAndQuasiCanonicalLifts in its prerequisites and brief.
- **Route 2** does not import the CM input, so the graph stays acyclic.

## /8 (medium, error): ξ(E,Ω) and L_p live over R, not O: fixed; the erratum is for the maintainer

**What changed:**
- **primitive-elliptic-unit:** ξ(E,Ω) ∈ U_∞* ⊗_O R.
- **rubin-lfunction:** ξ = L_p·(v_ε ⊗ 1) defines L_p ∈ Λ_R = R⟦G⁻⟧.
- **signed-main-conjecture:** an equality of Λ_R-ideals, with R = O when the avatar is O-valued.
- **"Scalar extension of L_p"** is removed from cm-discrete-module's note and from route 5's brief.
  Route 4's late paragraph moved with finding 11 and was rewritten over Λ_R.

**For the maintainer.** The printed "ξ ∈ U_∞*" and "L_p ∈ Λ" on p.961 should be recorded as the next id
after E10 in `research/blueprint/errata/PAPER-BURUNGALE-KOBAYASHI-OTA-21.json` (misprint, affects
nothing). That file is not a deliverable of this job, and the extraction has no `sourceIssues` of its
own.

## /9 (medium, missing): the three Agboola–Howard steps were unitemised: fixed

**Three new items on route 5:**
- **ah-local-dictionary:** AH (3.2) and Proposition 3.4. Theorem 5.8 becomes AH's Conjecture 3.5, and
  the labels carry over unchanged.
- **ah-conditional-equality:** AH (4.2). Its inputs are (3.3), Theorem 3.6, Proposition 3.3(i)–(ii) and
  Conjecture 3.5, not Theorem 4.1.
- **ah-elliptic-unit-generator:** AH Theorem 4.3. Its interpolation set is the nontrivial χ ∈ Ξ^ε in
  BKO's labels, with the involution δ_χ ↔ δ_(χ^(-1)) and the period change from Ω_E to Ω stated, over
  Λ_R.

**Other changes.** ah-hypothesis-translation is narrowed to the p ∤ h_K extension of these three, and
route 5's brief names them.

## /10 (medium, duplicate): primitive-elliptic-unit rebuilt ξ_1: fixed

- **primitive-elliptic-unit** is now ξ_ν at ν = 1 (xi-nu). Its formulas come from xi-trivial-value and
  xi-character-value at ν = 1, together with two Euler-factor identities:
  - L_f(φ̄,1) = L(φ̄,1);
  - L_(pf)(φ̄χ,1) = L(φ̄χ,1) for χ ≠ 1, since p ∤ h_K.
- **Its sign** comes from xi-signed, which now includes the trivial character when W(φ) = −1, as the
  verifier asked (this is finding 21(b)).
- **Its note** drops "distinct … removal of Euler factors" and keeps the p.961 sign-correction remark.
- **Coefficients** are R, as in finding 8.

## /11 (medium, error): routes 3 and 4 depended on each other: fixed

- **Moved.** primitive-elliptic-unit, rubin-lfunction and rubin-interpolation moved to route 5, with the
  late paragraph rewritten there. Route 5's brief names what they import from routes 3 and 4.
- **Route 4:**
  - it is retitled "Ray-class distributions and general automorphic constructions, Part II: nonordinary
    CM special values";
  - its brief loses the LATE paragraph and the "Do not impose a circular dependency" sentence;
  - its reason is updated.
- **Route 3** gains NonordinaryCMSpecialValues in its prerequisites. The graph is 4 → 3 → 5 and 4 → 5,
  plus 2 → 4 from finding 7, which is acyclic.
- **The report's early/late explanation** is superseded by its new closing section.

## /12 (medium, duplicate): quasi-canonical lifts had several owners: fixed in route 2; imports for the maintainer

**Route 2 now covers both quadratic types.** Following the verifier, quasicanonical-lift,
quasicanonical-field, ringclass-local-tower and route 2's brief now state the theory for a finite F_0/Q_p
and F/F_0 quadratic, unramified or ramified:
- height-2 formal O_(F_0)-modules with CM by O_F;
- End = O_(F_0) + ϖ^s O_F;
- a ring class field extension of degree [O_F^× : (O_(F_0) + ϖ^s O_F)^×], that is q^(s−1)(q + 1) or q^s;
- Gal(Ψ′_∞/F) ≅ O_F^×/O_(F_0)^×.

BKO's case (F_0 = Q_p, F = Φ unramified, degree p^(s−1)(p + 1), Z_p × Z/(p + 1)) is kept explicitly. The
brief names UnitaryKudlaRapoportCycles and GrossZagierAndArithmeticHeights GZ.7 as consumers.

**For the maintainer.** One owner, route 2's LubinTateFormalModulesAndQuasiCanonicalLifts. The following
should import these lifts rather than build them:
- PAPER-LI-ZHANG-22-B/59;
- PAPER-HE-LI-SHI-ETAL-23/18;
- PAPER-LI-LIU-22/27;
- PAPER-GROSS-ZAGIER-86/324.

## /13 (medium, other): supersingular counts were in the wrong roadmap: fixed

- **Moved.** supersingular-mass moved to a new part-ii route 7: parent tauceti:TauCetiRoadmap/EllipticCurves,
  roadmap EllipticCurvesPartIISupersingularFiniteFields, "Elliptic curves, Part II: supersingular curves
  over finite fields", area arithmeticgeometry. It joins the open grouped design job #3398.
- **Its brief** covers:
  - Deuring's F_(p²)-rationality;
  - the count [p/12] + ε_p = m + δ + ε;
  - Aut(E) and the twists over F_(p²);
  - Schoof's values, checked in all four classes mod 12.
- **Route 3** imports it by title and id, lists it in its prerequisites, and keeps Lemma 5.2's own counts.
- **scalar-frobenius stays on route 3.** The verifier only suggested considering a move, and honda-lift
  depends on Lemma 5.1(i).

**For the maintainer.** Deuring's classification of endomorphism rings (PAPER-GROSS-ZAGIER-86/128)
belongs next to this material.

## /14 (medium, missing): Agboola–Howard I was not a prerequisite: fixed

- **Added:** Agboola–Howard, Ann. Inst. Fourier 56 (2006), 1001–1048, doi:10.5802/aif.2206. The why
  field says AH II prove Proposition 3.3 as AH I's Lemma 1.1.9 and Proposition 2.4.16 (numbering in arXiv
  v4), transferred to inert p.
- **Added, optional:** Pollack–Rubin, Ann. of Math. 159 (2004), doi:10.4007/annals.2004.159.447. BKO's
  analogue of AH Proposition 3.1 comes from Rubin 1987, already a prerequisite.
- **Corrected:** AH II's pages are now 611–622, as Crossref gives them.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BURUNGALE-KOBAYASHI-OTA-21.result.json`:
  ok.
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.
- The JSON keeps the file's own formatting (indent 2).
- No Lean was compiled.
