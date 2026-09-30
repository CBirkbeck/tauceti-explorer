# REV-RT-PAPER-ANDRE-18-B — verification of the red-team findings on PAPER-ANDRE-18-B

**Verdict: all six findings are confirmed, at the severities the red team gave: one high, three medium and two low.**

Every fix needs a small adjustment, and each reason in `RT-PAPER-ANDRE-18-B.review.json` states the corrected fix. Two corrections to the evidence matter for the remedy:
- **/1:** the PerfectoidSpaces P0 packet is *not* accepted. Its review is a "needs_changes" checkpoint, so its A.4 nodes can still be added there.
- **/4:** the Hochster–Huneke 1992 title is wrong.

- **Verifier:** Claude Code, session `cc-58621d`, 30 September 2026 (issue #4331).
- **Independence.** This verifier took no part in any of the three jobs:
  - the red team, RT-PAPER-ANDRE-18-B (Claude Code, `cc-f805bf`, #4332);
  - the extraction (ChatGPT, Codex and Claude Code sessions, #2188);
  - its review, REV-PAPER-ANDRE-18-B (Codex `codex-c83e7a`).
- **Disclosure.** This session reviewed PAPER-BHATT-18, whose route 9 finding 3 cites only as coalescing with route 1. It also co-wrote PAPER-KEDLAYA-LIU-15, which no verdict here relies on.

**What was checked.**

- **The sources.**
  - André, *La conjecture du facteur direct*, Publ. Math. IHÉS 127 (2018) 71–93, Numdam PDF (`34da107d…7053`, the red team's hash). Page images for pp. 76–78, 81, 82 and 92.
  - The companion, *Le lemme d'Abhyankar perfectoïde*, Publ. Math. IHÉS 127 (2018) 1–70 (`08752143…f96a`).
  - Stacks Project tag 0912.
  - Crossref, for Hochster–Huneke 1992.
- **The records.**
  - The extraction and its review.
  - PAPER-ANDRE-18 and its review; PAPER-BHATT-ETAL-23 and PAPER-BHATT-18.
  - RT-AREA-padic-1 and its fixes.
  - The PerfectoidSpaces--P0 and AdicSpacesPartII packets.
  - `research/blueprint/queue.json`, `make_queue.py`, and issues #670, #973, #3361, #3479 and #3480.

`python3 scripts/check_redteam.py` reports `ok` for the result and this review.

## Ownership (/1–/3)

**/1 (high): confirmed.** Fourteen items on the main proof path are planned nowhere:
- **Route 2:** the six A.4 almost-purity items. The P0 packet's "almost purity" hits are all the almost purity theorem, and no node states Lemma A.4.1.
- **Route 6:** the seven §1.2 Weierstrass items. AdicSpacesPartII's "Weierstrass" nodes are classical Weierstrass division and Weierstrass domains, not André's unit-ball package. The route's reason also rests on the companion's route to R0, which its review rejected.
- **Route 3:** `coordinate-tower-perfectoid`. Also, P1's cyclotomic node covers only ℚ_p^cycl, where André needs Frac W(k) for any perfect k.

Adjustments:
- The A.4 items may join route 1 only in its early purity prefix, since route 4 consumes `almost-pure-left-factor`. Alternatively, add them as nodes to the still-open P0 packet, as §17 allows.
- The Weierstrass items join route 4 as its first layer, which is frontier-safe. `uniform-banach-algebra` becomes planned at R0/R3.
- `cyclotomic-perfectoid-field` stays planned at P1, whose stage text covers it, with a request to generalise the node.

**/2: confirmed.** Companion Corollaire 2.9.3, Exemples 3.2.3 and §4.2.3 are used on pp. 79 and 88. Their only routes were rejected, and RT-AREA-padic-1's fix does not name them. Adjustments:
- Since no extraction links another paper's items as dependencies, add three missing items on route 4, with the companion's locators, and make the four consumers depend on them.
- Treat all six companion gaps alike in route 4's brief.

**/3: confirmed.** Big and balanced CM predicates and splinters are planned twice: here on route 1, and in Bhatt et al. (2023) route 10 in module form. (There are cross-references between the two files, but none on these predicates.) Owning them in DirectSummandsAndBigCohenMacaulay's first layer is acyclic. The adjustment:
- Bhatt et al.'s three items move to a route with the *same* key as route 1, so that the three extractions (with Bhatt 2018's route 9) coalesce. "Marking them as imports" has no meaning in the protocol.
- Route 1's brief states the predicates for modules and adds "regular rings are splinters".

## Mathematics (/4–/6)

**/4: confirmed.** Theorem 0.7.1 rests on the equal-characteristic existence of balanced big CM algebras, both directly (p. 75) and inside the reduction (p. 87). No item states it. Three corrections:
- **The citation.** It is Hochster–Huneke, *Infinite integral extensions and big Cohen–Macaulay algebras*, Ann. of Math. 135 (1992) 53–89, doi:10.2307/2946563.
- **A sharper example.** Take B = Z_p[[x, y]]/(px, py). Its only minimal prime of maximal dimension is (p), of characteristic p. In Z_p[[x]]/(px) one can instead choose P = (x), so that example does not force the equal-characteristic case.
- **An existing statement.** The characteristic-p half is also PAPER-BHATT-ETAL-23/plus-completion-cm.

The equal-characteristic splittings become dependencies of `unramified-reduction`.

**/5: confirmed.** Step (a) of Theorem 2.5.2 is a sketch: flatness over each polydisc B_r does not pass to the non-affinoid A_j0 without an argument. The repair checks out step by step:
- **Torsion-free.** The §1.2.1 argument works because multiplication by f_ik is isometric (§2.4).
- **Noetherian and complete.** C is Noetherian and ϖ_j-adically complete.
- **Flat reduction.** C/ϖ_j is free by (b).
- **Flat truncations.** Tor₁ over A/ϖⁿ is ker(ϖ)/ϖ^{n−1} = 0, so each C/ϖ_j^n is flat over A°_j0/ϖ_j^n.
- **The limit.** Stacks 0912 then makes C flat over A°_j0.

So (a) is true, and "gap, affects nothing" is right.

**/6: confirmed.** Corollary 2.6.1 holds for all j, k ∈ ℕ ∪ {∞}, including (∞, ∞), which is what its proof proves (pp. 78, 82).

## What becomes a fix job

The four high and medium findings (/1–/4) will be queued as FIX-RT-PAPER-ANDRE-18-B, with the adjustments above. Under §17, only high and medium findings become a fix job; the two low findings are confirmed here, with their fixes, for whoever next edits the extraction.

For the maintainer:
- the P0 packet is still open, so the A.4 nodes can go there (/1);
- DESIGN-SchemeAndStackFoundationsPartII (#3361) and DESIGN-DirectSummandsAndBigCohenMacaulay (#3479) should know that the predicates move to the latter (/3);
- PAPER-ANDRE-18 has no accepted route, so this file now plans the companion results it uses (/2).

No Lean file is a deliverable, and no Lean was run.
