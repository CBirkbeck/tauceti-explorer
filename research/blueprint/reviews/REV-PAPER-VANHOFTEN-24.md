# REV-PAPER-VANHOFTEN-24 — review of the extraction of van Hoften, *Mod p points on Shimura varieties of parahoric level*

**Verdict: accept. All ten routes accepted, no substantive coverage gap, all 34 recorded mistakes confirmed, one item locator corrected in place, one new finding added.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Extraction under review: issue #1360, claimed by `codex-c83e7a` and `cc-442dc5` — 193 items (16 library, 12 planned, 165 missing), 10 routes, 34 `sourceIssues`, status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Forum of Mathematics, Pi **12** (2024), e20, [doi:10.1017/fmp.2024.22](https://doi.org/10.1017/fmp.2024.22), 67 pages, read alongside [arXiv:2010.10496v4](https://arxiv.org/abs/2010.10496v4)'s TeX source (`main.tex`, 2627 lines). **Appendix A is by Rong Zhou** and carries 18 of the 35 findings — worth saying, because it is a self-contained result on connectedness of affine Deligne–Lusztig varieties, and the extraction routes it accordingly.

## Provenance — one hash reproducible, one not, for a reason

The recorded e-print hash is absent from the extraction; I record the arXiv v4 e-print as `f6b56838…` for the next reader.

The recorded published-PDF hash `1f86fdc5…` does **not** reproduce: I get `9a22ab36…`, twice in one session. This is not a discrepancy to file against the extraction. **Cambridge Core watermarks every download** with the downloader's IP address and a timestamp ("Downloaded from … IP address … on …"), so the bytes differ per download and no recorded hash for such a PDF can ever be reproduced by a second reader. The same situation arose in the HKW-22 and BIP-23 reviews. Content checks out: 67 pages (from the page tree's `/Count`, not by counting `/Type /Page` objects), correct title and abstract.

## 1. Numbering — reproduced exactly, and it is an unusual scheme

The paper declares `\newtheorem{Thm}[subsubsection]{Theorem}` and friends, so **statements share the `subsubsection` counter**: a bare `\subsubsection` heading consumes a number just as a theorem does, which is why the paper has numbered paragraphs like "2.2.3" sitting between Lemma 2.2.2 and Lemma 2.2.4. In the appendix the environments (`athm`, `aprp`, `alem`, `eg`, `claimn`, …) share the **`subsection`** counter instead, giving the A1.6 and A3.11 forms.

Simulating both counters gives **146 numbered objects = 80 statements + 66 bare headings**, and it returns the number *and* the kind of every statement the findings cite: 2.1.6, 2.1.7, 2.1.10, 2.1.13, 2.3.9, 3.1.12, 4.1.6, 4.2.3, 4.3.13, A1.6, A3.11. Getting this right required stripping TeX comments first and handling `\appendix`; without the latter the appendix numbering shifts and phantom gaps appear.

## 2. Coverage — and one locator corrected in place

159 of 193 items carry a statement-level locator; the other 22 share the coarse `§§2–4 and Appendix A, imported foundation`, which is honest for imported foundations and is exactly the population of `library` and `planned` items.

At statement level, **78 of 80 statements are cited** (it takes care to count: the locators glue the word to the number, `PropositionA1.6`, so a word-boundary-anchored regex misses every appendix one and under-reports by thirteen). The residue is Proposition 2.2.17, whose content is close to item S08 ("bounded level change is perfectly proper"), and Remark A1.4. No substantive gap.

**The one defect I found in the extraction is a locator.** Item **R02** ("Torsion-free inertia ensures connected fixer") was recorded at `Lemma2.2.3 p12`. The published text has **Lemma 2.2.2**: "If $\pi_1(G)_I$ is torsion free, then $\widetilde{G}_x = G_x$ for all $x$…", which is R02's statement; **"Lemma 2.2.3" occurs zero times in the paper** — 2.2.3 is one of the numbered paragraphs the shared counter produces ("Let $S \subset G_{\breve{\mathbb{Q}}_p}$ be a maximal $\breve{\mathbb{Q}}_p$-split torus…") — and the proof of Lemma 2.2.4 refers back to "Lemma 2.2.2". Off by one, exactly the error the subsubsection counter invites. **Corrected in place** to `Lemma2.2.2 p12`.

## 3. Internal references — clean

294 `\ref`, no `\cref`/`\Cref`: this paper writes its reference words by hand, so the "cited as Theorem, printed as Proposition" class *can* arise here — it is precisely the audit that turned up unrecorded mis-citations in the GWZ-20-B, CCM-23 and BIP-23 reviews. Here it finds nothing: of **216 hand-written word+reference citations, none** names a kind different from the environment carrying the target label. There are **no duplicate labels** and **no undefined references**. (30 further `\ref`s are to equations and sections rather than to numbered statements.)

## 4. Statuses — all 23 pinned declarations verify

`baseline` pins mathlib at `082e2d3` and TauCeti at `f790474`, and records 23 declarations with module, line range, `sha256` and `statementRead`.

- **All 17 TauCeti declarations verify at the pinned commit**: each `statementRead` is **byte-identical** to the source at its recorded line range. The `sha256` is the **whole-module hash**, not a hash of the quoted lines — declarations sharing a file share a hash, and the module hash matches. (Worth recording, since a reviewer who assumes the obvious convention will report seventeen false mismatches.)
- **All 6 mathlib declarations** sit at exactly their recorded lines in a mathlib checkout: `WittVector` at `RingTheory/WittVector/Defs.lean:52`, `DividedPowers` at `RingTheory/DividedPowers/Basic.lean:78`, `CategoryTheory.Comma` at `CategoryTheory/Comma/Basic.lean:71`, `PerfectRing` at `FieldTheory/Perfect.lean:44`, `WittVector.Isocrystal` at `RingTheory/WittVector/Isocrystal.lean:113`, and `WittVector.FractionRing.frobenius` in the same file.

The 12 `planned` items are the right ones to leave planned: Bruhat–Tits smooth stabilizers, affine Weil restriction, pinned root subgroup maps, Dieudonné and nilpotent deformation theory, integral p-divisible group classification, Siegel and PEL good-level moduli, canonical generic Shimura models, Serre–Tate comparison, Witt affine flags, Schubert normality and dimension, reductive isocrystals and σ-centralizers, acceptable Newton classes. Each is a layer the paper assumes wholesale, not a step it proves.

## 5. Routes — all ten accepted, and none invents a sibling identity

Six `source` routes, and **every stage id cited exists in the atlas** (including the three-component `GeometricSatakeAndFusion:GS0:Witt-geometry`). Four `part-ii` routes, all of which reuse identities already proposed by neighbouring papers rather than minting new ones:

| Part II route | also proposed by |
|---|---|
| `HeckeStacksAndLocalShtukasIntegralPartII` | GLEASON-LIM-XU-26, KISIN-PAPPAS-ZHOU-26, ZHU-17 |
| `FiniteFlatGroupsWithTensorsPartII` | KISIN-17, KISIN-PAPPAS-18, KISIN-PAPPAS-ZHOU-26, KISIN-ZHOU-25, ZHU-17 |
| `HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig` | GLEASON-LIM-XU-26, HE-21, KISIN-17, ZHU-17 |
| `ShimuraVarietiesHondaTatePartII` | BOXER-PILLONI-26, FARB-KISIN-WOLFSON-24, GLEASON-LIM-XU-26, KISIN-17, KISIN-MADAPUSIPERA-SHIN-22, KISIN-PAPPAS-18 |

That is the behaviour PROTOCOL §15 wants: joined proposals under recorded parents (`HeckeStacksAndLocalShtukas`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, `ShimuraVarieties`). All ten `suggestedLeanFile` paths are new at the pinned TauCeti commit, so nothing is proposed over an existing file. The division of labour is right, too: Appendix A goes to the ADLV Part II rather than to the Shimura-variety one, because it is an ADLV result.

## 6. Findings — 34 confirmed, one added

All 34 are confirmed and carry `review` blocks. Seven are classified `error`, six `gap`, the rest `misprint`; **18 of the 35 are in Appendix A**. Rather than repeat them all, here are the ones where the verification was not a matter of reading a line back:

- **E7** (gap, Lemma 2.1.13): "$U_y \cap U_{y'}$ is non-empty because $Y$ is connected". Connectedness does not make two opens meet — `Spec k[x,y]/(xy)` is connected with two disjoint opens — so the chain-of-opens repair is genuinely needed.
- **E9** (Lemma 2.3.9): the display at `main.tex:906` has the *same* quotient $[\mathcal{M}^{\mathrm{1-rdt}}_\emptyset / \operatorname{Ad}_\sigma H_m]$ on both sides of its arrow before equating it to $\operatorname{Sht}^{(m',1)}$; the analogous display at `main.tex:899` correctly carries $L^{m'}\mathcal{G}_\emptyset$ in the target. The finding is right that the equality only holds after that passage.
- **E13** (gap, Proposition 3.1.12): the diagram is a `tikzcd` at `main.tex:1516-1519`, printing on p. 31 with right-hand column $\operatorname{GL}(\bigoplus_{i=1}^r \Lambda_{i,p}) \to \operatorname{GL}(\bigoplus_{i=1}^s \Lambda_{s_i,p})$, $s<r$. There is no such map on full automorphism groups. The repair the finding proposes is available because the quasi-isogeny in play is chain-compatible.
- **E25** (error, p. 58): "Since $\mathcal{U}_{-\alpha_{i+1}}\subset \mathcal{I}\dot{s}_{i+1}\mathcal{I}$" (`main.tex:2425`) is false as printed — the root subgroup contains the identity, which lies in $\mathcal{I}$ and not in the non-trivial double coset. Only the non-identity elements are used.
- **E28** (Appendix A3.7(3)): checked by computation rather than by reading. "$a\mapsto i_\alpha(u_1([a],\frac{[a]^2}{2}))$" evaluated at $a=1$ gives $1/2$ in the second coordinate where the cocycle condition forces $0$.
- **E30** is the interesting one, and I have sharpened its record. **The slip exists only in the published version.** Published p. 62 sets
  $$P':=g(\infty)=\lim_{z\to\infty} g_x\textstyle\prod_{i=0}^{r-1}u'_{\sigma^i(\alpha)}(z^{-1})\dot t^{\sigma^i(\alpha^\vee)}L^+\mathcal{G} = g_x\dot t^{-\sum_{i=0}^{r-1}\sigma^i(\alpha^\vee)}L^+\mathcal{G},$$
  positive exponents inside the product and negative in the answer. arXiv v4 (`main.tex:2547-2548`) has **only** the final expression, with the correct sign: the intermediate limit was added in production, and the sign error with it. A reviewer checking this finding against the preprint alone would wrongly reject it. The next equality fixes the endpoint, so `affects: nothing` stands.
- **E32** (p. 63): at `main.tex:2558` the display ends `…u_{\sigma^{r-h}(\alpha)}(c_2z)u_\alpha(\dots)` with no closing $L^+\mathcal{G}$, so the right-hand side is not the double coset it needs to be.

**One new finding, E35** (misprint, affects nothing). In the `tikzcd` of Proposition 3.1.12's proof the top-right cell is `\operatorname{GL}\left(\bigoplus_{i=1}^r \Lambda_{i,p} \arrow{d} \right)`: the vertical-arrow command sits **inside** the `\left(...\right)` pair instead of after it. The consequence is visible on p. 31 — the two $\operatorname{GL}$ parentheses in the same column print at different sizes, `\big` above and `\Big` below. Purely typographic, and it is the same diagram E13 is about.

## What I did not do

I read the published PDF through a pure-Python text extractor, whose output interleaves mathematics into running text; page-level quotations above are reconstructions from that output, not copy-paste. Where a finding could be settled in the TeX I settled it there and say so. I did not attempt to re-derive Appendix A's Nie-style computations from scratch; the confirmations there are of what is printed and of the internal consistency of the displays, which is what the findings claim.
