# REV-RT-PAPER-BURUNGALE-TIAN-26 — verification of the red-team findings on PAPER-BURUNGALE-TIAN-26

**Verdict: all 28 findings confirmed, each at the severity the red team gave: 2 high, 14 medium, 12 low.** Seven fixes
need correcting (/2, /3, /5, /6, /8, /15, /27). Several others gain small additions. Each reason in
`RT-PAPER-BURUNGALE-TIAN-26.review.json` states the corrected fix in full.

- **Verifier:** Claude Code, session `cc-2aeb03`, 24 September 2026 (issue #1892).
- **Independence:** this verifier took no part in any of the three jobs:
  - the red team, RT-PAPER-BURUNGALE-TIAN-26 (Claude Code, `cc-72825f`, #2664);
  - the extraction, PAPER-BURUNGALE-TIAN-26 (Codex, `codex-a71f92`);
  - its review, REV-PAPER-BURUNGALE-TIAN-26 (Claude Code, `cc-fb70e5`).

**What was checked.**

- **The sources.** All were read on 150-dpi page images wherever a finding turns on wording or a formula:
  - Burungale–Tian, arXiv 2506.03465v2, SHA-256 `cbb8284a…4664` (the extraction's hash); v1 was compared at Remark 3.6 and
    §1.0.2.
  - Kato, Astérisque 295 (2004), 117–290, from Numdam (`https://www.numdam.org/item/AST_2004__295__117_0/`), SHA-256
    `3c6e14b1…`. It was read at §§8, 12–15, in particular printed pp. 223–243 and 250–267.
  - Johnson-Leung–Kings, arXiv 0804.2828v2, SHA-256 `2af28fc5…`, at Definition 4.1, Theorem 5.2, §5.4 and §7.2.
  - Smith I (arXiv 2207.05674v2), the BKLOS author version, Skinner (arXiv 1405.7294v1), Castella–Grossi–Lee–Skinner
    (arXiv 2008.02571v2) and T. Dokchitser's "Notes on the parity conjecture" (arXiv 1009.5389), fetched 24 September 2026.
- **The records.** The extraction, its report, review and mistake record. The other extractions the findings name:
  PAPER-CASTELLA-ETAL-22, PAPER-BURUNGALE-KOBAYASHI-OTA-21, PAPER-SKINNER-20, PAPER-NEWTON-THORNE-26 and PAPER-DASGUPTA-KAKDE-23.
- **The atlas.** Every stage a finding cites, in `data/atlas.json`, the atlas extracts and `data/decompositions/`. The
  restructurings RS-07, RS-08, RS-16 and RS-30, and their acceptance. `research/blueprint/make_queue.py`, for finding /2.
- **Library claims.** Read at Mathlib `082e2d3` and Tau Ceti `f790474`.

`python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-BURUNGALE-TIAN-26.review.json` reports `ok`.

## High

**/1 (error): confirmed; the fix is right, with three refinements.** Kato excludes the CM case from §13 in so many words.
On p. 226, after Theorem 13.4: "if f has CM, this theorem is not applied because the condition (v) is not satisfied in the
CM case. So the CM case will be discussed separately in §15". §15 opens (p. 250): "we prove the theorems 12.4, 12.5, 12.6,
14.2, 14.5 in the case f has complex multiplication". 15.15 (p. 265) proves 12.4(1) from 13.5, (15.12.2), Rubin's theorem
15.2 and (15.13.1), and 12.4(2)(3) follow by 13.8.

The extraction plans modular-h2-torsion at KatoEulerSystems:L4. The accepted Kato decomposition marks §15 as unread and the
CM case as excluded, and no other stage plans it. As routed, the CM input to Theorems 2.6, 3.1, 1.1 and 1.2 is never
built, so high is right. The refinements:

- 15.15 needs only Rubin's one-sided inequality 15.2(1), not the main-conjecture equality. So `cm-h2-torsion` can sit in
  the early elliptic-unit layer of route 7, ahead of equivariant-main.
- List its other inputs: 15.9 and (15.12.2) (finding /5), 13.5 (a cycle-free import from L4), the ψ-twist (finding /4)
  and freeness of H¹ after localizing.
- State 12.5(1)(2) for CM forms as consequences, including when K ⊂ Q(μ_{p^∞}) (15.14).

**/2 (missing): confirmed; the fix is incomplete.** Three accepted briefs each point at another for the integral
two-variable elliptic-unit main conjecture:

- **BT route 7:** "The integral two-variable equality those designs need is not an output here".
- **Castella route 8:** it "keeps its brief, which already asks for the two-variable elliptic-unit main conjecture".
- **BKO route 5:** "a p-inverted cyclotomic equality is insufficient".

JLK Theorem 5.2 (p. 24) is integral and holds for every prime p. JLK §7.2 itself runs through the integral Corollary 5.3.

There is a further problem the finding did not see. `make_queue.py` appends one design job per accepted Part II route and
deduplicates only against the seven fixed designs. `add()` stores prompts by path. So `DESIGN-CMAllPrimeMainConjectures`
is generated twice, and the later route's brief (Castella's) overwrites BT's. BT's route 7 brief, including the CM Kato
plan, would never reach the designer. The corrected fix adds three things:

- make Castella route 8's brief self-contained;
- ask the maintainer, in the fixes report, to merge coalescing Part II routes into one design job whose prompt carries
  every accepted brief;
- record two points in the integral layer:
  - JLK's p = 2 case rests on Itakura's unpublished preprint (cited on JLK pp. 10–11), a source boundary;
  - JLK p. 26 identifies Rubin's module only "up to torsion", so that comparison must be proved.

## Medium

- **/3 (Kato §15's CM realisations): confirmed; the fix needs four corrections.**
  - Kato's proof of Lemma 15.11(2) (p. 262) begins "By 6.6, 13.5 and (15.9.2)". So the normalised isomorphisms
    (15.11.2)–(15.11.3) must be a route-7 item after the new 15.9 item. Placing them in CM.4 would create a cycle.
  - Only the bare Galois induction of 15.10 may go to CM.4.
  - The λ-adic character of ψ is imported from AutomorphicPadicLFunctions:L0.
  - Irreducibility follows from Brauer–Nesbitt and the distinct infinity types, not a separate Ribet input.
  - Name Shapiro's lemma in (15.12.1).
- **/4 (ray-tower cohomology and twisting): confirmed.** 15.15 applies Rubin's Z_p(1) theorem to twisted coefficients without
  stating the twist. Also:
  - give the new item the same status treatment as etale-iwasawa;
  - update the counts;
  - the point that L3 covers only Z_p^d-extensions is weak, and the real gap is the j_* convention (/12).
- **/5 (Kato Proposition 15.9): confirmed; the fix needs four additions.**
  - State (15.9.1)–(15.9.2) in the new item, and record that the (15.11.3) item depends on it.
  - Put (15.12.2) after (15.12.1).
  - Name Kato 3.8 and Serre–Tate as inputs.
  - Amend BKO route 4's brief as well: it also claims to prove 15.9, so it should import the general statement and prove
    only r = 1.
  - The inverted parenthetical in cm-zeta-bridge is real. Apply its correction once, with /5's text: Kato identifies via
    (15.11.2), and never uses (15.11.3) as an identification (pp. 262–263).
- **/6 (the CM newform): confirmed; one correction.** Kato's predicate is L(f,s) = L(ψ,s) (Remark 12.8, p. 223), and BT use
  it. The atlas has other CM predicates besides ModularForms Layer 9, in accepted routes: NEWTON-THORNE-26/non-cm-condition
  (R16.4) and DASGUPTA-KAKDE-23/265–267 (R19.2). Route the characterisation once, as a source item of R17.5, importing
  these rather than defining another predicate.
- **/7 (exp\* at the centre): confirmed; the fix is right.** H¹_g = H¹_f holds at every p by Kato (14.10.4)–(14.10.5). The
  new item's note should name the decomposition nodes R19.5/potential-semistability… and R19.3/strict-compatibility… on
  which its planned status rests.
- **/8 (Kato §14's inputs): confirmed; the planned citations are incomplete.** Kato's H^q(Z[1/p], ·) is j_* cohomology
  (8.2, p. 180). So (14.9.1) is not the G_{Q,S} sequence that R02.4 plans. The duality-sequence and Euler-characteristic
  items also cite SelmerIwasawaCohomology:L1 and finding /12's j_* item. The j_* Euler characteristic agrees with R02.3's,
  because the local terms at ℓ | N cancel.
- **/9 (specialisation): confirmed; the fix is right.** Cite /12's j_* item, and state the sequences after localizing at
  q_j: for p = 2, Λ is not a product of regular local rings.
- **/10 (the counting input of Remark 3.6(ii)): confirmed; the fix is right.** At j = 1728 there is always exactly one coset,
  since 2i = (1+i)². See the note below on the error-list numbering.
- **/11 (Goldfeld in fundamental discriminants): confirmed; the fix is right.** A direct count to 10⁶ reproduces the finding's
  figures. goldfeld-fundamental should also import the root-number parity of RankZeroOneBSD:BSD.0.
- **/12 (Kato's j_\* convention): confirmed; the fix is right.** No stage plans étale cohomology of Spec O_F[1/p] with j_\*.
  ModularIwasawaMainConjectures L0 describes extension by zero. State the new item for every p, including p = 2.
- **/13 (Smith's method): confirmed; the fix is right.** ST.5 importing the Part II would close a cycle. The coalesced brief
  should also import SelmerIwasawaCohomology L2 and /14's 2-parity item. A maintainer note should say the Part II may need
  retitling.
- **/14 (2-parity): confirmed; the fix is right, and its open point is closed.** Dokchitser's notes, Remark 4.6, credit
  Monsky for p = 2 over Q. Birch–Stephens, already a prerequisite, covers y² = x³ − x.
- **/15 (cm-self-twist's corank claim): confirmed; the fix is incomplete.** bklos-density also needs isogeny invariance of
  Sel_{p^∞} coranks (its note and errata E7). Make it one general item, isogeny-selmer-corank, in route 2
  (SelmerIwasawaCohomology L2). Cite it from cm-corank-double and bklos-density.
- **/16 (bklos-density's CM imports): confirmed; the fix is right.** CM.1 owns the 3-isogeny and the ideal action. Potential
  good reduction comes from EllipticCurves Layer 4 with CM.3 or CM.4, both cycle-free. The corank transfer comes from /15's
  item.

## Low

All twelve are confirmed as low:

- /17 (rational-characteristic over R[1/p] only);
- /18 (congruent-curve's locator);
- /19 and /24 (the stale ray-iwasawa-ring note, and the planned list after RS-16);
- /20 (L(s,f) and L(s,ψ));
- /21 (the base-change identities);
- /22 (analytic-rank);
- /23 (strict-selmer);
- /25 (route 8's title after RS-30);
- /26 (superseded import titles);
- /27 (route 8's reason);
- /28 (two misprints).

Only /27's fix needs correcting. Its new reason ends "neither roadmap supplies or consumes the other", which contradicts
the brief's single-owner rule for p-converse-property. End it instead: "Apart from the shared definition
p-converse-property, which one design owns and the other imports, neither roadmap supplies or consumes the other's
theorems". List Skinner's Theorems A, A′, B, C and E, and update line 45 of `PAPER-BURUNGALE-TIAN-26.md` to match.

## For the fixer

- **Apply these together:**
  - /1, /2, /3, /4 and /5 all rewrite route 7. The order is:
    1. cm-realization (15.8);
    2. the 15.9 item;
    3. the 15.11 normalisations;
    4. (15.12.1) with (15.12.2);
    5. cm-zeta-bridge;
    6. `cm-h2-torsion`;
    7. then the integral and rational layers.
  - /8, /9 and /12 share the j_* item.
  - /13, /14, /15 and /16 all edit routes 2 and 3.
  - /19 and /24; /20, /21 and /22; /25 and /27.
- **Error-list numbering.** /10 and /28 both propose E16. Number the new entries E16, E17 and E18.
- **Counts.** Recompute the item counts in the result's summary and in `PAPER-BURUNGALE-TIAN-26.md` once, after every fix.
  The counts given in the individual fixes assume each is applied alone.
- **Maintainer request (/2).** `make_queue.py` should merge coalescing Part II routes into one design job.
- **An aside, not a finding.** Kato 14.14 (p. 243) says Λ is "a finite product of regular local rings". For p = 2,
  Λ = O_λ[Z/2][[T]] is local and not a domain, so this fails. It is harmless after localizing at a prime not containing p,
  which is all BT use. It may be worth recording in a Kato mistake record if one is made.
