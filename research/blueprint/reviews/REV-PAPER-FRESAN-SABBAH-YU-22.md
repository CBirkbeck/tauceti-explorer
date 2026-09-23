# REV-PAPER-FRESAN-SABBAH-YU-22 — review of the extraction of Fresán–Sabbah–Yu, *Hodge theory of Kloosterman connections*

**Verdict: accept. All six routes accepted, coverage effectively complete, all seven recorded mistakes confirmed verbatim, nothing corrected in place and nothing added.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Extraction under review: issue #1316, claimed by `cc-7b31c4` and then `cc-442dc5` — 92 items (2 library, 10 planned, 80 missing), 6 routes, 7 `sourceIssues`, status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Duke Mathematical Journal **171** (2022), no. 8, 1649–1747, [doi:10.1215/00127094-2021-0036](https://doi.org/10.1215/00127094-2021-0036), read in [arXiv:1810.06454v5](https://arxiv.org/abs/1810.06454v5) (13 June 2022), which the authors label "Final published version".

## Provenance — both hashes match, byte for byte

- e-print `1bc7711151279a63e6f4ab21afc9d33b7c042381d6b65eb9f5ff1e6a0f288d44` ✔ — `kloosterman-revised10_published.tex` (3323 lines), `kloosterman-revised10.sty` (339 lines), `.bbl`, exactly as recorded.
- PDF `835580aa6314798e2866c248d6f7179379698d61a7baae0136806d4755b1f20a` ✔, **74 pages** taken from the page tree's `/Count`.

A clean case, and worth contrasting with the Cambridge-published papers (HKW-22, BIP-23, VANHOFTEN-24) whose recorded PDF hashes can never reproduce because each download is watermarked with the downloader's IP and a timestamp. Here the arXiv PDF is stable and the record is exactly reproducible.

## 1. Numbering — two traps at once, and the second one caught me out

Every statement environment is declared `[equation]` in the style file, with `\numberwithin{equation}{section}`, so **statements and displays share a single counter**. That much is familiar. The second trap is not:

> **`kloosterman-revised10.sty:19` sets `\mathtoolsset{showonlyrefs}`.** Only equations that are actually `\eqref`'d somewhere receive a number at all.

Counting every `\begin{equation}` therefore over-counts, and because the counter is shared, *every statement number after the first unreferenced display is wrong*: my first simulation ran **3 too high by the middle of §4** and 2 too high in the appendix. Simulating instead with the rule "a display consumes a number iff one of its labels appears in a `\ref`/`\eqref` elsewhere" gives **144 numbered objects = 58 statements + 86 numbered displays**, and then:

> **58 simulated statements against 58 printed headers: every number appears in both lists, and every kind agrees. Zero discrepancies.**

**This corrected two objections of mine, not the extraction's work.** On the broken count I had "E2 cites Proposition 4.20 but 4.20 is a Lemma" and "E7 cites Example A.27 but A.27 is an equation". Both extraction locators are right: the statement at `main.tex:1291` prints as Proposition 4.20 (`published.txt:1766`) and the example at `main.tex:3223` prints as Example A.27 (`published.txt:3951`). Recorded here so the next reviewer checks the style file first.

## 2. Coverage — the best I have seen in this programme

**All 92 items carry a statement-level locator** — no item falls back on a section-level or "imported foundation" locator. **57 of the 58 numbered statements are cited.** The single exception is **Remark 3.7**, a degenerate-case observation (for $k=n=1$, $\coH^1_{\mathrm{mid}}(\Gm,\Kl_2)$ vanishes by a change of variables). No gap.

## 3. Mechanical audits — all clean

- **146 hand-written word+reference citations, no mismatch** between the introducing word and the environment carrying the target label. The paper uses **no cleveref** (0 `\cref`/`\Cref` against 294 `\ref`), so this failure class was live here, and it is the audit that found unrecorded mis-citations in the GWZ-20-B, CCM-23 and BIP-23 reviews.
- **No duplicate labels, no undefined references, and no `??` anywhere in the 74-page PDF.**
- A `showonlyrefs`-specific hazard, checked because this paper is exposed to it: plain `\ref` does not mark an equation as referenced, so a display cited only that way prints as `??`. **Of the 92 display labels, 87 are `\eqref`'d, 5 are never referenced (and so correctly carry no number), and none is referenced only by a plain `\ref`.**

## 4. Statuses — 13 library citations, all verified

`baseline` pins mathlib at `082e2d3` and TauCeti at `f790474`, and records the citations in a `note` rather than a `declarations` array (unlike VANHOFTEN-24's 23 entries — a thinner record, but a checkable one).

- **Mathlib, all four at their recorded lines**: `DirichletCharacter` (`NumberTheory/DirichletCharacter/Basic.lean:40`), `legendreSym` (`NumberTheory/LegendreSymbol/Basic.lean:109`), `riemannZeta` (`NumberTheory/LSeries/RiemannZeta.lean:121`), `Complex.Gamma` (`Analysis/SpecialFunctions/Gamma/Basic.lean:287`).
- **TauCeti, all nine present** at the pinned commit under `TauCeti/Geometry/Hodge/`: `HodgeStructure`, `HodgeStructureOn.decomposition`, `Polarization`, `MixedHodgeStructure`, the two `Hom` strictness lemmas, `tate`, `tateMixed`, `HodgeStructureOn.tateTwist`.

Only two `library` items for a paper of this size is right: almost everything it needs (mixed Hodge modules, nearby cycles, perverse intermediate extensions, Weil II, rigid cohomology, Weil–Deligne representations) is genuinely absent, and the extraction marks ten of those `planned` against existing atlas layers rather than inventing items for them.

## 5. Routes — six accepted, and the two `new` roadmaps hold up

A `new` roadmap is the strongest claim a route can make, so I checked both against the whole atlas.

- **`MixedHodgeModulesAndIrregularHodgeTheory` (25 items).** Of the 211 atlas roadmaps, **none** mentions "mixed Hodge module", "irregular Hodge", "exponential motive" or "twistor" in title or summary; the only titles sharing vocabulary are p-adic Hodge theory roadmaps, a different subject. No other paper in the corpus proposes a competing identity. Justified.
- **`KloostermanMomentsAndPotentialAutomorphy` (46 items).** Already **adopted downstream**: PAPER-XU-ZHU-22 (*Bessel F-isocrystals for reductive groups*) routes three items to this same roadmap and cites this extraction by name as its originator. That is the best possible evidence that the identity is right.
- The four `source` routes cite **stage ids that all exist** in the atlas: `ML.2`, `RD.6`, `RD.7`, `LPV.2`, `R01.2`.

## 6. Findings — seven, all confirmed, and all of them substantive

Seven `misprint` entries, every one `affects: nothing`, for a 99-page Duke paper. That looked thin, so I verified each against the source *and* re-derived its reasoning, and read around them for more. All seven are real, and several are sharper than "misprint" suggests:

- **E1** (§3.2.1, line 871): `\Gm^{kn}` where the object named is $\wtKl_{n+1}$ and the shift is $[n]$. The exponent must be $n$ — the $k$-fold power arrives only in the next sentence.
- **E2** (proof of Proposition 4.20, lines 1321–1322): "are the $\wtrN^\ell\rP_k$", where the *next sentence* lists the pieces as $\gr^W_{2j}$ for $0\le j\le k-1$, so the primitive part is $\rP_{k-1}$.
- **E3** (§5.1.1, lines 1639–1640): the roots of $M_k(p;T)$ are Weil numbers of weight $k+1$, so $|\alpha|=p^{(k+1)/2}$; the printed involution $\alpha\mapsto p^{(k+1)/2}\alpha^{-1}$ produces something of absolute value $1$, which is not a root of $M_k$ at all. The self-duality is $\alpha\mapsto p^{k+1}\alpha^{-1}$.
- **E4** (§5.1.2, line 1659) is the sharpest. The `align*` above it gives three facts, and the text cites "the first two" to conclude that $\partial g_1/\partial z_1$ does not vanish on $(z_r)$ — but the **third** fact is precisely $(\partial g_1/\partial z_1)\cap(z_r)=(1+z_2+\cdots+z_2\cdots z_{r-1})$, which is non-empty. The correct argument uses the *last two* on $(g_1)\cap(z_r)$, where a vanishing derivative would force $1=0$. The chart's boundary is $(z_1\cdots z_k)$, not $(z_1\cdots z_r)$.
- **E5** (Corollary 5.30, lines 2381–2388): I checked the constant. For odd $k$ the Hodge set $\{2,4,\dots,k-1\}$ is stable under $p\mapsto k+1-p$, so the $m$ classes form $m/2$ conjugate pairs, Serre's $\Gamma_V$ is $\prod_{j=1}^m\Gamma_\RR(s-j)$, and since $\Gamma_\RR(s-j)=\pi^{-(s-j)/2}\Gamma((s-j)/2)$ the printed formula drops exactly $\pi^{m(m+1)/4}$. The finding is also right that the introduction's $\Lambda'_k$ carries the same normalisation, so the omission is self-consistent and the functional equation is untouched.
- **E6** (Example A.3, lines 2893–2895): `$\Hm i^*\pQQ_U^\rH=\cH^0\Hm i^*\pQQ_U^\rH$` should be `[-1]` and `$\cH^{-1}$`. The companion $i^!$ formula five lines later is shifted correctly, which settles it internally.
- **E7** (Example A.27, line 3242): "noting that $(tg)_*\circ i_{\KM,*}$ is the zero map", where the conclusion drawn is $\coH^r_{\Afu_t\times\KM}(\Afu_t\times V)$ — exactly what that composite produces. What vanishes is the *function* $tg$ on $\Afu\times\KM$, since $\KM=g^{-1}(0)$.

**Nothing added.** I re-derived the paper's own numeric bookkeeping looking for more: Theorem 1.8's Hodge numbers sum to $\lfloor(k-1)/2\rfloor-\delta_{4\ZZ}(k)$ in both parities (odd $k$: $(k-1)/2$ values of $p$; even $k$: $2\lfloor(k-1)/4\rfloor$, since $p\neq q$ always and the pairs are counted twice); the factorisations $Z_k=(1-T)M_k$ and $Z_k=(1-T)R_kM_k$ have degrees that reduce to $\dim\coH^1_{\mathrm{mid}}$ at good primes; and the even-$k$ parametrisations $k=2m+2$, $k=2m+4$ agree with $m=\lfloor(k-1)/2\rfloor-\delta_{4\ZZ}(k)$ and give an even $m$, as the text claims. All consistent.

## What I did not do

I did not re-derive the appendix's mixed-Hodge-module theory or §4's Hodge-filtration computation from first principles; the confirmations are of what is printed, of the internal consistency of the displays, and of the arithmetic the findings turn on. Page-level quotations from the PDF are reconstructions from a pure-Python text extractor, and where a point could be settled in the TeX I settled it there and say so.
