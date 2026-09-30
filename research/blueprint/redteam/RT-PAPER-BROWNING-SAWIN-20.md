# Red team: PAPER-BROWNING-SAWIN-20 (Browning–Sawin, *A geometric version of the circle method*)

Job `RT-PAPER-BROWNING-SAWIN-20` (issue #4085), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-BROWNING-SAWIN-20.result.json`, in the format of PROTOCOL section 17.

**Result:** 13 findings, 2 medium and 11 low. None is high. The mathematics of the extraction stands. Where it breaks is at its edges:

- owners that other roadmaps or later extractions also claim;
- one hypothesis the review added;
- two small inputs with no item;
- bookkeeping.

## Independence

- **Who did the work.** The extraction is by Codex sessions a71f92 and c83e7a and Claude Code cc-442dc5 (issue #1125). The review is by Claude Code cc-39fac3 (issue #1126). `cc-f805bf` appears nowhere in the target files, and no errata record exists for this paper.
- **Disclosure.** This session wrote:
  - PAPER-DELIGNE-74 and PAPER-DELIGNE-80, whose routes go to FF.2, LPV, DWP and WC;
  - FIX-RT-AREA-finitefields, on the FF stages;
  - FIX-RT-AUDIT-07, the ExponentialSumsAndCircleMethod audit.

  It also red-teamed BERGSTROM-FABER-PAYNE-24.
- **Findings that touch that work:**
  - Findings 2 and 4 concern owners at FF.2. Finding 4 cites Deligne 80's Artin–Schreier item, which already agrees with this extraction.
  - Finding 1 cites FF.3 packet nodes.
  - Finding 11 concerns ES stages.

  None of them asks for a change to this session's own files.

## What was read

- **The version of record.** Ann. of Math. 191 (2020), 893–948, from the Annals site, fetched 30 September 2026. Its SHA-256, f20c87e3…3c53, equals the review's.
  - I read all 56 pages against the 149 items.
  - The Annals page links no erratum, and Crossref records no update.
- **The preprint.** arXiv:1711.10451 v3 (19 February 2020) is the latest of three versions. Its hash, 4518f888…9072, equals the extraction's.
- **Katz–Sarnak, Theorem 11.4.9.** I read it on its page image (book p. 334) from the author PDF that the extraction hashed.
- **The rest of the repository.** Every planned layer and every library declaration cited, at Mathlib 082e2d3 and Tau Ceti f790474, and the atlas, the packets and the other paper extractions that plan the same mathematics.

## What holds up

- **The published statements.** Every numbered statement is an item with the published hypotheses and locator.
- **Re-derived by hand:**
  - the minor-arc arithmetic: B(m) = 2dn − 4qδ + 4(r+1), the counterexamples in E1 and E2, and the conservative range i > −4(tδ − (k−1));
  - the §3–§4 proofs: linearity in λ in Lemma 3.3, both parities of Lemma 4.2, the rank N₁ ≥ 6 and the algebraic Goursat step;
  - the §6 lattice argument;
  - the §7 Möbius, Euler-product, Hilton and generating-function computations.
- **The compact-open counterexample** to Lemma 7.2 and Conjecture 7.1 (E28, items 120–136 and 149) is right.
- **Library citations.** All exist with the stated statements.
- **Source issues.** 45 of the 46 are genuine and distinct.

## Findings

| # | Severity | Kind | Where | What |
|---|---|---|---|---|
| 1 | medium | duplicate | item 147 (review), route 7 | ζ over F_q[t] and its Euler product are sent to a topology Part II. FunctionFieldArithmetic FA.5 already planned Euler products by closed-point degree, and the FF.3 packet now counts irreducibles. The review's "no atlas stage" is false. |
| 2 | medium | duplicate | items 48–49, route 2 | Lang–Weil goes to FF.2 here (and is now packet node FF.2/lang-weil-estimate). Bright–Newton 23 and Harpaz–Wittenberg 16 route it to WC.5. It needs one owner. |
| 3 | low | duplicate | item 3, route 7 | PConf_m and Conf_m are also planned by Ellenberg–Venkatesh–Westerland 16 and Wood 19 under InverseGalois. |
| 4 | low | duplicate | items 6 and 113, route 2 | The Artin–Schreier sheaf is also routed by Abe 25 to a Part II of LefschetzPencilsAndVanishingCycles. |
| 5 | low | duplicate | route 6, item 34 | Universal hypersurface monodromy is also routed by Lawrence–Venkatesh 20 to MordellLawrenceVenkateshPartII. |
| 6 | low | error | item 34 (review) | The review added "p odd". Katz–Sarnak 11.4.9 holds on every geometric fibre over Z[1/ℓ], and the route brief already says so. |
| 7 | low | missing | items 87 and 89, Lemma 7.4 | The Frobenius cycle type of a squarefree polynomial is the multiset of its factor degrees. It has no item, although Tau Ceti has it (FrobeniusOrbits.lean). |
| 8 | low | missing | items 58 and 63 | The auxiliary primes need Dirichlet (and quadratic reciprocity). Mathlib has both. Corollary 2.9 never chooses ℓ: a new source issue. |
| 9 | low | other | E46 and E35, E38 and E43 | E46 duplicates E35, and both are in REGISTER.md. E38 claims non-emptiness that fails for n = 2. |
| 10 | low | other | sourceVersions | It is missing, although eight issues affect a stated result. |
| 11 | low | error | route 1 | polynomialbox belongs at ES.5. polardimension belongs with the dimension theorem in the geometric Part II. |
| 12 | low | library-claim | items 66 and 72, route 5 | Mathlib's `RatFunc.CompletionAtInfty` and `inftyValuation` and FunctionFieldArithmetic FA.2 are ignored. The brief points to LaurentSeries instead. |
| 13 | low | other | the .md report | The headline counts are pre-review (136 items). The JSON has 149. |

### The medium findings

**Finding 1: the zeta function of F_q[t].**

- **The paper.** Lemma 7.4 (p. 943) writes the squarefree character sum as a product of zeta functions ζ_{F_q[t]}(ks)^{e_k(N)}.
- **The item.** The review added item 147 for these Euler products and sent all of it, as missing, to ConfigurationSpacesAndRationalLoops, a Part II of algebraic topology.
- **What already plans it.** The Euler product over monic irreducibles and ζ_{F_q[t]}(s) = (1 − q^{1−s})^{−1} are function-field arithmetic.
  - FunctionFieldArithmetic:FA.5 plans "Euler products by closed-point degree" and the curve zeta function. The stage text was in the atlas at the review's commit.
  - The FiniteFieldsAndCharacterSums packet now has Gauss's formula and the count of irreducibles.
- **The fix.** Mark part (1) as planned there. Keep only the weighted squarefree identities with configEuler.

**Finding 2: Lang–Weil has two owners.**

- **This extraction** was accepted first, and sends Lang–Weil to FF.2, where the packet now plans it.
- **Two later extractions** send the same estimate for geometrically irreducible varieties to WeilConjectures:WC.5: Bright–Newton 23 (the same evening) and Harpaz–Wittenberg 16 (the next day). WC.5 itself covers only smooth projective varieties.
- **The fix.** Name the packet node in items 48–49. Leave a maintainer note re-pointing the other two, or else move the node to WC.5.

### The low findings

- **Findings 3–5: later extractions that duplicate owners set here first.**
  - Configuration spaces: Ellenberg–Venkatesh–Westerland 16 and Wood 19.
  - The Artin–Schreier sheaf: Abe 25.
  - Universal hypersurface monodromy: Lawrence–Venkatesh 20.

  This extraction was reviewed first in every case, so its owners stand. The fixes are notes that the later items import.
- **Finding 6: the review's added hypothesis.** The review restricted the Katz–Sarnak statement to odd p, pending a check. I made the check: Theorem 11.4.9 holds "on every geometric fibre of H_{n,d}[1/l]/Z[1/l]", and its proof uses a sufficiently general Lefschetz pencil, which Weil II 4.4.1 provides in characteristic 2. The item should state the source's theorem, as the route brief already does.
- **Finding 7: the Frobenius cycle type.**
  - Lemma 7.4 uses that the Frobenius of a squarefree f acts on its roots with one cycle per irreducible factor. Its number of cycles is therefore ω(f).
  - Tau Ceti proves this: `TauCeti.FiniteField.natCard_orbit_eq_natDegree_factor` and `exists_orbit_eq_rootSet_factor`.
  - It should be a library item that configtrace and configEuler depend on.
- **Finding 8: the auxiliary primes.**
  - In characteristic 0 the paper picks p with ℓ a quadratic non-residue. That needs infinitely many primes in a residue class, which is Dirichlet's theorem.
  - In characteristic p (Corollaries 1.4 and 2.9), the proof invokes Theorem 1.1 without choosing ℓ of even order mod p. Such ℓ exists, for example ℓ ≡ −1 mod p, again by Dirichlet.
  - Mathlib has `Nat.forall_exists_prime_gt_and_eq_mod` and `legendreSym.quadratic_reciprocity`.
  - The fix adds a library item and a source issue (kind gap, affects nothing).
- **Findings 9–13** are bookkeeping and routing details, each with an exact fix in the JSON:
  - duplicate and inconsistent errata;
  - the missing `sourceVersions`;
  - two items at the wrong ES stage;
  - the carrier for F_q((1/T));
  - stale report counts.

## Leads not filed as findings

- **The ExponentialSumsAndCircleMethod packet** (2026-09-27, partial) never mentions Browning–Sawin, so route 1 (ES.0–ES.1) has not yet been applied. This is the ES packet's gap, not the extraction's.
- **The three sibling AlgebraicTopology Part IIs**, this paper's among them, are already recorded by RT-AREA-topology and RT-PAPER-BENOIST-19.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-BROWNING-SAWIN-20.result.json` reports ok.
- `python3 research/blueprint/intake.py check-files` on both files reports 0 problems.
