# REV-RT-PAPER-BURUNGALE-KOBAYASHI-OTA-21 — verification of the red-team findings on PAPER-BURUNGALE-KOBAYASHI-OTA-21

**Verdict: all twenty-seven findings are confirmed, at the severities the red team gave: two high, twelve medium and thirteen low.**

Most fixes need an adjustment, and each reason in `RT-PAPER-BURUNGALE-KOBAYASHI-OTA-21.review.json` states the corrected fix. Two findings have been partly overtaken since they were filed on 24 September:
- **/2:** the Burungale–Tian fix (#4477) gave CMAllPrimeMainConjectures an integral layer. But it names Rubin's two-variable (ii) only for split p, so the inert-prime gap remains.
- **/3:** the queue generator now groups Part II proposals by parent, so the stale per-route design issues are what remain to retire.

- **Verifier:** Claude Code, session `cc-58621d`, 30 September 2026 (issue #1730).
- **Independence.** This verifier took no part in any of these jobs:
  - the red team, RT-PAPER-BURUNGALE-KOBAYASHI-OTA-21 (Claude Code, `cc-38267a`, #1731);
  - the extraction (Codex `codex-a71f92`);
  - its review (`cc-fb70e5`);
  - the errata job (`cc-fb70e5`) and its review (`cc-442dc5`).

  Nor did it take part in any extraction the findings cite: Andreatta–Goren–Howard–Madapusi Pera, Li–Zhang, He–Li–Shi–Yang, Gross–Zagier, Burungale–Tian, Lipnowski–Tsimerman, Li–Liu, Tsimerman, Yuan–Zhang or Castella et al.

**What was checked.**

- **The sources.**
  - Burungale–Kobayashi–Ota, Annals 194 (2021) 943–966, the Caltech copy of the publisher PDF (`77ff3290…790e`, the recorded hash). Page images for pp. 951, 956, 959 and 961.
  - Agboola–Howard II (arXiv math/0401124v2, `8bdbebfa…1b14`) and I (arXiv math/0302319v4).
  - Abbes–Ullmo (Compositio 103, 1996).
  - Crossref, for the prerequisite DOIs.
- **The records.**
  - The extraction and its review, and the errata file with E1–E10.
  - The extractions and reviews the findings cite.
  - `make_queue.py`, `queue.json`, and the design issues #1687–#1690, #3338, #3350, #3355, #3396 and #3398.
- **The atlas.** Every stage a finding cites, with reachability on the atlas `scripts/build.py` assembles.
- **Library claims.** Read at Mathlib `082e2d3` and Tau Ceti `f790474`.
- **Re-derived:**
  - the sign logic of Lemma 5.1 (/1);
  - the Euler-factor identities (/10);
  - the lattice correction (/21a);
  - the supersingular count formula mod 12 (/13).

`python3 scripts/check_redteam.py` reports `ok` for the result and this review.

## The two high findings

**/1: confirmed; the fix stands.**
- `honda-lift` keeps Lemma 5.1(ii)'s printed signs, which the confirmed erratum E9 reverses. The item predates E9 and was never updated.
- Re-derived: φ_q = ±p, so [±p] reduces to the q-Frobenius and Â is Lubin–Tate of parameter ±p, with type ∓x² + p. The paper's own §§2 and 5.0.1 agree.
- The Lubin–Tate half has a direct proof without Honda types, which is a good regression test.

**/2: confirmed, and still open.**
- Agboola–Howard II deduce Proposition 3.3(ii) from Rubin's two-variable main conjecture, Theorem 4.1(ii), at an inert prime.
- The Burungale–Tian fix names only the split case, whereas the units form at an inert prime is what's needed.

Fix: a new item on a route keyed exactly like Burungale–Tian's route 7, so that it joins the CMAllPrimeMainConjectures design, deriving (ii) from the layer's (i) through the class-field-theory sequence. Also drop "Theorem 4.1" from its locator (/23), and update the stale "pending" notes.

## Owners and routes (/3–/7, /11–/14, /16, /19, /20, /27)

- **/3:**
  - The grouped job #3355 now carries both Burungale–Kobayashi–Ota's and Andreatta–Goren–Howard–Madapusi Pera's briefs. So the make_queue.py change is already made.
  - But the old per-route issues #1687–#1690 are still open, beside their grouped successors. Retiring them is a note for the maintainer.
- **/4:** Tau Ceti's `formalPointHomAdicCompletion` is unconditional and injective, with image the kernel of reduction, and it is uncited. Adjustments:
  - Write its image as "x(P) not integral".
  - Say how Φ and Ψ′_s become adic completions.
- **/5:** no stage plans the Kummer-image duality for formal groups. The general statement may sit in route 2 or route 3.
- **/6:** Hecke L-functions, root numbers and the functional equation are owned at GlobalNumberFields Layer 9 and AL.1 (and AN.4 for the ideal sum), but uncited.
- **/7:** the CM Lubin–Tate statement is an instance of `honda-lift`. Keep the CM application in route 4, state the general identification in route 2, and make route 4 import route 2. This is acyclic.
- **/11:** routes 3 and 4 depend on each other, and they now sit in different grouped design jobs. Moving route 4's late branch to route 5 is acyclic.
- **/12:** the duplication is three-way: Li–Zhang, He–Li–Shi–Yang and Gross–Zagier's GZ.7. Route 2 should state quasi-canonical lifts over a general F₀, for both unramified and ramified F/F₀.
- **/13:** Tau Ceti EllipticCurves Layer 3 stops at the dichotomy, and Lipnowski–Tsimerman's finite-fields Part II excludes F_{p²}. So the supersingular counts belong in a new Part II of Tau Ceti EllipticCurves, which would join the open design #3398.
- **/14:** add Agboola–Howard I (doi:10.5802/aif.2206); Pollack–Rubin is optional.
- **/16:** in (c), cite ClassFieldTheory Layers 6–8, since Layer 7's Artin map is not surjective.
- **/19:** Honda's classification and the type determination belong in the new item.
- **/20:** in (e), plan the class number formula at AN.4, since AN.1 was dropped and nothing plans the L(1, χ) bound.
- **/27:** the Manin-constant source is Abbes–Ullmo Théorème A. The prerequisite arrays of routes 2 and 3 also omit roadmaps their briefs import.

## Mathematics and statements (/8–/10, /15, /17, /18, /21–/26)

- **/8:** the Rubin L_p lies in Λ_R, not Λ. The paper itself works over R. The p. 961 misprint belongs in the errata file.
- **/9:** Agboola–Howard's (3.2)/Proposition 3.4 dictionary, (4.2) and Theorem 4.3 are unitemized. Theorem 4.1 is not an input, and Theorem 4.3's condition is the nontrivial χ ∈ Ξ^ε in Burungale–Kobayashi–Ota's labels.
- **/10:** `primitive-elliptic-unit` is ξ_ν at ν = 1; both Euler-factor identities hold.
- **/15, /17, /18:** confirmed. In /18, say that μ equals the PSL₂-index, because −I ∈ Γ₀(N).
- **/21:** three new mistakes:
  - (a) the lattices in Theorem 5.5(ii) need θ, i.e. u_a·T_{s+1};
  - (b) Proposition 3.3(3) omits the trivial character when W(φ) = −1;
  - (c) Lemma 5.1(i) needs End(Ā) to be a domain.

  All three affect nothing, and they belong in the errata file.
- **/22, /25, /26:** confirmed, with small precisions.
- **/23:** drop `relaxed-strict-char` (Agboola–Howard Theorem 4.1 feeds only (4.1)), and split `signed-control-equality`.
- **/24:** the sign dictionary is right. Only statements indexed by characters flip: Theorem 4.3's condition and the ω_n^± of §5 join the list.

## What becomes a fix job

The fourteen high and medium findings (/1–/14) will be queued as FIX-RT-PAPER-BURUNGALE-KOBAYASHI-OTA-21, with the adjustments above. Under §17, only high and medium findings become a fix job; the thirteen low findings are confirmed here, with their fixes, for whoever next edits the extraction. The new mistakes of /8 and /21 go into the errata file.

For the maintainer:
- retire the stale per-route design and review issues #1687/#1728, #1688/#1717, #1689/#1729 and #1690/#1727 (/3);
- choose one owner for quasi-canonical lifts (/12);
- place the supersingular counts, and Gross–Zagier's Deuring item, in a Part II of Tau Ceti EllipticCurves (/13).

No Lean file is a deliverable, and no Lean was run.
