# REV-PAPER-XU-ZHU-22 — review of the extraction of Xu–Zhu, *Bessel F-isocrystals for reductive groups*

**Verdict: accept. All five routes accepted, coverage effectively complete, all thirty recorded mistakes confirmed verbatim, nothing corrected in place and nothing added.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Extraction under review: issue #1284, claimed by `cc-39fac3` — 69 items (0 library, 3 planned, 66 missing), 5 routes, 30 `sourceIssues`, status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Daxin Xu and Xinwen Zhu, Inventiones mathematicae **227** (2022), 997–1092, [doi:10.1007/s00222-021-01079-5](https://doi.org/10.1007/s00222-021-01079-5), read in [arXiv:1910.13391v2](https://arxiv.org/abs/1910.13391v2) (19 December 2019, "A few typos corrected. Add Remark 4.5.8 on local monodromy at infinity").

## Provenance — both hashes match byte for byte

- e-print `0eab46d96ed75d385ebee89b1d1f53900efd7f0fa090553aeb526a26d0293f0e` ✔ — worth a note for the next reader: this e-print is a **bare gzipped single file**, not a tar archive. `tar xzf` fails on it; `gunzip -c` yields `Bessel_arXiv2.tex`, 4727 lines.
- PDF `b8d153ef1822a20e8179005d4775e43fc3af7430d840d2b077b45cb8583667cd` ✔, 96 pages.

## 1. Numbering — two devices, and nothing checks out until both are right

```
\newtheorem{theorem}{Theorem}[subsection]
\newtheorem{prop}[theorem]{Proposition}  ...  \newtheorem{rem}[theorem]{Remark}
\newtheorem{secnumber}[theorem]{}          % empty title, same counter
\numberwithin{equation}{section}
\numberwithin{equation}{theorem}           % the second wins
```

1. **`secnumber` is an empty-titled theorem environment sharing the counter.** It is how the paper prints its *numbered paragraphs*, and it is why locators like "§1.2.9", "§2.1.5(i)" and "§3.4.5" sit in the same sequence as Proposition 3.4.2 and Theorem 2.10.2. There are **114** such paragraphs against **79** real statements — so a simulation that ignores them is wrong about every number.
2. **Equations are numbered within the `theorem` counter**, not the section, which is where the four-level locators (1.2.9.1), (5.3.5.2), (2.4.6.2) come from. The equation counter resets at every theorem-family environment, `secnumber` included.

Simulating both gives **420 numbered objects = 193 theorem-counter objects (114 paragraphs + 79 statements) + 227 equations**, and it reproduces the number *and* the kind of every statement the thirty findings cite — including the paragraph-versus-statement distinction — together with all eleven four-level equation numbers. The extraction's locators are precise throughout.

## 2. Coverage

**All 69 items carry a statement- or paragraph-level locator**; none falls back on a section-level one. **76 of the 79 statements are cited**, the exceptions being Remark 1.2.5, Remark 2.8.4 and Proposition 3.6.4 (full faithfulness of `Rep_L(H) → Rep_L(H(L))`, used only in passing). **85 of the 114 numbered paragraphs** are cited as well.

One counting trap, recorded for whoever reads this next: the **appendix numbers two-level** — A.1, A.3, A.5, A.7, A.9, A.12 — because it has no `\subsection`. A three-component locator regex silently drops all seven appendix statements and under-reports coverage by seven.

## 3. Reference audit — clean, once the paper's idiom is found

The house style is a **bare** `\ref` ("cf. \ref{Dwork isocrystal}(i)", "see \ref{HNY Kl}") or a **lowercase** word ("theorem \ref{...}", "corollary \ref{identities exp sums}"). A capitalised-word audit finds **2** citations and would wrongly suggest the class is untested; case-insensitively there are **80**, and:

- **no word/environment mismatch**;
- **none resolves to a numbered paragraph** — checked specifically, because `secnumber` targets carry no word of their own and so invite exactly that error;
- **no duplicate labels, no undefined references** (220 `\ref`, 323 `\eqref`, no cleveref).

62 `\eqref` targets are statement or paragraph labels rather than displays. At that frequency it is deliberate house style — `\eqref` merely parenthesises the number — and not a defect.

## 4. Statuses

The extraction records **no `library` items and no `baseline.declarations`**, and only 3 `planned`. For this paper that is defensible rather than an omission: its prerequisites are Berthelot's arithmetic D-modules, rigid cohomology and geometric Satake, none of which is in the pinned Mathlib or Tau Ceti.

## 5. Routes — five, all joined, and the Kloosterman question resolves from both sides

| route | id | also proposed by |
|---|---|---|
| source | `PadicDifferentialEquationsAndRigidCohomology` (RD.1/2/4/6, all exist) | 7 papers, incl. TSUZUKI-23 (90), FSY (5) |
| part-ii | `PadicDifferentialEquationsPartIIArithmeticDModules` (18) | PAPER-ABE-18 (34) |
| new | `KloostermanSheavesAndBesselIsocrystals` (40) | PAPER-GAN-HARRIS-SAWIN-ETAL-24 (1) |
| new | `KloostermanMomentsAndPotentialAutomorphy` (3) | PAPER-FRESAN-SABBAH-YU-22 (46) — originator |
| part-ii | `PadicDifferentialEquationsPartIIMinimalSlope` (1) | PAPER-TSUZUKI-23 (66) — originator |

Two Kloosterman routes in one extraction looks at first like a roadmap duplicating the one it imports from. It is not. The extraction records its own atlas search — "Kloosterman" occurs only in a partition-asymptotics layer (QM.2) and in the pending FSY roadmap; "Heinloth", "Frenkel–Gross" and "oper" occur nowhere — and draws the line explicitly: **FSY plans GL₂ Kloosterman sheaves and symmetric-power moments; this paper is about group-valued Kloosterman sheaves and Bessel F-isocrystals.** It then routes exactly the three classical statements — Kloosterman sums, Deligne's Kloosterman sheaf, Katz's monodromy groups — to FSY's id "rather than planning them twice", keeping its title and area.

I had verified the other side of this a few hours earlier while reviewing PAPER-FRESAN-SABBAH-YU-22 (issue #1317, PR #2533): FSY is the originator with 46 items, and its own route reason names Xu–Zhu's adoption. **Both sides describe the split the same way.** The one-item Minimal Slope route is the same discipline applied to Tsuzuki-23's proposal.

## 6. Findings — thirty, all confirmed, and several are more than misprints

Nine `error`, two `gap`, nineteen `misprint`. Every one was located in the source and its reasoning re-derived. The ones worth naming:

- **E14** (gap) is the most consequential. Line 1743 states the standing hypothesis of the paper's Braden setup — "$X$ … such that $X\otimes_k\overline{k}$ is connected and **normal**" — and line 2243 then asserts that $\Gr_{G,\le\mu,X}$ *is* normal, unconditionally, for every split reductive $G$ over any finite field. Normality of $\Gr_{\le\mu}$ and reducedness of the special fibre are theorems requiring $p\nmid|\pi_1(G_{\mathrm{der}})|$ (Faltings, Pappas–Rapoport, Zhu), and can fail otherwise — PGL₂ in characteristic 2. The gap is real and the proposed repair, an equivariant embedding into a normal $\mathbb{G}_m$-stable ambient scheme, is the right shape.
- **E4** is settled by arithmetic: the printed constant $(q-1)q^{n-2}=q^{n-1}-q^{n-2}$ equals the correct $q^{n-1}-q$ **exactly when $n=3$**, so the formula is right only in the first case the statement covers and wrong for every $n\ge4$.
- **E5**: as printed, type $A_2$ satisfies the hypotheses of **both** bullets of Theorem 4.5.2(i) — the first excludes $A_{2n}$ only for $n\ge2$, the second claims $A_{2n}$ with no restriction.
- **E12**: one dimension formula, $\rho(\lambda+\mu)$, is offered for $\Gr_{G,\mu}\cap S_\lambda$ *and* $\Gr_{G,\mu}\cap T_\lambda$; Mirković–Vilonen give $\langle\rho,\mu-\lambda\rangle$ for the repeller.
- **E17**: a map is declared into $\mathbb{Z}/2\mathbb{Z}$ and then defined by $(-1)^{2\rho(\mu)}$, which lands in $\{\pm1\}$.
- **E26**: a chain of isomorphisms ends "$\simeq\mathscr{F}^{!+}$", but the paper's own line 1778 records that $X^0\to Z$ is open *and* closed, so $X^0$ is a direct summand and the last step is only a canonical morphism — which is exactly why 2.10.2(i) states $\iota_{\mathscr{F}}$ as a morphism, an isomorphism only under weak equivariance.
- **E30**: $\mathrm{Sol}(M)$ is a Hom *out of* $M$, hence contravariant, so it is canonically $\mathrm{Coker}(N)^\vee$, not $\mathrm{Coker}(N)$.
- Three entries are corroborated by the paper contradicting itself nearby, which is the strongest evidence a misprint can have: **E29** ($(2d_S)[2d_S]$ five lines after a correct $(d_S)[2d_S]$ in the same proof), **E19** (the shift outside $j_{\mu,!+}$ at line 2567, inside at line 1857), and **E10**, where the appendix display at line 4578 has *both* a summation limit missing its $-1$ and an exponent $m2^{s-i}$ for $m2^{s-t}$ — and lines 4582 and 4604, the next two stages of the same computation, use the corrected forms.
- **E1**, **E2** and **E3** are one family: a spurious $-1/\sqrt q$ (and, in E3, a missing Tate twist $(1/2)$). Against the paper's own normalisation $\Kl(n;a)=(-1/\sqrt q)^{n-1}\sum\cdots$ at line 311, the corrected E1 reads $\Kl(2)^2-1=\Kl(3)$, while the printed form does not balance by weight.

**Nothing added.** With thirty findings already recorded, the mechanical audits clean and the numbering exact, I looked for further slips in §§2–3 and the appendix without success.

## What I did not do

I did not re-derive the paper's mathematics — the geometric Satake equivalence for arithmetic D-modules, or the Frobenius-structure computations of §4 — from first principles. The confirmations are of what is printed, of the internal consistency of the surrounding displays, and of the arithmetic and functorial bookkeeping each finding turns on. Appendix A's congruence computation (E10) was checked against the neighbouring displays rather than recomputed.
