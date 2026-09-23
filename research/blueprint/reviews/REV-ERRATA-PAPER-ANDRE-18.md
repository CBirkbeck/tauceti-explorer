# REV-ERRATA-PAPER-ANDRE-18 — review of the mistakes recorded in André (IHÉS 2018)

**Verdict: all 17 findings confirmed. Two are strengthened at the source, one is qualified, none is rejected. No finding was added.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Errata author: Codex, session `codex-hjdg0j` (job `ERRATA-PAPER-ANDRE-18`, issue #1880). I wrote neither the errata files nor the underlying extraction of Yves André, « Le lemme d'Abhyankar perfectoïde », Publ. Math. IHÉS 127 (2018), 1–70. This review adds verdicts to `research/blueprint/errata/PAPER-ANDRE-18.json` and a section to the `.md` beside it; it changes no finding's kind, locator, `printed`, `correction` or `affects`, and leaves the extraction untouched.

## Sources read

| Source | SHA-256 | Extent |
| --- | --- | --- |
| [published, numdam](https://www.numdam.org/item/10.1007/s10240-017-0096-x.pdf) | `087521436778eed56e5bac98f6f2b441bc2898eef35ebba9da1c1575bf00f96a` | pp. 2, 13, 22, 24, 26, 27, 29, 30, 36, 41, 42, 43, 45, 68, 70 |
| [Güntzer 1974, numdam](https://www.numdam.org/item/10.24033/msmf.164.pdf) | `c81847caaf38dea6778e067d2d0389d3922e6528c9350fdd47da59e6220a939a` | printed pp. 116–117 (PDF pp. 17–18) |
| [Crossref record for DOI 10.1016/j.jpaa.2015.07.008](https://api.crossref.org/works/10.1016/j.jpaa.2015.07.008) | — | bibliographic fields only |

Both PDF hashes match the ones the errata file records, so reviewer and author read the same bytes; printed page equals PDF page for André. The Güntzer scan has no usable text layer through the tools available here: its pages are CCITT G4 images, and the statement of Lemma 3.5 falls in the half of printed p. 116 that was not among the page images already extracted. I recovered it from the invisible OCR text layer that the NUMDAM PDF carries beneath the scan (per-page content streams, FlateDecode, rendered with `Tj` operators), and cross-read the visible image of p. 117 for the proof. The earlier searches for an existing correction — Springer, NUMDAM, the arXiv history of 1609.00320, the author page — are recorded in each finding's `searched` list. I re-checked one of them, the [arXiv record](https://arxiv.org/abs/1609.00320), on 23 September 2026: it still lists only v1, of 31 August 2016, so no later preprint version corrects any of these passages. I did not repeat the publisher-side searches and make no independent claim about them; where a finding says `new`, that means no correction was located in a bounded search, not that none exists.

## Method

For each finding I read the published passage at its locator, checked the `printed` text against the page, then checked the `reason` and the `correction` as mathematics rather than as claims: re-deriving the counterexamples (E1, E16), recomputing the valuations (E4), proving the replacement bound (E6), running the printed relations to their consequence (E7), and comparing the paper against itself where it states the same result twice (E2, E5, E13, E17). Where the entry asserts a reach I checked the passages it names, and for E1 I checked the two further invocations it flags. The verdicts and their reasons are in the JSON; the substance of the review is below.

## Per-finding verdicts

| Finding | Kind · affects | Verdict |
| --- | --- | --- |
| E1 uniqueness of a complete spectral norm | error · a stated result | confirmed |
| E2 « cf. 2.2.2 » should be 2.2.4 | misprint · nothing | confirmed |
| E4 norm equality in Exemple prophylactique 3.4.2 | misprint · the proof | confirmed |
| E5 `[1/p]` for `[1/ϖ]` in (2.17) | misprint · a stated result | confirmed |
| E6 lower bound 1 in Lemme 2.6.3's proof | error · the proof | confirmed, and repaired |
| E7 complement index in the Boolean presentation | misprint · a stated result | confirmed |
| E8 ill-typed morphism out of K | misprint · the proof | confirmed |
| E9 untilts are localisations of A, not of A♭ | misprint · the proof | confirmed |
| E10 `B^G` for `(B°)^G` | misprint · nothing | confirmed |
| E11 « d'après (1) » should be (2) | misprint · nothing | confirmed |
| E12 year of the Shimomoto reference | misprint · nothing | confirmed |
| E13 « l'inclusion A → B » in Théorème 0.3.1(1) | error · a stated result | confirmed |
| E14 missing reducedness in Güntzer's Lemma 3.5 | error · a stated result | confirmed (cited source; already corrected in print) |
| E15 the Tate algebra is not that left adjoint | gap · a stated result | confirmed, reach nil |
| E16 injectivity of localisation transitions | error · a stated result | confirmed |
| E17 truncated sentence in §3.4.4 | misprint · nothing | confirmed |
| E18 completion is `H(x)°`, not `A°` | misprint · the proof | confirmed |

**E1.** The wild automorphism exists as described, and because it is discontinuous it is not isometric, so ν and ν∘σ are two distinct multiplicative — hence spectral — norms for each of which C_p is complete; σ is an isometry (C_p, ν∘σ) → (C_p, ν), which is what makes the second one complete. §2.2.4's uniqueness claim is therefore false as printed. The finite-group counterexample the errata job added for the parenthesis of Lemme 2.4.1(2) also survives checking: on B = C_p × C_p with N(x, y) = max{ν(x), ν(σ(y))} the norm is power-multiplicative because each factor norm is multiplicative, B is complete, and the transposition moves (t, 0) of norm ν(t) to (0, t) of norm ν(σ(t)), which differ for some t. I also checked the repair, because a repair that fails would make the entry misleading: requiring each group element to be continuous does recover invariance, since a continuous automorphism carries a spectral norm to an equivalent spectral norm and the spectral radius lim ‖f^n‖^(1/n) is determined by the topology; the transposition above is discontinuous, so the counterexample and the repair are consistent. The invocation on p. 24 is as described, and the one on p. 41 is self-repairing, because the text there also cites the fixed-topology form.

**E6 — strengthened.** The printed bound fails at m = 0 whenever |a| < 1, which is the generic case for a ∈ A°. The replacement is not merely plausible but provable from the hypotheses the lemma already has: power-multiplicativity and submultiplicativity give |ga|^m = |(ga)^m| = |g^m a^m| ≤ |g^m a|·|a|^(m−1), so

$$\Big|\big(g/\lambda\big)^m a\Big| \;=\; |g^m a|\,|\lambda|^{-m} \;\ge\; |a|\left(\frac{|ga|}{|a||\lambda|}\right)^{m} \;\ge\; |a|,$$

using |a||λ| ≤ |λ| ≤ |ga|. So the lemma's conclusion stands with `1` replaced by `|a| > 0`, and the reach — the proof only — is right.

**E14 — strengthened at the source.** The statement of Güntzer's Lemma 3.5, printed p. 116, reads: *Let A be a k-Banach algebra with norm ‖ ‖. Assume that char k = p > 0. Then the following statements are equivalent: (a) f ↦ inf_i ‖f^(p^i)‖^(p^(−i)), f ∈ A, is a norm inducing the same topology as ‖ ‖; (b) there is a power multiplicative k-algebra norm on A inducing the same topology as ‖ ‖; (c) A^p is closed in A.* There is no reducedness hypothesis, while the proof of (c) ⇒ (a) on p. 117 asserts that ‖f‖_i := ‖f^(p^i)‖^(p^(−i)) *is* a k-algebra norm — which fails for a nonzero nilpotent. The omission is not harmless: for k = F_p((t)) and A = k[ε]/(ε²) with the max norm, A^p = k^p is closed in A, so (c) holds, while |ε|² = |ε²| = 0 rules out any power-multiplicative norm, so (a) and (b) fail and the printed equivalence is false. Adding reducedness, as the correction says, repairs it, and no generality is lost where André uses it. This is a defect of the cited source, recorded in André's own footnote 16 on p. 36, which I read verbatim; it is `known`, not new, and must not be counted against the paper under review.

**E15 — confirmed with a qualification.** The adjunction as stated is wrong: continuous K-algebra maps K⟨T⟩ → A correspond to elements of A°, and on A = K the assignment T ↦ ϖ^(−1) is not continuous, so A ↦ A° is the right adjoint. The qualification, which the entry does not record and which matters for planning, is that the reach is nil in practice: the paragraph's mathematical claim is given an independent direct proof immediately before it, and no later passage cites the adjunction as such. A formalisation should take the direct argument and drop the adjunction sentence.

**E16.** Confirmed by a counterexample of my own, since the entry's reason should not be the only evidence for an `error` verdict. Take A = K × K with the max norm, g = (1, ϖ), λ = ϖ, μ = 1. The rational domains are {|g| ≥ |ϖ|}, both points, and {|g| ≥ 1}, the first point only, so A{ϖ/g}^u = A, A{1/g}^u = K, and the transition map is the first projection, which kills (0, 1). Here g is a non-zero-divisor, so that hypothesis does not rescue the printed sentence. The entry's own caveat is also right: multiplication by this g is not isometric, so the restricted reading at the end of its correction is untouched.

**E7, E13, E17 — decided by the paper against itself.** E7's printed relations, imposed for every pair of indices, force all generators equal to one element x with 2x = 1, and with the printed meet relations x² = x, giving x = 2x² = 2x = 1 and then 1 = 0: the presented algebra is zero, not the prescribed Boolean one, so the stray prime is a slip whose repair is forced. E13 is settled by Proposition 5.3.1(2) on p. 68, which the text names as what Théorème 0.3.1 follows from and which asserts only that B is the largest perfectoid A-algebra contained in B′, with no injectivity; part (3) of both statements adds faithfulness of B′ separately, exactly the hypothesis an inclusion would need. E17's sentence is truncated in print — it ends « … remplace l'usage . » — and footnote 19 with Remarque 3.4.5(1) recover what it was to say.

**E2, E4, E5, E8, E9, E10, E11, E12, E18.** Checked individually at their locators and confirmed as printed and corrected; the per-finding reasons are in the JSON. Two are worth singling out. E11's locator is right despite looking suspect: the paper runs two counters per section, so it has both a numbered paragraph 2.5.3 and a Lemme 2.5.3, and the misprint is in the proof of the Lemme, which is where the entry points. E12 I checked against the Crossref record for DOI 10.1016/j.jpaa.2015.07.008, which gives Kazuma Shimomoto, « An application of the almost purity theorem to the homological conjectures », J. Pure Appl. Algebra 220(2), February 2016, 621–632: the printed entry is wrong in the year as well as missing the pages.

## Screened findings

I looked at the three entries in `screenedFindings` and agree with all three screening decisions; none is promoted.

- **E3, the two numbering sequences.** The convention is real and I hit it twice while checking locators: the paper carries both a numbered paragraph and a labelled statement called 2.4.1, and likewise 2.5.3. But independent counters are a numbering convention, not a misprint, and no false statement follows from them; the genuinely wrong cross-references are E2 and E11, both recorded. The author's decision not to promote it, and not to recertify the earlier count of 44 collisions, is the right one. What it does imply is a locator discipline: a reference of the form « cf. X.Y.Z » into this paper must say which of the two objects it means, and the extraction's locators do.
- **`roos-background`** is repository metadata, not an assertion of André's; **`root-localization-T-versus-g`** dissolves because the hypothesis identifies g = T·1. Neither is an erratum.

## Findings added

None. I read the passages around each locator and the two statements of the main theorem (pp. 2 and 68), and found nothing I could certify as a further mistake. The discipline here is the one the job states: confirm only what I checked myself, and add only what I can stand behind. This review is therefore a certification of 17 findings, not a second extraction of the paper; §§4–5 and the appendix were read only where a finding pointed into them.

## Validation

~~~sh
python3 scripts/check_errata.py research/blueprint/errata/PAPER-ANDRE-18.json   # ok
python3 research/blueprint/intake.py check-files \
  research/blueprint/errata/PAPER-ANDRE-18.json \
  research/blueprint/errata/PAPER-ANDRE-18.md \
  research/blueprint/reviews/REV-ERRATA-PAPER-ANDRE-18.md
git diff --check
~~~

No Lean file is required by this review job and no formalisation is claimed. Sixteen findings enter the register as new confirmed mistakes; E14 enters as a mistake in a cited source already corrected in print.
