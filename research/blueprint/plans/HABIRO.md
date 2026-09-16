# Plan: the Habiro ring of a number field and Habiro cohomology

Job PLAN-HABIRO. This plan fixes the roadmap structure that later blueprint jobs fill in. It follows
`research/blueprint/PROTOCOL.md` (§§7, 9) and the source-faithfulness rules of `research/expansion/PROTOCOL.md`.
Baseline: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.

## 0. Summary

The mathematics has two halves:

- **The number-field half** (GSWZ; Scholze's course V5A2): the Habiro ring $\mathcal H_R$ of $R=\mathcal O_K[1/\Delta]$,
  the $K_3$-indexed invertible modules $\mathcal H_{R,\xi}$, and Nahm sums as their elements. It needs cyclotomic
  completions, $q$-analogues, Bloch groups and $K_3$, cyclic quantum dilogarithms, $p$-adic regulators, admissible
  series and formal Gaussian integration.
- **The cohomology half** (Scholze's course V5A4; Wagner's two papers): relative Habiro rings of étale algebras
  over Λ-rings, $q$-Witt vectors and $q$-de Rham–Witt complexes, $q$-de Rham and $q$-Hodge complexes, algebraic
  Habiro cohomology, and the analytic Habiro ring stack. It needs Λ-rings, derived and Habiro completion,
  condensed and solid mathematics, analytic stacks, six-functor formalisms, and ring stacks with transmutation.

The six existing roadmaps cover the first half and the algebraic part of the second, with three structural
problems:

1. the $q$-Witt theory is split between `HabiroRings` HR.4 and `HabiroCohomologyFoundations` HQ.4, with the
   Λ-ring theory in HR.1;
2. the explicit number-field ring (HB.6) and the relative ring (HR.5) are built independently;
3. nothing owns condensed/solid/analytic foundations, abstract six-functor formalisms, ring stacks or the
   analytic Habiro stack.

**Proposal.** Keep all six existing roadmaps, rescoped as in §6. Add five roadmaps (definitions in
`research/blueprint/roadmaps/`):

| id | group | role |
|---|---|---|
| `QWittVectors` (QW.0–QW.7) | cohomology | big Witt vectors, Λ-rings, $q$-Witt vectors, $q$-de Rham–Witt complexes, framed $q$-Hodge comparison, no-go theorem |
| `SolidAnalyticRings` (SA.0–SA.4) | foundations | light condensed and solid mathematics, analytic rings, discrete Huber pairs, bounded/Gelfand rings, $\mathbb Z((u))_\square$ |
| `AnalyticStacks` (AS.0–AS.4) | foundations | abstract six-functor formalisms, classical formalisms, analytic/algebraic/Betti stacks, solid geometry, normed bases |
| `RingStacksAndTransmutation` (RS.0–RS.3) | foundations | ring stacks, quasi-ideals, transmutation, algebraic examples, Scholze's Theorem 10.6, analytic de Rham ring stack, normed ring stacks |
| `AnalyticHabiroStack` (HS.0–HS.4) | motivic | $\mathcal H^{\mathrm{an}}$, $G$, $(\mathbb G_m)^{\mathrm{Hab}}$, $1-_{\mathrm{Hab}}x$, the Habiro ring stack, $D_{\mathrm{Hab}}$, the normed Habiro stack |

**Blueprint order (§7):** HabiroCyclotomicCompletions → QWittVectors → HabiroRings → suppliers (K3BlochGroups,
Polylogarithms, ColemanIntegration, PadicHodgeRegulators) → HabiroNumberFields → HabiroNahmSeries →
HabiroCohomologyFoundations → SolidAnalyticRings → AnalyticStacks → RingStacksAndTransmutation →
AnalyticHabiroStack → HQ.6 assembly → ArithmeticQuantumTopology.

## 1. Sources and provenance

No PDF or extracted text is stored in the repository. The notes are cited by title, author, course and date.

### 1.1 Primary sources

| source | version read | identification |
|---|---|---|
| S. Garoufalidis, P. Scholze, C. Wheeler, D. Zagier, *The Habiro ring of a number field* | arXiv:2412.04241**v2** (27 Aug 2025, 73 pp.; v1 5 Dec 2024). TeX source `text131.tex`, dated 13 Aug 2025, with `.bbl`. | PDF SHA-256 `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` (matches the campaign library record `GSWZ_HabiroNumberField_v2`); e-print archive SHA-256 `b93170cf809075112bd80fb4e0df299baf96d3dc3eb0c79f37aa60b1a0d8fd66`; fetched from arxiv.org on 2026-09-16. Printed page numbers equal PDF page numbers. |
| W. J. G. Ong, notes of P. Scholze's course *V5A2 – The Habiro Ring of a Number Field* (Bonn, winter semester 2024/25; 12 lectures, 11 Oct 2024 – 31 Jan 2025) | version of **6 March 2025**, 50 pp., Lectures 1–12 with Appendix A | SHA-256 `58c2ea7f1d943053a008df05703f90b705b063c4945e503e68ca23cf2d768f18`; lecture recordings: MPIM archive eprint 5132 |
| W. J. G. Ong, notes of P. Scholze's course *V5A4 – Habiro Cohomology* (Bonn, summer semester 2025; 8 lectures, 11 Apr – 11 Jul 2025) | the only version supplied, 50 pp., Lectures 1–8 with Appendices A–B | SHA-256 `4cc50e0b2ad0fa03bcf759db5e759483721bdcd23d6362f354e8b3f95e85ee4b` (matches library record `Ong_HabiroCohomologyNotes`); recordings: MPIM archive eprint 5155 |
| P. Scholze, *Vorlesung (V5A4): Habiro Cohomology*, course description | Bonn, SS 2025 | library record `Scholze_HabiroCourse_2025` |

### 1.2 The earlier versions of the V5A2 notes

| version | pages | lectures | SHA-256 |
|---|---|---|---|
| 12 Nov 2024 (unsuffixed file) | 20 | 1–3 | `bd4f7cfc93d7a8575e0c860a8427817e09988e51c706839603899698ba01f724` |
| 1 Dec 2024 ("-1") | 33 | 1–6 | `9d97824e2c1ebd564809e58b62716221e692cb7057b57d677149d362018c1d2f` |
| 4 Feb 2025 ("-2") | 49 | 1–12 | `ce9b93ded417acbb04fb6b3c117b031b1d7e623696502e4ecdc9071d4d391dc2` |
| 6 Mar 2025 ("-3") | 50 | 1–12 + App. A | `58c2ea7f1d943053a008df05703f90b705b063c4945e503e68ca23cf2d768f18` |
| campaign library copy (record `Ong_HabiroRingsNotes`) | 50 | 1–12 + App. A | `6e1757b177f62808ef6ce3241dfe90de3831eb19d93a39c5afb7b41a43615955`; word-level comparison shows the same text as 6 Mar 2025 up to PDF rendering (ligatures, line breaks) |

Result of the comparison (word-level diffs of consecutive versions):

- *12 Nov → 1 Dec 2024.* Lectures 4–6 and references were added; nothing was removed.
- *1 Dec 2024 → 4 Feb 2025.* Three changes:
  - Lecture 3 gains Corollary 3.4 ($\mathcal H\hookrightarrow\mathbb Z[[q-1]]$);
  - Lecture 2/3 gains the expected shape $\sqrt\delta f_A(q)\sim\exp(\mathrm{Li}_2(\xi)/\dots)\,\varepsilon_m(\xi)\cdots$ with
    $\xi\in K_3(K)$;
  - the Lecture 5 caveat that "the proofs and structure for this lecture are more rough" disappears.

  One mathematical statement is **dropped**: the 1 Dec version of Theorem 6.19 reads
  $K_3(K)\otimes\mathbb Q\cong K_3(\mathcal O_K)\otimes\mathbb Q\cong\dots$, and later versions omit the middle term. The statement
  is true: $K_3(\mathcal O_K)\to K_3(K)$ is an isomorphism, which GSWZ (cm) also uses integrally. It belongs to the
  $K$-theory suppliers (`ArithmeticKTheory` N.5, already an input of HB.1).
- *4 Feb → 6 Mar 2025.* Three changes:
  - the duplicated corollary "$\mathcal H\hookrightarrow\prod_m\mathbb Z[\zeta_m]$" (4 Feb Corollary 3.6) is removed;
  - Lecture 10 is rewritten. The 4 Feb version opens with a transitional sentence on realisations of relative
    motivic cohomology, uses a base ring without $\Delta$ and $z_i(1-z_i)$ inverted, and describes the Betti and
    étale realisations briefly. The 6 Mar version has the ring (10.1) with those elements inverted, the relative
    Habiro ring and line bundle of which Nahm sums are sections, Remark 10.1 ($V^{univ}$), and the monodromy
    argument identifying the étale realisation with the cyclic quantum dilogarithm;
  - Lecture 12 gains the explicit étale $\mathbb Z[t]$-algebra with $\delta=z+a(1-z)$.

  Nothing of mathematical substance is lost.
- The campaign library copy has the same text as 6 Mar 2025.

The plan uses the 6 March 2025 version throughout.

### 1.3 References followed

Everything below was read in the sections named in the roadmap definitions. Hashes are the first eight hex digits of the
SHA-256 of the files used; "lib" means the campaign library copy, whose recorded hash matched.

| reference | version | SHA-256 | used for |
|---|---|---|---|
| F. Wagner, *q-Witt vectors and q-Hodge complexes* | arXiv:2410.23078v5 (6 Oct 2025) | lib `c1c7426f…` | QW |
| F. Wagner, *q-Hodge complexes over the Habiro ring* | arXiv:2510.04782v2 (8 Oct 2025) | lib `591d0bdf…` | HR, HQ, QW.7 |
| F. Wagner, *q-de Rham cohomology and topological Hochschild homology over ku* | arXiv:2510.06057v1 | lib `fe9d7d71…` | HQ.5-trace, RT |
| F. Wagner, *q-Hodge filtrations, Habiro cohomology, and ku* (thesis) | 230 pp. | lib `d074047f…` | cross-check of statement numbering |
| S. Meyer, F. Wagner, *q-Hodge complexes and refined TC⁻* | arXiv:2410.23115v4 | lib `4479788e…` | V5A4 Thm 1.7 |
| S. Garoufalidis, C. Wheeler, *Explicit classes in Habiro cohomology* | arXiv:2505.19885v1 | lib `7e4470b2…` | HR.7, HQ.9 |
| S. Garoufalidis, C. Wheeler, *A lift of the colored Jones polynomial of a knot* | arXiv:2603.01619v1 | `5118504b…` | QT (decision D7) |
| P. Scholze, *Canonical q-deformations in arithmetic geometry* | arXiv:1606.01796v1 | `ce060b41…` | Conjectures 1.1, 3.1, 7.1–7.5 |
| B. Bhatt, P. Scholze, *Prisms and prismatic cohomology* | arXiv:1905.08229v4 | lib `1d91a6eb…` | §2 (δ-rings), §16 |
| B. Bhatt, J. Lurie, *Absolute prismatic cohomology* | arXiv:2201.06120v1 | lib `0b1beeb2…` | PR.5 boundary |
| V. Drinfeld, *Prismatization* | arXiv:2005.04746v7 | `8602d94b…` | RS.0–RS.1 |
| V. Drinfeld, *A stacky approach to crystals* | arXiv:1810.11853v3 | `3147a808…` | RS.1 |
| L. Gurney, *Prismatization over Z* | arXiv:2301.12392v1 | `50f7abdb…` | boundary (non-goal) |
| B. Bhatt, *Prismatic F-gauges* (lecture notes, Princeton, fall 2022) | author's website | `a9f526ce…` | RS.0–RS.1 |
| L. Hesselholt, *The big de Rham–Witt complex* | arXiv:1006.3125v3 | `1b21e5ad…` | QW.0–QW.1 |
| J. Borger, *The basic geometry of Witt vectors, I* | arXiv:0801.1691v6 | `d8d7c8f6…` | QW.0–QW.1 |
| P. Scholze, *Lectures on Condensed Mathematics*; *Lectures on Analytic Geometry* | author's website | lib `d4225612…`, `1d9fe538…` | SA |
| J. E. Rodríguez Camargo, *Notes on solid geometry* | arXiv:2603.03012v1 | `6277c6a2…` | SA, AS |
| J. E. Rodríguez Camargo, *The analytic de Rham stack in rigid geometry* | arXiv:2401.07738v1 | `bbff4a9e…` | SA.4, AS.4, RS.2 |
| J. Anschütz, G. Bosco, A.-C. Le Bras, J. E. Rodríguez Camargo, P. Scholze, *Analytic de Rham stacks of Fargues–Fontaine curves* | arXiv:2510.15196v2 | `863a6d22…` | SA.4, AS.4, RS.2 |
| P. Scholze, *Six-Functor Formalisms* | arXiv:2510.26269v2 | `bef03551…` | AS, RS |
| C. Heyer, L. Mann, *6-functor formalisms and smooth representations* | arXiv:2410.13038v1 | `aec357f3…` | AS.0 |
| P. Scholze, *Berkovich motives* | arXiv:2412.03382v3 | `440b4a82…` | boundary (non-goal) |
| K. Aoki, *Berkovich 2-motives and normed ring stacks* | arXiv:2603.01877v1 | `a178c823…` | RS.3, HS.4 |
| T. Bouis, Q. Gazda, *The cyclosyntomic regulator of a number field* | arXiv:2602.21894v1 | `935eabb4…` | decision D7 |
| L. D. Faddeev, R. M. Kashaev, *Quantum dilogarithm* | arXiv:hep-th/9310070v1 | `b979ebf2…` | HS.2 |
| F. Calegari, S. Garoufalidis, D. Zagier, *Bloch groups, algebraic K-theory, units, and Nahm's conjecture* | arXiv:1712.04887v3 | lib `024317c2…` | HB.1–HB.5 |
| K. Hutchinson, *The Chern class for K₃ and the cyclic quantum dilogarithm* | arXiv:2104.14413v4 | lib `e7a35815…` | HB.2 |
| A. Besser, R. de Jeu, *The syntomic regulator for K-theory of fields* | arXiv:math/0110334v2 | lib `67b19d01…` | HB.7, D.3 |
| K. Habiro, *Cyclotomic completions of polynomial rings* | Publ. RIMS 40 (2004) | lib `f5609467…` | HC |
| A. Efimov, *Rigidity of the category of localizing motives* | arXiv:2510.17010v1 | lib `0969afe5…` | RT boundary |

Access date for all fetched files: 2026-09-16.

### 1.4 Sources the blueprint jobs must read that this job did not

These are cited by the sources above for steps the roadmaps adopt.

- J. Ayoub, *Les six opérations de Grothendieck et le formalisme des cycles évanescents dans le monde
  motivique I*, Astérisque 314 (2007): Définition 1.4.1 and Théorème 1.7.9. Scholze uses them in the proof of
  his Theorem 10.6 (RS.2).
- B. Bhatt, J. Lurie, *The prismatization of p-adic formal schemes* (arXiv:2201.06124), for the relative
  prismatic comparison used by RS.1 through PR.5.
- M. Kontsevich, Y. Soibelman (cohomological Hall algebras), for GSWZ Theorem 6. GSWZ cite
  "[KS, Sec. 6.1, Thm. 9]" and "[Efimov]"; the Efimov paper in the library is the rigidity paper, not the
  integrality paper, so the correct Efimov reference must be fetched.
- H. Rademacher, E. Grosswald, *Dedekind sums*, for $D_{\zeta_m}(1)^{24m}=m^{12m}$ (GSWZ proof of Lemma 2.12).
- C. Weibel, *The K-book*, Chapter VI, for $K_3(K_p;\mathbb Z_p)\cong H^1(K_p,\mathbb Z_p(2))$ (GSWZ proof of Theorem 9).
- A. Besser, *Finite and p-adic polylogarithms*, Corollary 2.2 (GSWZ Proposition 3.2).
- C. Zickert on the surjectivity of the extended Bloch group map, and Kashaev–Mangazeev–Stroganov, for GSWZ
  Corollary 1.11(b).
- D. Clausen's computation of continuous K-theory of $\mathbb C$ (V5A2 Theorem 7.6): no written source was found
  (decision D6).
- The *Analytic Stacks* lecture course of Clausen–Scholze (recordings). Rodríguez Camargo's notes are used as
  its written account.

## 2. Conventions fixed by this plan

- **Roots of unity.** $(\zeta_m)_m$ is a compatible system: $\zeta_{mm'}=\zeta_m\zeta_{m'}$ for $(m,m')=1$, and
  $\zeta_{p^r}^p=\zeta_{p^{r-1}}$ (GSWZ (zmdef)). Expansions are in $x=q-\zeta_m$. Where no embedding is needed,
  $R[\zeta_m]:=R[q]/\Phi_m(q)$.
- **$\Delta$ and primes.** Rings: $R=\mathcal O_K[1/\Delta]$ with $\mathrm{disc}(K)\mid\Delta$ (GSWZ Definition 1.1; V5A2
  Definition 3.6 takes $\Delta=\mathrm{disc}(K)$). Modules and $K_3$-statements: additionally $6\mid\Delta$, and all
  primes considered are $p>3$ (GSWZ Theorem 1, Remark 1.8). Every statement records which convention it
  uses (decision D8).
- **Frobenius.** $\varphi_p$ is the unique Frobenius lift on $\widehat R_p$ (finite étale over $\mathbb Z_p$), extended to
  $\widehat R_p[\zeta_{pm}][[x]]$ fixing $\zeta_{pm}$ and $x$ (GSWZ Definition 1.1). On relative objects it is the
  Frobenius twist along $\psi^p$ (Wagner).
- **Λ-rings** are Borger/Hesselholt Λ-rings (coalgebras for the big Witt comonad), not Iwasawa algebras;
  "perfectly covered" means $A\to A_\infty$ is faithfully flat (Wagner v5 Remark 2.47).
- **$q$-analogues.** $(x;q)_n=\prod_{i<n}(1-xq^i)$, $[n]_q=(q^n-1)/(q-1)$, with $q$-factorials and
  $q$-binomials as in HC.1.
- **Condensed** means light condensed (SA). **Analytic stacks** are those of RC §6.3.
- **Notation for sources.** "GSWZ" is arXiv:2412.04241v2. "V5A2" is Ong's notes of Scholze's V5A2
  (6 March 2025 version). "V5A4" is Ong's notes of Scholze's V5A4. "Wagner v5" is arXiv:2410.23078v5;
  "Wagner v2" is arXiv:2510.04782v2. "RC" is arXiv:2603.03012v1. "6FF" is arXiv:2510.26269v2.
  "ABLRS" is arXiv:2510.15196v2.

## 3. (a) Target theorems

Statements are given in the sources' notation. Owners are the roadmap stages proposed in §6.

### 3.1 GSWZ, *The Habiro ring of a number field*

Setting: $K$ is a number field, $\Delta$ a positive integer, $R=\mathcal O_K[1/\Delta]$, and
$\mathcal P_R=\big(\prod_{\zeta\in\mu_\infty}R[\zeta][[x]]\big)^{\mathrm{Gal}(\mathbb Q^{ab}/\mathbb Q)}\cong\prod_{m\ge1}R[\zeta_m][[x]]$ (GSWZ (PR), p. 5).

**Rings.**
- **Definition 1.1** (p. 6). For $\mathrm{disc}(K)\mid\Delta$, $\mathcal H_R\subset\mathcal P_R$ consists of $f=(f_m(x))_m$ with
  $f_m(x+\zeta_{pm}-\zeta_m)=(\varphi_pf_{pm})(x)$ in $\widehat R_p[\zeta_{pm}][[x]]$ for all primes $p$ and all $m$, where
  $\varphi_p$ is the Frobenius of $\widehat R_p$ extended by fixing $\zeta_{pm}$ and $x$. The restrictions $\mathcal H_R|_\Delta$
  (orders prime to $\Delta$) and $\mathcal H_R|_\gamma$ are defined after the definition. The text after
  Definition 1.1 makes further claims, with proofs sketched:
  - for abelian $K$, $\mathcal H_R\cong\mathcal H_{\mathbb Z[1/\Delta]}\otimes R$ (footnote);
  - $\mathcal H_R$ is a finite étale $\mathcal H_{\mathbb Z[1/\Delta]}$-algebra, finite projective of rank $[K:\mathbb Q]$;
  - $(\mathcal H_R)^\wedge_p\cong\prod_{(m,p)=1}\widehat R_p[\zeta_m][[x]]\cong\mathcal H_{\widehat R_p}$ (eq. (habp));
  - $\mathcal H_R=\mathcal P_R\cap\mathcal H_{\widehat R}$ (diagram (Hviapcomp)).
- **Remark 1.2** (p. 7). $\mathcal H_R$ is not a domain. It is a product of domains indexed by the classes of
  $\mathbb N$ under $m\sim pm$ for $p\nmid\Delta$.

**$K_3$-indexed modules.** Let $\varepsilon_m=c_{\zeta_m}^2:K_3(K)\to K(\zeta_m)^\times/(K(\zeta_m)^\times)^m$ be the
CGZ unit (eq. (emdef), p. 7), $\chi^{-1}$-equivariant, and $D_p$ the Coleman–Besser–de Jeu $p$-adic regulator
$K_3(K_p)\to K_p$.
- **Definition 1.3** (pp. 8–9). Fix $\xi\in K_3(K)$ and a prime $p$. An *invertible $L_p(\xi)$-section* is a
  collection $f=(f_m(x))_{(m,p)=1}$ with $f_m\in\varepsilon_m(\xi)^{1/m}(\widehat R_p[\zeta_m]^\times+xK_p[\zeta_m][[x]])$ such that
  $\log\big(\varphi_p\widehat f(q^p)/\widehat f(q)^p\big)\in\prod_{(m,p)=1}\frac px\widehat R_p[\zeta_m][[x]]$. Here
  $\log\widehat f_m=D_p(\xi)/(m^2\log q)+\log f_m\in x^{-1}K_p[\zeta_m][[x]]$. $\mathcal H_{\widehat R_p,\xi}$ is the
  $\mathcal H_{\widehat R_p}$-span of these sections.
- **Theorem 1** (p. 9). Let $\Delta$ be divisible by $\mathrm{disc}(K)$ and by $6$, $\xi\in K_3(K)$, and $p$ a prime with
  $(p,\Delta)=1$. Then invertible $L_p(\xi)$-sections exist, and $\mathcal H_{\widehat R_p,\xi}$ is free of rank one over
  $\mathcal H_{\widehat R_p}$.
- **Definition 1.4** (p. 10). $\mathcal H_{R,\xi}$ consists of $f=(f_m)_{m\ge1}$ with $f_m\in\varepsilon_m(\xi)^{1/m}K[\zeta_m][[x]]$
  such that:
  - $(f_m)_{(m,p)=1}\in\mathcal H_{\widehat R_p,\xi}$ for every $p$ (the text before the definition assumes $p$ prime to $6$);
  - for all $\gamma\in\mathbb Z_{>0}$, $f(q^\gamma)^\gamma f(q^{-1})\in\mathcal H_{R[1/\gamma]}|_\gamma$ (eq. (eq:gluing)).
- **Theorem 2** (p. 10). $\mathcal H_{R,0}=\mathcal H_R$. Multiplication gives canonical isomorphisms
  $\mathcal H_{R,\xi}\otimes_{\mathcal H_R}\mathcal H_{R,\xi'}\cong\mathcal H_{R,\xi+\xi'}$. Each $\mathcal H_{R,\xi}$ is invertible, and
  $\xi\mapsto\mathcal H_{R,\xi}$ is a homomorphism $K_3(K)\to\mathrm{Pic}(\mathcal H_R)$. The text after Theorem 2 adds that
  for abelian $K$ and a Galois-invariant $\xi=\sum n_j[\zeta^j]$, $\mathcal H_{R,\xi}$ is free on
  $\prod_j(q^{1/2}\zeta^j;q)_\infty^{n_j}$.
- **Proposition 1.5** (p. 11). Write $\tau f=f(q^{-1})$ and $\gamma^*f=f(q^\gamma)$.
  (a) $\tau\mathcal H_{R,\xi}\subseteq\mathcal H_{R,-\xi}$.
  (b) For $f,g\in\mathcal H_{R,\xi}$, $f\cdot\tau g\in\mathcal H_R$, and $af=bg$ for some $a,b\in\mathcal H_R$.
  (c) $(\gamma\gamma')^*=\gamma^*\gamma'^*$ on $\mathcal P_R$.
  (d) $(\gamma^*f)^\gamma\in\mathcal H_{R[1/\gamma],\xi}|_\gamma$.
  (e) $f_m=0\Rightarrow f_{pm}=0$ for $p\nmid\Delta$.
  (f) $f_m(0)\in R[\zeta_m,\varepsilon_m^{1/m}]$ for $(m,\Delta)=1$.
  Remark 1.6 (p. 11): $\tau$ is orientation reversal.

**Admissible series and Nahm sums** (§§1.6–1.7).
- **Definition 1.7** (p. 11). $F(t,q)\in\mathbb Q(q)[[t]]$, $t=(t_1,\dots,t_N)$, with $F=1+O(t)$, is *admissible* if
  $\log F=-\sum_{0\ne n}\sum_{\ell\ge1}\frac{L_n(q^\ell)}{\ell(1-q^\ell)}t^{\ell n}$ with $L_n\in\mathbb Z[q^{\pm1}]$. Equivalently,
  $F=\prod_{n\ne0}\prod_{i\in\mathbb Z}(q^it^n;q)_\infty^{c_{n,i}}$ with finitely many $c_{n,i}\ne0$ for each $n$.
- For a symmetric integral $N\times N$ matrix $A$:
  $F_A(t,q)=\sum_{n\ge0}\frac{(-1)^{\mathrm{diag}(A)\cdot n}q^{\frac12(n^tAn+\mathrm{diag}(A)\cdot n)}}{(q;q)_{n_1}\cdots(q;q)_{n_N}}t^n$
  (FAdef), and its congruence-class versions $F_{A,m,k}$ (FAmdef). $F_A$ satisfies the $q$-difference equations
  (PhiAshift).
- The $t$-deformed Nahm equations are $1-z_j(t)=(-1)^{A_{jj}}t_j\prod_iz_i(t)^{A_{ij}}$ with $z_j(0)=1$; eq. (zjt) prints
  $z_j$ in the product, see §8. They give the ring $S$ (Sdef), the discriminant
  $\delta(t)=\prod_jz_j^{-A_{jj}}\det(\mathrm{diag}(1-z)A+\mathrm{diag}(z))$ (taulambda), and $S^{(m)}$ (RA).
  $\Phi_{A,m}(t,x)=F_A(t^{1/m},\zeta_m+x)$ (Phidef), and $\Phi^{\mathrm{FGI}}_{A,m}$ is the formal Gaussian integral of
  **Definition 2.11** (p. 29).
- **Remark 1.8** (p. 13). The primes $2$ and $3$ need special care; the paper assumes $p>3$ and $2,3\mid\Delta$.
- **Theorem 3** (p. 14). $\Phi_A(t,q)=\Phi_A^{\mathrm{FGI}}(t,q)$ for every symmetric integral $A$.
- **Theorem 4** (p. 14). For $(m,p)=1$ and every class $k$,
  $\log F_{A,m,k}(t^{p/m},q^p)-p\log F_{A,m,k}(t^{1/m},q)\in\frac px S^{(m)}[z(t)^{1/m}]^\wedge_p[[x]]$, with $q=\zeta_m+x$.
- **Theorem 5** (p. 14). Let $z$ be a non-degenerate solution of the Nahm equations (an isolated solution with
  $\delta\ne0$), $\xi=\sum_j[z_j]\in B(K)$, $R[\delta^{-1/2}]=\mathbb Z[z^{\pm1},\delta^{-1/2}]/(\text{Nahm})$, and $\Phi_{A,z}(q)$ the
  $t=1$ specialisation with the principal part removed. Then $\Phi_{A,z}(q)\in\mathcal H_{R[\delta^{-1/2}],\xi}|_\Delta$.
- **Remark 1.9** (p. 15). The stronger statement without $|_\Delta$ is expected. $\Phi_{A,z}$ lies in the
  $-1$-eigenspace of $\sqrt\delta\mapsto-\sqrt\delta$. The extension to rational $A$ uses $m$-admissible series.
- **Corollary 1.10** (p. 15). For $(m,\Delta)=1$, the constant term of $\Phi_{A,z}$ at $\zeta_m$ lies in $R[\zeta_m]$
  (example (cherry41)).
- **Corollary 1.11** (p. 15). (a) $\Phi_{A,z}(q)\Phi_{A,z}(q^{-1})\in\mathcal H_R$. (b) If $r\xi=0$ in $K_3(K)$, then
  $\Phi_{A,z}(q)^r\in\mathcal H_{R[\delta^{-1/2}]}$.

**Section 2** (proofs of Theorems 3, 4, 6–8).
- **Lemma 2.1** (p. 19). $\mathrm{Li}_n^{(p)}(t)\in\mathbb Z[t,\frac1{1-t}]^\wedge_p$.
- **Proposition 2.2** (p. 19).
  (a) $\log(t^p;q^p)_\infty-p\log(t;q)_\infty\in\frac px\mathbb Z[t,\frac1{1-t}]^\wedge_p[[x]]$ with $q=1+x$.
  (b) For a root of unity $\zeta\ne1$ of order not a power of $p$,
  $\log(\zeta^p;q^p)_\infty-p\log(\zeta;q)_\infty\in p\frac{\mathrm{Li}_2^{(p)}(\zeta)}{x}+p\mathbb Z_{(p)}[\zeta][[x]]$, meromorphic on
  $|x|<1$.
- **Lemma 2.3** (p. 21). Expansion of $\Phi_m$ at roots of unity.
- **Corollary 2.4** (p. 22). Admissible series are determined by $(V,\delta,U_m)$, or by one $\Phi_m$.
- **Lemma 2.5** (p. 22). Dwork congruence for admissible series.
- **Lemma 2.6** (p. 23). $\log F_A(t,\zeta_m+x)=\zeta_mV(t^m)/(m^2x)+O(x^0)$ for a single $V_A\in\mathbb Q[[t]]$.
- **Theorem 6** (p. 24; [KS, Efimov]). $F_A$ is admissible, i.e. the $c_{n,i}$ have finite support in $i$.
- **Lemma 2.7** (p. 25). The level-$m$ form (madmis).
- **Definition 2.8** (p. 26). $m$-admissible: $L_n\in\mathbb Z[\frac1m,q^{\pm1},\Phi_d^{-1}\,(d\not\equiv0\bmod m)]$ and
  $L_n(\zeta_m)\in\mathbb Z[\frac1m]$.
- **Lemma 2.9** (p. 26). The $V$-lemma for $F_{A,m,k}$.
- **Theorem 7** (p. 26). $F_{A,m,k}(t^{1/m},q)$ is $m$-admissible.
- **Lemma 2.10** (p. 28). The Dwork congruence for $m$-admissible series.
- **Lemma 2.12** (p. 30). $\log\Phi^{\mathrm{FGI}}_{A,m}\in\frac{V^{\mathrm{FGI}}(t)}{m^2\log(1+x/\zeta_m)}-\frac12\log\delta^{\mathrm{FGI}}+\log U_m^{\mathrm{FGI}}+xS^{(m)}_{\mathbb Q}[[x]]$,
  with $\delta^{\mathrm{FGI}}\in S$ and $m^{Nm}(U_m^{\mathrm{FGI}})^{2m}\in S^{(m)}$.
- **Lemma 2.13** (p. 31). Dwork quotients for $\mathcal S_{A,m,k}$ (FGIcong).
- **Remark 2.14, Lemma 2.15** (p. 32). The $q$-difference equations of the FGI series.
- **Lemma 2.16, Corollary 2.17** (pp. 34–35). WKB recursion.
- **Theorem 8** (p. 35). $F_{A,m,k}(t^{1/m},q)=\mathcal S_{A,m,k}(t,q)$ at $q=\zeta_{mm'}+x$.
- **Corollary 2.18** (p. 36). $V$ determines $A$.

**Section 3** (proofs of Theorems 1, 2, 5; $p$-adic dilogarithm).
- **Lemma 3.1** (p. 38). If $z\in\widehat R_p$, $|z|_p=1$ and $|z-1|_p\ge1$, then $D_p(z)\in p^2\widehat R_p$.
- **Proposition 3.2** (p. 38; Besser). $p^{-2}D_p(\zeta^p)\equiv\mathrm{li}_{2,p}(\zeta)/(\zeta-1)^p\pmod p$.
- **Proposition 3.3** (p. 38). $\mathrm{Span}_{\mathbb Z_p}\{p^{-2}D_p(\zeta):\zeta\in\mu(\mathbb Q_{p^s})\}=\mathbb Z_{p^s}$.
- **Theorem 9** (p. 39). For $p>3$, $D_p:K_3(K_p;\mathbb Z_p)\to p^2\mathcal O_{K_p}$ is a $\mathbb Z_p$-linear isomorphism, and
  $K_3(K_p;\mathbb Z_p)$ is generated by the $[\zeta]$, $\zeta\in\mu(K_p)$.
- **Lemma 3.4** (p. 39; Dwork). For $f\in1+xS[\frac1p,\zeta_m][[x]]$: $f\in1+xS[\zeta_m][[x]]$ if and only if
  $\varphi(f)((\zeta_m+x)^p-\zeta_m^p)/f(x)^p\in1+pxS[\zeta_m][[x]]$ and $f\in1+xS[\zeta_m]+O(x^2)$.
- **Corollary 3.5** (p. 40). The exponential-integrality diagram.
- **Lemma 3.6** (p. 41). A unique $\beta_m\in\mathbb Z_p$ normalising $p$-power roots.
- **Corollary 3.7** (p. 41). Unique lift of an $L_p(\xi)$-section to all roots of unity.
- **Remark 3.8** (p. 42). $\log\widehat f$ is meromorphic.
- **Definition 3.9** (p. 42). $\Psi_{[\zeta],p,m}(x)=\exp\big(-\frac{\mathrm{Li}_2(\zeta)}{m^2\log q}\big)\varepsilon_m([\zeta])^{1/m}(q^{m/2}\zeta;q^m)_\infty^{1/m}$,
  and $\Psi_{\widehat\xi,p}=\prod_\zeta\Psi_{[\zeta],p}^{a_\zeta}$ for $\widehat\xi=\sum a_\zeta[\zeta]$ (eqs. (hatxia), (hatxi)).
- **Theorem 10** (p. 42). For unramified $p>3$, $\Psi_{\widehat\xi,p}$ is an $L_p(\widehat\xi)$-section.
- **Corollary 3.10** (p. 43). Its class in $\mathcal H^\times_{\widehat R_p,\widehat\xi}/\mathcal H^\times_{\widehat R_p}$ is independent of the presentation.
- **Remark 3.11** (p. 44). The specialisation $t=q^\nu$ gives $\Phi_{A,z,\nu}\in\mathcal H_{R[1/\sqrt\delta],\xi}|_\Delta$; proof omitted.
- **Corollary 3.12** (p. 45). $U^{\mathrm{FGI}}_m(1)$ is $\Delta$-integral for $(m,\Delta)=1$.

**Section 4** (examples).
- **Theorem 11** (p. 46). $\Psi_A(t,q)=\Phi_A(t,q)\Phi_A(t,q^{-1})\in\mathbb Z[\zeta_m][[x]][[t^{1/m}]]$, with $\Psi_{A,m}$ the residue
  sum (psitmdef).
- **Theorem 12** (p. 47). $\Psi_{A,\mu,\nu,z}(q)\in\mathcal H_R$ for all $\mu,\nu\in\mathbb Z^N$.
- Examples 4.1 (the cubic field of discriminant $-23$, p. 47), 4.3 (p. 54), 4.4–4.5 (p. 57); Remark 4.2 (knots
  $4_1$, $5_2$, $(-2,3,7)$, p. 48).

**Section 5** (the naive Habiro ring). $\mathbb H_R=\varprojlim_nR[q]/(q;q)_n$ (eq:Hnaive). The map $\iota:\mathbb H_R\to\mathcal P_R$
is injective and an isomorphism after $\otimes\mathbb Q$ (graded-quotient argument with
$D_{m,\ell}=m^{2\ell-1}(\ell-1)!$, eq:poch.dml).
- **Proposition 5.1** (p. 62). $D(N)=|\det M_N|=\prod_{n\le N}D_1(n)D_2(n)$ with the stated $D_1$, $D_2$.
- **Proposition 5.2** (p. 63). $H\in\iota(\mathbb H_R)$ if and only if $M_N^*(\gamma_{m,\ell,j})\equiv0\bmod D(N)$ for all $N$.
- **Proposition 5.3** (p. 65). $\mathcal H_R=\{H\in\mathcal P_R:\varphi(H)\in\iota(\mathbb H_{\widehat R})\}=\mathcal P_R\cap\mathcal H_{\widehat R}$.
- **Proposition 5.4** (p. 65). The Frobenius-twisted congruence criterion for $\mathcal H_R$.
- Remark 5.5 (modules are not treated) and Examples 5.6–5.10 (pp. 65–70).

### 3.2 V5A2 notes (6 March 2025 version)

| lecture | targets (locators are statement numbers; pages in Appendix A) |
|---|---|
| 1 (11 Oct 2024) | Def 1.1 ($q$-Pochhammer), Def 1.2 (Nahm sum), Prop 1.5 ($f_1=q^{-1/48}(-q^{1/2};q)_\infty$), Def 1.6 ($\mathcal H=\lim\mathbb Z[q]/(1-q^m)^n=\lim\mathbb Z[q]/(q;q)_n$) |
| 2 (18 Oct 2024) | Table 1 ($q$-calculus), Props 2.1, 2.2, 2.5, Cor 2.6 ($(t;q)_\infty^{-1}=\sum t^n/(q;q)_n$), Prop 2.7 ($\log(t;q)_\infty$), Defs 2.8–2.9 (Bernoulli numbers, polylogarithms), Lemmas 2.10–2.12, Prop 2.13 (asymptotics of $(t;q)_\infty$ at $q=1$: $\exp(\mathrm{Li}_2(t)/h)\sqrt{1-t}\,O(h)$), Def 2.16, Lemmas 2.17–2.19 (Bernoulli polynomials), Prop 2.20 (asymptotics at $\zeta_m$ with the cyclic factor $\prod_i(1-\zeta_m^it)^{i/m}$) |
| 3 (8 Nov 2024) | Prop 3.3 ($\mathcal H\cong\{(h_m):h_m=h_{pm}$ in $\mathbb Z_p[\zeta_m][[q-\zeta_m]]\cong\mathbb Z_p[\zeta_{pm}][[q-\zeta_{pm}]]\}$), Cor 3.4 ($\mathcal H\hookrightarrow\mathbb Z[[q-1]]$), Cor 3.5 ($\mathcal H\hookrightarrow\prod_m\mathbb Z[\zeta_m]$), Def 3.6 ($\mathcal H_{\mathcal O_K[1/\Delta]}$ with $\Delta=\mathrm{disc}(K)$: $h_m=\varphi_p(h_{pm})$ in $(\mathcal O_K)^\wedge_p[\zeta_m,1/\Delta][[q-\zeta_m]]$ for all $p\nmid\Delta$), Remarks 3.7–3.8 (uniqueness of Frobenius on finite étale algebras; abelian case; the expected $K_3(K)\to\mathrm{Pic}$) |
| 4 (15 Nov 2024) | Lemma 4.1, Thm 4.2 ($\mathrm{Li}_2(e^h)+h\mathrm{Li}_1(e^h)$ well defined $\mathbb C\setminus2\pi i\mathbb Z\to\mathbb C/(2\pi i)^2\mathbb Z$), Def 4.3 (Bloch–Wigner), five-term relations (4.5)–(4.6), Prop 4.5 ($f_a(t,q)-f_a(qt,q)=tq^{a/2}f_a(q^at,q)$), Cor 4.6, Props 4.8, 4.10, Cor 4.11, Prop 4.12 ($V=-\mathrm{Li}_2(1-Z)-\frac a2\log^2Z$), Thm 4.13 ($f_a(t,q)\sim\exp(V(t^m)/(m^2h))\cdot O(h)$ at $\zeta_m$) |
| 5 (22 Nov 2024) | Def 5.1 (admissible), Prop 5.3, Def 5.4 (λ-ring), Def 5.5 (plethystic exponential), Thm 5.6 (Kontsevich–Soibelman, Efimov: $\sum(-1)^{an}q^{\frac12an^2-\frac12an}t^n/(q;q)_n$ is admissible), Examples 5.7–5.8 |
| 6 (29 Nov 2024) | Def 6.1 (Dedekind zeta), Def 6.2, Thm 6.3 (class number formula), Thm 6.4 (Dirichlet), Def 6.5 (regulator), Def 6.9 ($K$-theory anima), Def 6.11, Thm 6.13 (Borel ranks), Def 6.14 (Borel regulator), Thm 6.16, Defs 6.17–6.18 (pre-Bloch and Bloch groups), Thm 6.19 (Bloch: $K_3(K)\otimes\mathbb Q\cong B(K)$, Borel regulator = Bloch–Wigner) |
| 7 (6 Dec 2024) | Prop 7.1 (group completion), Def 7.3 (condensed sets), Def 7.5 (continuous $K$-theory anima), Thm 7.6 (Clausen: $\pi_iK^{\mathrm{cont}}(\mathbb C)=\mathbb Z$, $\mathbb C/(2\pi i)^n\mathbb Z$ for $i=2n-1$, $0$ else), Remark 7.7 (liquid/gaseous) |
| 8 (13 Dec 2024) | Props 8.1–8.6 (the $\mathbb P^1(F)$ resolution and spectral sequence proving Bloch's theorem rationally), Remark 8.7; Appendix A (the spectral sequence diagrams) |
| 9 (20 Dec 2024) | Def 9.1 (relative $K$-theory $K(R/\mathbb Z[M])=K(R)\otimes_{\mathbb S[*/M]}\mathbb S$), Remarks 9.2–9.4 (log version), Example 9.5, relative motivic cohomology $\mathbb Q(2)(R/\mathbb Z[t^{\pm}])$, the universal dilogarithm, Prop 9.6 ($\mathrm{Li}_2^{univ}(t)=-\mathrm{Li}_2^{univ}(1-t)$), Remark 9.7 |
| 10 (17 Jan 2025) | the relative Habiro ring for the Nahm ring over $\mathbb Z[t_1,\dots,t_N]$ (10.1); Remark 10.1 ($V^{univ}\in H^1(\mathbb Z(2)(R/\mathbb Z[t]))$ with $\nabla^{\log}_{t_i}V^{univ}=z_i$); de Rham, Betti and étale realisations; the étale realisation of $\mathrm{Li}_2^{univ}$ is $\prod_i(1-\zeta_m^it)^{i/m}$, recovering the CGZ cyclic dilogarithm |
| 11 (24 Jan 2025) | three methods for asymptotics; Prop 11.2 (Poisson/theta), Thm 11.3 (the $q$-difference equation of $f_a$ has a unique solution $\equiv1\bmod t$ in the line bundle $L_m$ over $R_m[[h]]$) |
| 12 (31 Jan 2025) | the étale $\mathbb Z[t]$-algebra $R=\mathbb Z[t,z,1/\delta]/(1-z-(-1)^atz^a)$ with $\delta=z+a(1-z)$, $R_m=R[\zeta_m,t^{1/m}]$, $S_m=R_m[\frac12,\sqrt\delta]$; Thm 12.1 ($g_{a,m}(t^{1/m},q)\in\frac{\sqrt\delta}{\sqrt[m]{\varepsilon_m}}R_m[\frac1m][[\varepsilon]]\subseteq\frac{\sqrt\delta}{\sqrt[m]{\varepsilon_m}}S_m[\frac1m][[\varepsilon]]$, with $\varepsilon_m\in H^1(R_m,\mu_m)$ the mod-$m$ regulator of $V^{univ}$, and the line bundles $L_m$, $L'_m$), Prop 12.3 (the line bundle $L_1$ over $\widehat R[1/p][[q-1]]$ cut out by the Dwork condition), Thm 12.4 ($g_{a,1}\in\sqrt\delta\,\widehat R[1/p][[q-1]]$, from admissibility), Thm 12.5 (base change of $L_1$ recovers $L_m$), Thm 12.6 (recovers the asymptotics); aspiration: $S$-families of shtukas over $\operatorname{Spec}\mathbb Z\times S$ |

### 3.3 V5A4 notes

| lecture | targets |
|---|---|
| 1 (11 Apr 2025) | Ex 1.1 ($q$-de Rham prism $(\mathbb Z_p[[q-1]],[p]_q)$); Conj 1.2 (attributed to [Sch17, Conj 1.1]: for smooth $R$ with étale $\operatorname{Spec}R\to\mathbb A^d$, a cohomology theory for smooth proper $R$-varieties valued in finitely generated $R[[q-1]]$-modules with $q$-connection, reducing to de Rham with Gauss–Manin at $q=1$); Thm 1.3 (Wagner [Wag24, Thm 1.7]); Examples 1.4 (Legendre family), 1.5 ($q$-hypergeometric); Remark 1.6; Thm 1.7 (Meyer–Wagner [MW24, Thm 1.7]); **Thm 1.8 (Scholze): an explicit ring stack over an analytic version of the Habiro ring yields a full six-functor formalism**; Remark 1.9 |
| 2 (2 May 2025) | Def 2.1 (framed algebra: étale map to $\mathbb A^d$ or $\mathbb G_m^d$), Def 2.3 ($q$-derivative), Remarks 2.4–2.5, Lemma 2.6 (twisted Leibniz), Def 2.7 ($q$-de Rham complex), Def 2.10 (modified $q$-derivative), Def 2.12 ($q$-Hodge complex), Def 2.15 ($q$-connection), Ex 2.17 (Weyl algebra), Def 2.18 (modified $q$-connection), Remark 2.20, Cor 2.21 (modified $q$-connections on the torus = commuting $\gamma_i$-semilinear $\gamma_{i,M}$), Props 2.22 (symmetric monoidal), 2.23 (fully faithful on $(q-1)$-torsion-free modules), Question 2.24, Ex 2.25 (modified $q$-connections = $\mathrm{QCoh}((\mathbb G_m/q^{\mathbb Z})^d)$), Prop 2.26 ($q\Omega$ and $q\mathrm{Hdg}$ compute $R\mathrm{Hom}(1,1)$), Ex 2.27, Cor 2.28 ($E_\infty$ structures) |
| 3 (9 May 2025) | Defs 3.1–3.2 (logarithmic $q$-derivatives), Ex 3.4, Lemma 3.5 (étale algebras over $\mathbb Z[q^{\pm}][T^{\pm}]/(q-1)^n$), Thm 3.6 (BS22 §16; Wagner Thm 1.5: coordinate independence of $q\Omega$ over $R[[q-1]]$), Ex 3.7, Prop 3.8 and Cor 3.9 (over $\mathbb Q$: $q$-connections = connections), Def 3.10 ($h$-connections), Prop 3.12, Cor 3.14, Examples 3.16–3.18, Def 3.19 ($R^{(m)}=R\otimes_{\mathbb Z[T^{\pm}]}\mathbb Z[\zeta_m][T^{\pm1/m}]$), Ex 3.20, Def 3.21 ($R_m=(R^{(m)}[q^{\pm}])^\wedge_{\Phi_m}$), (3.1) Frobenius gluing, Def 3.23 ($\mathcal H_{\mathbb Z[T^{\pm}]}$) |
| 4 (23 May 2025) | Def 4.1 ($\mathcal H_{(R,\square)}=\lim R_n$), Def 4.2, Prop 4.3 (Taylor description of $\mathcal H_{(R,\square)}$ with $\varphi_p(f_{pm})=f_m$), Remark 4.4, Ex 4.5 ($q$-multinomial element; proof in App. A), Def 4.6 ($q$-Habiro–Hodge complex: Koszul complex of $\gamma_i-1$ on $\mathcal H_{(R,\square)}$), (4.3), Remark 4.7 (Bockstein), Thm 4.8 ([Wag22, Prop 5.7]: $W_m(R)[q]/(1-q^m)\twoheadrightarrow H^0(q\mathrm{Hdg}_{(R,\square)}/(1-q^m))$, inducing a coordinate-independent surjection from the de Rham complex of $W_m(R)[q]/(1-q^m)$), Thm 4.9 ([Wag22, Thm 5.7]: $q\text{-}W_m\Omega^\bullet_R\cong H^\bullet(q\mathrm{Hdg}_{(R,\square)}/(1-q^m))$), Remarks 4.10–4.11, Ex 4.12 (torus), Prop 4.13 ($W_p(R)\hookrightarrow H^0(\dots/(1-q^p))$ for $R=\mathbb Z[T^{\pm}]$), Remark 4.14, Prop 4.15 (ghost square), Remarks 4.16–4.17 |
| 5 (30 May 2025) | Ex 5.1, Prop 5.2 (rational: $\Omega^\bullet_{R\otimes\mathbb Q(\zeta_d)}\cong H^\bullet(q\mathrm{Hdg}_{(R,\square)}\otimes\mathbb Q(\zeta_d))$), Prop 5.3 (torsion-freeness and injection into $\prod_{d\mid m}$), Thm 5.4 (Wagner: the image is $q\text{-}W_m\Omega^i$), Remarks 5.5–5.6, **Thm 5.7 (Wagner [Wag24, Thm 5.1], variant: no functor $\mathrm{Alg}^{sm}_{\mathbb Z}\to\mathrm{CAlg}(D(\mathbb Z[q^{\pm}]))$ with (i) $q\mathrm{Hdg}_R\simeq(\mathcal H_{(R,\square)})^{h\mathbb Z^d}$ for all étale framings and (ii) $H^0\otimes\mathbb Q(\zeta_d)\cong R\otimes\mathbb Q(\zeta_d)$)**, Remarks 5.8–5.10, Lemma 5.11 ($L_{R/\mathbb F_p}=0$ for perfect $R$), Lemma 5.12, Cor 5.13, Prop 5.14, proof with $R=\mathbb Z_p\langle t^{1/p^\infty}\rangle/(t-p)$ |
| 6 (20 Jun 2025) | Conj 6.1 (Wagner: symmetric monoidal functor on smooth $R$ with $1/d!\in R$ to $D(\mathcal H)$ with (i), (ii)), Remark 6.2, Def 6.3 (THH), Conj 6.4 and Thm 6.5 (Devalapurkar), Examples 6.6–6.9 (ku-lifts, genuine fixed points, refined THH, bad primes), **Examples 6.10–6.11 (transmutation: $D_{\mathrm{Hab}}(X)\simeq D_{qc}(X^{\mathrm{Hab}})$, $\mathbb G_m^{\mathrm{Hab}}=\mathbb G_{m,\mathcal H}/q^{\mathbb Z}$), Prop 6.12 (functors commuting with finite limits and gluing are determined by $F(\mathbb A^1)$), Remarks 6.13–6.14** |
| 7 (4 Jul 2025) | $(-)^{\mathrm{Hab}}:\mathrm{Sch}^{sft}_{\mathbb Z}\to\mathrm{AnStk}_{\mathcal H^{\mathrm{an}}}$ and its extension to Berkovich spaces via normed ring stacks; Remark 7.1, Examples 7.2–7.3 ($\mathbb Z((u))_\square$), Defs 7.4–7.6 (overconvergent functions, discs, $\mathbb A^{1,\mathrm{an}}$), Remark 7.7, **Def 7.8 ($\mathcal H^{\mathrm{an}}$)**, Remark 7.9, Lemma 7.10 ($\mathcal H\to\mathcal H^{\mathrm{an}}$), Prop 7.11 (Habiro cohomology of $D_0(1)^\dagger$ is trivial), **Def 7.12 ($(\mathbb G_m)^{\mathrm{Hab}}=\mathbb G^{\mathrm{an}}_{m}/G$)**, Remark 7.13, Lemma 7.14 (full faithfulness), Ex 7.15 ($B_1$; $\mathcal H^{\mathrm{an}}\ne0$), Remark 7.16 ($B_m$; $\mathcal H^{\mathrm{an}}/p\ne0$; $q$-divided powers fail) |
| 8 (11 Jul 2025) | the variant without condition (ii); Lemma 8.1 ($G$ at $\zeta_m$); Ex 8.2 ($q=1$: the analytic de Rham stack; expected specialisations); Ex 8.3 ($(-1)^{\mathrm{Hab}}=q^{1/2}$); **Def 8.4 ($1-_{\mathrm{Hab}}x$)**; Cartier duality; the ring stack with $x-y=x(1-y/x)$ and associativity via the five-term relation; Remark 8.5; Ex 8.6 ($1+_{\mathrm{Hab}}1$) |
| App. A–B | Lemma A.1 (Ex 4.5); Thm B.1 (Dold–Kan), Def B.2 (cotangent complex), Defs B.3–B.8 (animation), Ex B.7, B.10, Remark B.9, Prop B.11 |

The course description announces two further topics not in the notes: the realisation of Berkovich motives,
and stacky étale cohomology of rigid varieties over fields of equal characteristic zero.

### 3.4 Wagner's theorems carried by the roadmaps

- **Wagner v5**:
  - Lemma 2.9 and Definition 2.10 ($q\text{-}W_m$);
  - Proposition 2.15 (Koszul exactness), Proposition 2.28 ($W_m\hookrightarrow q\text{-}W_m$), Proposition 2.36 and
    Corollary 2.37;
  - Proposition 2.48 (étale), Corollary 2.52 (Frobenius obstruction);
  - Propositions 3.12 and 3.17 ($q$-dRW complexes with Frobenii), Proposition 3.31, Corollaries 3.33–3.34;
  - Propositions 4.1–4.2;
  - **Theorem 4.27**: for $R$ smooth over a perfectly covered Λ-ring $A$ and all $m$,
    $(q\text{-}W_m\Omega^*_{R/A})^\wedge_{(q-1)}\cong H^*(q\mathrm{Hdg}^*_{R/A,\square}/(q^m-1))$;
  - Lemma 4.36, Corollaries 4.37–4.38;
  - **Theorem 5.1**: no functor $q\mathrm{Hdg}_{-/A}:\mathrm{Sm}_A\to\widehat D_{(q-1)}(A[[q-1]])$ realises these isomorphisms
    compatibly with Frobenii, if $A$ is not a $\mathbb Q$-algebra.
- **Wagner v2**:
  - Corollary 2.4 (gluing from $\Phi_d$-completions);
  - **Theorem 2.9**: for perfectly covered $A$, $\mathcal H_{R/A,m}/(q^m-1)\simeq q\text{-}W_m(R/A)$, and
    $\mathcal H_{R/A,m}$ is the unique $(q^m-1)$-complete $E_\infty$ lift, hence static;
  - Lemma 2.12 (the Taylor equaliser), **Corollary 2.13** ($\mathcal H_{\mathcal O_F[1/\Delta]/\mathbb Z}=\mathcal H_R$ of GSWZ),
    Remark 2.14;
  - Definition 3.2 ($q$-Hodge filtrations), Lemma 3.3 (no section), Proposition 3.7;
  - **Theorem 3.11**: Habiro-complete symmetric monoidal factorisation of $q\mathrm{Hdg}$, and for each $m$ an
    exhaustive filtration of $q\mathrm{Hdg}/(q^m-1)$ with graded pieces $\Sigma^{-*}q\text{-}W_m\mathrm{dR}^*$;
  - Example 3.12, Corollary 3.13 ($q\mathrm{Hdg}_{R/A}=\mathcal H_{R/A}$ for étale $R$);
  - Lemma 3.15, Propositions 3.19, 3.22, Corollaries 3.25–3.26, 3.31, Propositions 3.39, 3.43, 3.47, Corollary 3.54;
  - **Theorem 4.11** (smooth, primes $\le\dim$ inverted), Corollary 4.16 (partial operad), **Theorems 4.22,
    4.29** (quasi-regular), Corollary 4.34;
  - **Theorem A.1** (global $q$-de Rham functor over $A[[q-1]]$ for Λ-rings $A$ that are $p$-torsion-free for
    all $p$);
  - Lemmas B.2–B.4, B.8 (Habiro-complete and solid spectra).

## 4. (b) The dependency chain

### 4.1 The pinned baseline

Each declaration below was read in its source file at the pinned commits. Line numbers refer to those commits.

**Cyclotomic polynomials** (Mathlib, `Mathlib/RingTheory/Polynomial/Cyclotomic/`).
- `Basic.lean`:
  - `Polynomial.cyclotomic` (l. 230);
  - `prod_cyclotomic_eq_X_pow_sub_one` (l. 338), giving $\prod_{d\mid n}\Phi_d=X^n-1$;
  - `cyclotomic_eq_prod_X_sub_primitiveRoots` (l. 476);
  - `cyclotomic_prime_pow_eq_geom_sum` (l. 509), giving $\Phi_{p^{n+1}}=\sum_{i<p}X^{ip^n}$;
  - `separable_cyclotomic` (l. 653).
- `Expand.lean`:
  - `cyclotomic_expand_eq_cyclotomic_mul` (l. 38): for $p\nmid n$, $\mathrm{expand}_p\Phi_n=\Phi_{np}\Phi_n$;
  - `cyclotomic_expand_eq_cyclotomic` (l. 87): for $p\mid n$, $\mathrm{expand}_p\Phi_n=\Phi_{np}$;
  - `cyclotomic_mul_prime_eq_pow_of_not_dvd` (l. 131), `cyclotomic_mul_prime_dvd_eq_pow` (l. 145) and
    `cyclotomic_mul_prime_pow_eq` (l. 156), the reductions modulo $p$.
- `Roots.lean`: `isRoot_cyclotomic_iff` (l. 98), `cyclotomic.irreducible` (l. 184), `cyclotomic.irreducible_rat`
  (l. 190), `cyclotomic.isCoprime_rat` (l. 196).
- `Factorization.lean`:
  - `natDegree_of_dvd_cyclotomic_of_irreducible` (l. 87);
  - `normalizedFactors_cyclotomic_card` (l. 142): over a finite field of cardinality $\ell^f$ with $\ell\nmid n$,
    $\Phi_n$ has $\varphi(n)/\mathrm{ord}_n(\ell^f)$ distinct irreducible factors. This is the input for the repair of
    Wagner v2 Lemma 2.12 (§8).
- `Eval.lean`: `eval_one_cyclotomic_prime`, `eval_one_cyclotomic_not_prime_pow` (l. 137).
- Tau Ceti:
  - `TauCeti/RingTheory/Cyclotomic/Basic.lean`: `TauCeti.Cyclotomic e`, an exact computable model of
    $\mathbb Z[X]/\Phi_e$ identified with `AdjoinRoot`;
  - `TauCeti/RingTheory/Cyclotomic/{Lift,Conjugation}.lean` and `TauCeti/NumberTheory/Cyclotomic/*`
    (irreducibility, automorphisms, fixed fields).
- Missing: cyclotomic resultants $\mathrm{Res}(\Phi_m,\Phi_n)$ and the comaximality lemma $\mathbb Z[q]/(\Phi_m,\Phi_n)$ (HC.4 owns
  them); `Polynomial.resultant` exists in general (`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`).

**Completions** (Mathlib).
- `Mathlib/RingTheory/AdicCompletion/Basic.lean`: `IsHausdorff` (l. 46), `IsPrecomplete` (l. 50), `IsAdicComplete`
  (l. 56), `AdicCompletion` (l. 171).
- `Algebra.lean`: the `CommRing` instance (l. 97) and `AdicCompletion.evalₐ` (l. 132).
- `Functoriality.lean`: `AdicCompletion.map` (l. 111) with `map_id` (l. 160) and `map_comp` (l. 166).
- `RingHom.lean`: `IsAdicComplete.liftRingHom`.
- `Completeness.lean`: `AdicCompletion.isAdicComplete` (l. 184, finitely generated ideal).
- `Mathlib/Topology/Algebra/TopologicallyNilpotent.lean`: `IsTopologicallyNilpotent`.
- Also `IsLinearTopology`, `Ideal.adicTopology` and `UniformSpace.Completion`.
- Missing: completion at a multiplicative *directed family* of ideals such as $\{(q;q)_n\}$ or $\{\Phi_d\}$ (HC.1),
  derived completion (DD.1), Habiro completion (HR.2).

**Power series** (Mathlib, `Mathlib/RingTheory/PowerSeries/`).
- `PowerSeries`.
- `Substitution.lean`: `HasSubst`, `subst` (l. 158), `substAlgHom` (l. 171). Substitution needs a topologically
  nilpotent argument; this is the tool for re-expansion $x\mapsto x+\zeta_{pm}-\zeta_m$.
- `Evaluation.lean`: `HasEval`, `eval₂`, `aeval`.
- `rescale`, `expand`, `derivative`, `exp` (`Exp.lean`, l. 49), `log` (`Log.lean`, l. 50), `IsRestricted`,
  `WithPiTopology`, `MvPowerSeries.subst`, `LaurentSeries`.
- `Polynomial.hasseDeriv` (`Mathlib/Algebra/Polynomial/HasseDeriv.lean`, l. 59).
- Bernoulli: `bernoulli` (`Mathlib/NumberTheory/Bernoulli.lean`, l. 195), `Polynomial.bernoulli`.
- Tau Ceti `RingTheory/Huber/{LaurentSeries,Restricted,WeightedRestrictedSeries}`.

**Witt vectors and δ-rings.**
- Mathlib has only $p$-typical Witt vectors:
  - `WittVector` (`Mathlib/RingTheory/WittVector/Defs.lean`, l. 52);
  - `WittVector.ghostComponent`/`ghostMap` (`Basic.lean`);
  - `frobenius` (`Frobenius.lean`, l. 221) and `frobeniusEquiv`;
  - `verschiebung` (`Verschiebung.lean`, l. 110);
  - `teichmuller` (`Teichmuller.lean`, l. 93);
  - `TruncatedWittVector` (`Truncated.lean`, l. 62);
  - `WittVector.isAdicCompleteIdealSpanP` (`Complete.lean`, l. 116).
- No big Witt vectors, no truncation sets, no δ-rings, no Λ-/λ-rings and no Adams operations. The
  documentation of `BinomialRing` (`Mathlib/RingTheory/Binomial.lean`, l. 76) records the λ-ring connection only
  as a TODO. `DividedPowers` (`Mathlib/RingTheory/DividedPowers/Basic.lean`, l. 78) exists.
- Tau Ceti has no Witt vectors of rings (only Witt groups of quadratic forms) and no δ-rings.

**$q$-analogues.**
- Absent. The TODO of `Mathlib/RingTheory/Polynomial/Pochhammer.lean` lists "q-factorials, q-binomials,
  q-Pochhammer".
- `ascPochhammer`/`descPochhammer` are the ordinary rising and falling factorials. Tau Ceti's
  `TauCeti/RingTheory/Polynomial/Pochhammer.lean` only strengthens `descPochhammer`.
- No polylogarithm or dilogarithm function exists.

**Algebra supporting the gluing.**
- `Algebra.FormallyEtale` (`Mathlib/RingTheory/Etale/Basic.lean`, l. 47) with `comp_bijective` (l. 77) and
  `iff_comp_bijective` (l. 86), i.e. unique lifting along square-zero extensions; `Algebra.Etale` (l. 206);
  `Algebra.FormallySmooth.lift`.
- `HenselianRing` (`Mathlib/RingTheory/Henselian.lean`, l. 94).
- `Module.Invertible` and `CommRing.Pic` (`Mathlib/RingTheory/PicardGroup.lean`, l. 429).
- Number fields: `NumberField.discr`, `RingOfIntegers`, `IsPrimitiveRoot`, `IsCyclotomicExtension`,
  `CyclotomicField`, `PadicInt`, `Padic`. Tau Ceti: `RingTheory/Frobenius.lean`, `NumberTheory/NumberField/Frobenius.lean`.

**Condensed mathematics** (Mathlib, `Mathlib/Condensed/`).
- `CondensedSet` (`Basic.lean`, l. 51); `CondensedMod`, `CondensedAb`.
- `LightCondensed`/`LightCondSet` (`Light/Basic.lean`, ll. 28, 35).
- `LightCondMod` (`Light/Module.lean`, l. 42), `LightCondAb` (l. 85) and the free–forgetful adjunction (l. 73).
- Monoidal and closed structure on light condensed modules (`Light/Monoidal.lean`, ll. 29–53).
- `CountableAB4Star` and `IsGrothendieckAbelian` instances (`Light/AB.lean`, ll. 31, 35).
- Epimorphism criteria (`Light/Epi.lean`).
- `internallyProjective_iff_tensor_condition` (`Light/InternallyProjective.lean`).
- `LightCondensed.internallyProjective_free_natUnionInfty` (`Light/Sequence.lean`, l. 302, a public theorem absent
  from the declaration index).
- `topCatToLightCondSet` (`Light/TopComparison.lean`, l. 35).
- **Solid:** `Condensed.profiniteSolid` and `CondensedMod.IsSolid` (`Solid.lean`, ll. 48, 83), both κ-condensed.
  Their documentation states that `IsSolid` "is not the correct definition of solid R-modules for a general R"
  and that solidity of `profiniteSolid ℤ` is a TODO.
- **Analytic:** nothing on analytic rings, liquid or gaseous structures, or analytic stacks.
- Tau Ceti has no condensed material.

**Stacks and derived categories.**
- Mathlib: `Pseudofunctor.IsStack` and descent data (`Mathlib/CategoryTheory/Sites/Descent/IsStack.lean`);
  `DerivedCategory` (`Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`, l. 87) with t-structures;
  `Pretriangulated`; `SSet.Quasicategory` (basic only); `Algebra.Extension.cotangentComplex` (the naive complex);
  `AlgebraicGeometry.Scheme`.
- No ∞-categorical derived categories, no algebraic stacks, no ring stacks, no six-functor formalisms.
- Tau Ceti: `TauCeti.ExactStructure` (`TauCeti/CategoryTheory/Exact/ExactStructure.lean`) and split $K_0$. No
  stacks.

**Prismatic and $p$-adic material in Tau Ceti.**
- No prisms, prismatic cohomology or perfectoid rings.
- Present: Huber rings (`TauCeti/RingTheory/Huber/*`, e.g. `IsHuberRing`, pairs of definition, Tate rings,
  pseudo-uniformizers, restricted and weighted restricted series, Laurent series), adic spectra
  (`TauCeti/AlgebraicGeometry/AdicSpace/*`: `Spa`, valuation spectra), and roots of unity.
- Mathlib supplies `PreTilt` and `WittVector.fontaineThetaModPPow`, the start of $A_{\inf}$.

### 4.2 The chain, layer by layer

Each object is listed with its source locator and its owner stage.

**L0 — baseline.** As in §4.1.

**L1 — cyclotomic completions and $q$-analogues** (owner `HabiroCyclotomicCompletions`).
- $R[q]^S=\lim_fR[q]/(f)$ over products of $\Phi_n$, $n\in S$, and the cofinality of $(q;q)_N$ (Habiro §§2–3;
  GSWZ (eq:Hnaive); V5A2 Def 1.6) — HC.1.
- The $q$-toolkit — HC.1, as enlarged in §6.1:
  - $q$-integers, $q$-factorials, $q$-binomial and $q$-multinomial coefficients;
  - finite and infinite Pochhammer symbols $(x;q)_n$, $(x;q)_\infty$;
  - the $q$-binomial theorem and Euler identities (V5A2 Cor 2.6);
  - $\log(t;q)_\infty$ (V5A2 Prop 2.7; GSWZ (logpoc));
  - Jackson $q$-derivatives;
  - plethystic exponential and Adams operations on $\mathbb Z((q))[[t]]$ (V5A2 Defs 5.4–5.5).
- Factorial expansions and $\mathcal H\ni q^{-1}$ — HC.2.
- Evaluation, Taylor maps $\iota_m:\mathcal H\to\mathbb Z[\zeta_m][[x]]$ and $p$-adic re-expansion — HC.3.
- Comaximality of $\Phi_m,\Phi_n$ (Wagner v5 Lemma 2.1), Habiro's Theorems 4.1, 5.2, 6.1, and the naive ring
  $\mathbb H_R$ with GSWZ §5.1 — HC.4.
- Modules and inversion of primes — HC.5. Interfaces — HC.6.

**L2 — Witt vectors, Λ-rings, δ-rings.**
- Big Witt vectors $W_S$ (Hesselholt §1) — QW.0.
- Λ-rings, Adams operations, perfect and perfectly covered Λ-rings (Hesselholt 1.21–1.24; Wagner v5 Remark 2.47)
  — QW.1.
- δ-rings, Frobenius lifts, $p$-completely étale extension of δ-structures (BS22 §2, Lemmas 2.18, 2.28) — PR.0.
- The unique Frobenius lift on $\widehat R_p$ for étale $R$ over a Λ-ring (GSWZ Def 1.1; V5A2 Remark 3.7; Wagner v5
  4.9) — HR.1, as an application of PR.0.

**L3 — $q$-Witt vectors** (owner `QWittVectors`).
- $q\text{-}W_m(R)$, ghost maps, Koszul exactness (Wagner v5 §§2.1–2.3) — QW.2.
- $s_m$, $c_m$, relative $q\text{-}W_m(R/A)$ (§§2.4–2.5) — QW.3.
- Étale base change and the Frobenius obstruction (§2.6) — QW.4.

**L4 — Habiro completion, gluing, relative and number-field Habiro rings.**
- Derived completion (DD.1). Habiro-complete modules and spectra, the idempotent algebra $\mathbb S_{\mathcal R}$, Lemmas
  B.2–B.4 (Wagner v2 App. B) — HR.2. The solid comparison B.6–B.8 — HR.2 with SA.1.
- Gluing from $\Phi_d$-completions (Wagner v2 Cor 2.4) — HR.3.
- $\mathcal H_{R/A,m}$ and Theorem 2.9 — HR.4.
- $\mathcal H_{R/A}$, the Taylor equaliser (Lemma 2.12) and Corollary 2.13 — HR.5.
- The *elementary* Taylor-glued ring for étale algebras over toric Λ-bases: GSWZ Def 1.1 for $A=\mathbb Z$, V5A4
  Prop 4.3 (as a definition), GW25 Definition 1.1 — HR.1 (decision D3). Its specialisation $\mathcal H_R$ for
  $R=\mathcal O_K[1/\Delta]$, with the arithmetic properties of GSWZ §1.4 and §5.2 — HB.6.

**L5 — $K$-theoretic inputs.**
- Group completion and $K$-theory spaces (V5A2 L6–7) — `GeneralAlgebraicKTheory`, `StableHomotopyKTheory`.
- Borel's ranks and regulator (V5A2 Thms 6.13, 6.16) — `BorelRegulators`.
- Pre-Bloch and Bloch groups $P(F)$, $B(F)$, the five-term relation, Bloch–Wigner $D$ — K3BlochGroups V.3.
  The job BP-K3BlochGroups reserves node ids `K3BlochGroups:V.3/pre-bloch-group`, `…/bloch-group`,
  `…/five-term-relation`, `…/bloch-wigner-dilogarithm` and `…/bloch-wigner-five-term`.
- Suslin's exact sequence (reserved `K3BlochGroups:V.4/suslin-exact-sequence`) — V.4.
- Bloch's theorem $K_3(K)\otimes\mathbb Q\cong B(K)$ (V5A2 Thm 6.19) — V.4–V.5.
- Classical and single-valued polylogarithms (reserved `Polylogarithms:P.1/*`) and the weight-two regulator — P.1–P.2.
- Étale Chern classes $c_{\zeta_m}$ with finite coefficients, CGZ's integral Bloch conventions and excluded
  primes — HB.1. HB.1 uses Kummer theory from `tauceti:…/ProfiniteCohomology` Layer 9 and continuous cohomology
  from M.1.
- The cyclic quantum dilogarithm and $\varepsilon_m=c_{\zeta_m}^2$ (CGZ Thm 1.6; Hutchinson Thm 3.1) — HB.2.
- The $p$-adic dilogarithm $D_p$ (Coleman) — ColemanIntegration L2 and PadicHodgeRegulators D.1.
- $D_p$ as the syntomic regulator (Besser–de Jeu) — D.2–D.3.
- GSWZ Theorem 9 ($D_p:K_3(L;\mathbb Z_p)\cong p^2\mathcal O_L$ for unramified $L$, $p>3$, generated by the classes $[\zeta]$),
  with Lemma 3.1 and Propositions 3.2–3.3 as its proof steps — D.3.
- $K_3(K_p;\mathbb Z_p)\cong H^1(K_p,\mathbb Z_p(2))$ — `KTheoryFiniteLocalFields` L.6 and `MotivicEtaleKTheory` M.7.
- Continuous $K$-theory $K^{\mathrm{cont}}(\mathbb C)$ (V5A2 Def 7.5, Thm 7.6): no owner. It is excluded by decision D6 and
  only motivates.

**L6 — $K_3$-indexed Habiro modules** (owner HB.7).
- Invertible $L_p(\xi)$-sections (GSWZ Def 1.3), Theorem 1 through Lemma 3.4–Cor 3.7, Def 3.9, Theorem 10 and
  Cor 3.10.
- Global modules (Def 1.4), Theorem 2, Proposition 1.5, and the abelian generator.

**L7 — Nahm sums and admissibility.**
- Nahm equations and Bloch classes — HB.3.
- Root-of-unity asymptotics: V5A2 L2 Props 2.13, 2.20; L4 Thm 4.13; CGZ Thm 7.1 — HB.4 (and HB.2 for the
  cyclic factor).
- Modular functions at cusps — HB.5a. The Nahm implication (CGZ Thm 7.5) — HB.5.
- Admissible and $m$-admissible series, formal Gaussian integration, Theorems 3, 4, 6, 7, 8 — HB.8.
- Theorem 5 and Corollaries 1.10–1.11 — HB.9. The V5A2 L10–L12 relative reformulation — HB.9 (decision D5).
- Theorems 11–12 and the examples — HB.10.

**L8 — $q$-de Rham–Witt complexes and framed complexes** (owner `QWittVectors`).
- $q$-V- and $q$-FV-systems, $q\text{-}W_m\Omega^*_{R/A}$, Frobenii, étale base change (Wagner v5 §3) — QW.5.
- Framed $q$-de Rham and $q$-Hodge complexes $q\Omega^*_{R/A,\square}$, $q\mathrm{Hdg}^*_{R/A,\square}$ (Wagner v5 4.7; V5A4
  Defs 2.1–2.12, 3.1–3.2) and Theorem 4.27 — QW.6.
- Animated $q$-dRW, Nygaard filtrations (Wagner v2 3.21–3.31) and the no-go Theorem 5.1 — QW.7.

**L9 — algebraic Habiro cohomology** (owner `HabiroCohomologyFoundations`).
- $q$-connections and modified $q$-connections (V5A4 L2–L3) — HQ.1.
- The global $q$-de Rham functor $q\Omega_{-/A}$ over $A[[q-1]]$ (Wagner v2 Thm A.1; Sch17 Conj 1.1/3.1; BS22 §16
  $p$-adically via PR.6) — HQ.1.
- Derived $q$-de Rham $q\mathrm{dR}_{-/A}$ (Wagner v2 1.6, 3.6) and the twisted complexes $q\Omega^{(m)}$ with their
  Nygaard filtrations (3.14–3.22) — HQ.2.
- $q$-Hodge filtrations (Def 3.2), the Habiro–Hodge complex $q\mathrm{Hdg}_{-/A}$ and Theorem 3.11 (with §§3.5–3.7) —
  HQ.3.
- The framed Habiro ring $\mathcal H_{(R,\square)}$, the $q$-Habiro–Hodge complex (V5A4 Defs 3.19–4.6) and V5A4
  Thms 4.8, 4.9, 5.4, 5.7 — HQ.4.
- Existence: Theorems 4.11, 4.22, 4.29, Corollaries 4.16, 4.34 — HQ.5. Trace-theoretic existence — HQ.5-trace
  (from RT.4:q-Hodge).

**L10 — condensed, solid and analytic foundations** (owner `SolidAnalyticRings`).
- Light condensed abelian groups (RC §2) — SA.0.
- Solid abelian groups and spectra (RC §3; Wagner v2 B.6) — SA.1.
- Analytic rings, completions, idempotent algebras, smashing spectra (RC §4, §5.1) — SA.2.
- $\mathbb Z[T]_\square$, $R_\square$, discrete Huber pairs and their descent (RC §§5.2–5.6) — SA.3.
- Solid Huber rings, bounded and Gelfand rings, $\mathbb Z((u))_\square$ and overconvergent disc algebras (RC §7.1–7.2;
  ABLRS §§2–3; V5A4 L7) — SA.4.

**L11 — six functors and analytic stacks** (owner `AnalyticStacks`).
- Abstract 6FF: $\mathrm{Corr}(\mathcal C,E)$, construction, kernels, suave/prim, cohomologically
  smooth/proper/étale, $D$-topology (6FF II–VI; Heyer–Mann §§2–4; RC §§6.1–6.2) — AS.0.
- Topological, coherent and D-module formalisms (6FF VII–VIII) — AS.1.
- Analytic stacks (6FF Def 9.16; RC §6.3) — AS.2.
- Algebraic stacks, Betti stacks, solid formalism on schemes and discrete adic spaces (RC §§6.4–6.5; 6FF IX) —
  AS.3.
- Solid smooth/étale maps, Serre duality, Tate and Gelfand stacks, normed analytic rings, overconvergent discs,
  $\mathbb A^{1,\mathrm{an}}$ (RC §7; RC24; ABLRS §4; V5A4 L7) — AS.4.

**L12 — ring stacks and the analytic Habiro stack.**
- Ring stacks, quasi-ideals and transmutation (Drinfeld; Bhatt Remark 2.3.8; 6FF X; V5A4 Prop 6.12) — RS.0.
- Betti, de Rham, crystalline, prismatic and $q$-de Rham ring stacks (6FF Ex 10.1–10.4) — RS.1.
- Scholze's Theorem 10.6 with Ayoub's input, and the analytic de Rham ring stack (6FF Ex 10.9; RC24; ABLRS) —
  RS.2.
- Normed ring stacks (Aoki §4) — RS.3.
- $\mathcal H^{\mathrm{an}}$ — HS.0. $G$ and $(\mathbb G_m)^{\mathrm{Hab}}$ — HS.1. $1-_{\mathrm{Hab}}x$ and the ring stack — HS.2.
  $X^{\mathrm{Hab}}$ and $D_{\mathrm{Hab}}$ — HS.3. The normed Habiro stack — HS.4.
- The algebraic–analytic comparison statement — HQ.6.

### 4.3 Checklist of the objects named in the job description

| object | defined in | owner |
|---|---|---|
| ring stacks, quasi-ideals, transmutation | Drinfeld §§1.3, 3.1; Aoki Def 4.21; Bhatt Rem 2.3.8 | RS.0 |
| Scholze's six-functor criterion for ring stacks | 6FF Thm 10.6 | RS.2 |
| Habiro ring stack $(\mathbb A^{1,\mathrm{an}})^{\mathrm{Hab}}$, $(\mathbb G_m)^{\mathrm{Hab}}$, $1-_{\mathrm{Hab}}x$ | V5A4 Defs 7.12, 8.4 | HS.1–HS.2 |
| light condensed / solid abelian groups | RC §§2–3 | SA.0–SA.1 |
| analytic rings, idempotent algebras, smashing spectra | RC §§4–5.1 | SA.2 |
| $\mathbb Z((u))_\square$, overconvergent algebras, bounded / Gelfand rings | V5A4 L7; ABLRS §§2–3 | SA.4 |
| analytic stacks, $!$-topology, Betti stacks | RC §6 | AS.2–AS.3 |
| six-functor formalisms (abstract) | 6FF II–VI; HM24 | AS.0 |
| normed analytic rings, $\mathbb A^{1,\mathrm{an}}$, overconvergent discs | V5A4 L7; Aoki Def 4.31 | AS.4 |
| analytic Habiro ring $\mathcal H^{\mathrm{an}}$ | V5A4 Def 7.8 | HS.0 |
| framed $q$-de Rham complex $q\Omega^*_{R/A,\square}$ and $q$-Hodge complex $q\mathrm{Hdg}^*_{R/A,\square}$ | Wagner v5 4.7; V5A4 Defs 2.7, 2.12 | QW.6 |
| coordinate-independent $q\Omega_{-/A}$ | Wagner v2 Thm A.1; BS22 §16 | HQ.1 (global), PR.6 ($p$-adic) |
| derived $q\mathrm{dR}$, $q$-Hodge filtrations, Habiro–Hodge complex $q\mathrm{Hdg}_{-/A}$ | Wagner v2 1.6, 3.2, 3.11 | HQ.2–HQ.3 |
| $q$-Habiro–Hodge complex of a framed algebra | V5A4 Def 4.6 | HQ.4 |
| $q$-Witt vectors (absolute, relative) | Wagner v5 §2 | QW.2–QW.4 |
| $q$-de Rham–Witt complexes (underived, animated) | Wagner v5 §3; v2 3.21–3.31 | QW.5, QW.7 |
| Habiro-complete modules and spectra | Wagner v2 App. B | HR.2 |
| relative Habiro rings $\mathcal H_{R/A,m}$, $\mathcal H_{R/A}$ | Wagner v2 §2 | HR.3–HR.5 |
| Habiro ring of a number field $\mathcal H_R$ | GSWZ Def 1.1; V5A2 Def 3.6 | HB.6 (with HR.1) |
| $K_3$-indexed modules $\mathcal H_{R,\xi}$ | GSWZ Defs 1.3–1.4 | HB.7 |
| Bloch groups, Suslin sequence, Bloch–Wigner | CGZ; V5A2 L6, L8 | K3BlochGroups V.3–V.5 |
| $K_3$ Chern classes, cyclic quantum dilogarithm, $\varepsilon_m$ | CGZ Thm 1.6; Hutchinson | HB.1–HB.2 |
| $p$-adic dilogarithm and regulator $D_p$ | Coleman; Besser–de Jeu; GSWZ Thm 9 | ColemanIntegration L2, PadicHodgeRegulators D.1–D.4, HB.7 |
| admissible series, FGI, Nahm sums | GSWZ §§1.6–2; V5A2 L4–5 | HB.8–HB.10 |

## 5. (c) The proposed roadmaps

The Habiro family after this plan has eleven roadmaps. Five are new; their definitions are in
`research/blueprint/roadmaps/<Id>.json` and their stage lists are summarised here.

### 5.1 New roadmaps

**`QWittVectors` — Big Witt vectors, Λ-rings and $q$-de Rham–Witt complexes** (group `cohomology`).

- *Boundary.* The roadmap owns every construction on the Witt-vector side of Habiro theory: big Witt vectors,
  Λ-rings, absolute and relative $q$-Witt vectors, underived and animated $q$-de Rham–Witt complexes, and the
  framed $q$-de Rham and $q$-Hodge complexes. It proves their comparison (Wagner v5 Theorem 4.27) and the
  no-go theorem. It does not own:
  - δ-rings (PR.0);
  - Habiro completion and the glued rings $\mathcal H_{R/A,m}$ (HR);
  - the coordinate-independent $q$-de Rham functor, $q$-Hodge filtrations and anything over the Habiro ring (HQ);
  - Langer–Zink de Rham–Witt complexes (CR.4).
- *Layers.* QW.0 big Witt vectors → QW.1 Λ-rings, perfectly covered bases → QW.2 absolute $q$-Witt vectors →
  QW.3 Λ-ring and relative $q$-Witt vectors → QW.4 étale morphisms → QW.5 $q$-de Rham–Witt complexes → QW.6 framed
  complexes and Theorem 4.27 → QW.7 animation, Nygaard filtrations, Theorem 5.1.
- *Suppliers.* Mathlib $p$-typical Witt vectors; PR.0; HC.4; DD.0–DD.3, DD.5; EDS E1, E2, E5; CR.3–CR.4; AI.0–AI.1.
- *Consumers.* HR.1 (QW.1), HR.4 (QW.4), HQ.1 (QW.6), HQ.2–HQ.4 (QW.6–QW.7); RefinedTraceMethods (through HQ);
  KTheoryLowDegrees Z.3 (λ-rings, recommended).

**`SolidAnalyticRings` — Light condensed mathematics, solid abelian groups and analytic rings** (group `foundations`).

- *Boundary.* The algebra of Clausen–Scholze analytic geometry: everything about condensed and solid abelian
  groups and analytic rings, up to solid Huber rings, bounded and Gelfand rings and the normed base
  $\mathbb Z((u))_\square$. No six functors, no analytic stacks.
- *Layers.* SA.0 → SA.1 → SA.2 → SA.3 → SA.4.
- *Suppliers.* Mathlib `LightCondensed`; EDS E1, E3, E5; StableHomotopyKTheory H.5; SF.0; TB.0; Tau Ceti
  `AdicSpaces` Layers 0–2.
- *Consumers.* AnalyticStacks; HS.0; HR.2 (SA.1, for Wagner B.6–B.8); VS2 (recommended, decision D12).

**`AnalyticStacks` — Six-functor formalisms and analytic stacks** (group `foundations`).

- *Boundary.* The abstract theory of six-functor formalisms, and its instances used here:
  - topological, coherent and D-module formalisms;
  - analytic stacks with their quasi-coherent formalism, algebraic and Betti stacks;
  - the solid formalism on schemes and discrete adic spaces;
  - solid smooth/étale maps with Serre duality, Tate and Gelfand stacks;
  - normed analytic rings and analytic affine lines.

  Ring stacks and transmutation are excluded. The étale six operations for diamonds and schemes stay with
  their current owners.
- *Layers.* AS.0 → AS.1; AS.0 → AS.2 → AS.3 (also needs AS.1) → AS.4.
- *Suppliers.* EDS E0, E1, E3, E5; SA.0, SA.2–SA.4; SF.1; DD.2.
- *Consumers.* RingStacksAndTransmutation, AnalyticHabiroStack, HQ.6; possibly DiamondSixOperations and EDC
  (they may cite AS.0 for abstract statements).

**`RingStacksAndTransmutation` — Ring stacks and transmutation** (group `foundations`).

- *Boundary.* Ring stacks as algebraic objects, transmutation, the algebraic examples of Scholze's Lecture X,
  Scholze's six-functor criterion (Theorem 10.6) with Ayoub's proper base change input, the analytic de Rham
  ring stack, and Aoki's normed ring stacks. The absolute prismatization and F-gauges stay in PR.5. The Habiro
  ring stack is in HS. Motivic realisations and 2-motives are excluded.
- *Layers.* RS.0 → RS.1; RS.0 → RS.2 → RS.3.
- *Suppliers.* SF.1; EDS E5; AS.1–AS.4; SA.4; PR.0, PR.5, PR.6; CR.2; Ayoub (Astérisque 314).
- *Consumers.* AnalyticHabiroStack; PR.5 (RS.0, recommended, decision D13).

**`AnalyticHabiroStack` — The analytic Habiro ring and the Habiro ring stack** (group `motivic`).

- *Boundary.* Scholze's V5A4 Lectures 6–8 in the analytic direction:
  - $\mathcal H^{\mathrm{an}}$ and its variant;
  - $G$, $(\mathbb G_m)^{\mathrm{Hab}}$ and $1-_{\mathrm{Hab}}x$;
  - the Habiro ring stack;
  - $X^{\mathrm{Hab}}$ and $D_{\mathrm{Hab}}$;
  - specialisations at roots of unity;
  - the norm.

  Every target carries its source status: definition, outline or expectation. The algebraic–analytic comparison
  stays in HQ.6, and the Berkovich extension and realisations are a roadmap-for-a-roadmap.
- *Layers.* HS.0 → HS.1 → HS.2 → HS.3 → HS.4.
- *Suppliers.* SA.4; AS.4; RS.0, RS.2, RS.3; HC.1–HC.2; HQ.1.
- *Consumers.* HQ.6.

### 5.2 The existing six after rescoping (boundaries)

- **`HabiroCyclotomicCompletions` (HC).** Cyclotomic completions $R[q]^S$ and Habiro's ring. Also: the complete
  elementary $q$-analogue toolkit, expansions, Taylor maps, rigidity, the naive Habiro ring $\mathbb H_R$ of GSWZ §5.1,
  modules. No Frobenius gluing over number fields, no derived completion.
- **`HabiroRings` (HR).** Étale Frobenius lifts over Λ-bases and the elementary Taylor-glued relative ring.
  Habiro-complete modules and spectra, arithmetic gluing, $\mathcal H_{R/A,m}$ (Wagner v2 Theorem 2.9), $\mathcal H_{R/A}$ and its
  Taylor equaliser, the number-field comparison, the cohomology interface and tests. No $q$-Witt construction.
- **`HabiroNumberFields` (HB.1, HB.2, HB.6, HB.7).** $K_3$ and Bloch inputs specific to GSWZ, the cyclic quantum
  dilogarithm with Pochhammer asymptotics, the arithmetic of $\mathcal H_R$, and the $K_3$-indexed modules.
- **`HabiroNahmSeries` (HB.3–HB.5, HB.5a, HB.8–HB.10).** Nahm sums: CGZ's modularity implication, admissible series
  and FGI, Theorems 3–8, Theorem 5 with its corollaries, and the explicit examples.
- **`HabiroCohomologyFoundations` (HQ).** $q$-connections, the global $q$-de Rham functor, derived and twisted
  $q$-de Rham, $q$-Hodge filtrations and Habiro–Hodge complexes, the framed Habiro ring and the
  $q$-Habiro–Hodge complex. Also existence theorems, the comparison atlas, the algebraic–analytic comparison
  statement, and (decision D7) explicit classes.
- **`ArithmeticQuantumTopology` (QT).** Unchanged.

### 5.3 Shape of the family

```
Mathlib/Tau Ceti ─┬─ HC ────────────┬─────────────────────────────┬──► HB.6, HB.8 … QT
                  │                 │                             │
                  ├─ QW.0–QW.4 ─────┼──► HR.1 ─► HR.2–HR.5 ─► HB.6 ─► HB.7 ─► HB.9
                  │   (PR.0)        │                  ▲
                  │                 └──► QW.5–QW.7 ─────┼──► HQ.1–HQ.5 ─► HQ.6 ◄─ HS.3
                  │                                      │                         ▲
                  └─ SA ─► AS ─► RS ──────────────────────────────────────────────► HS
K3BlochGroups, Polylogarithms, ColemanIntegration, PadicHodgeRegulators ─► HB.1–HB.2, HB.7
```

## 6. (d) The six existing roadmaps: verdicts and stage moves

All six are **kept**; none is merged or retired. Four are rescoped. Requirement changes are listed as
*add* / *drop*. §6.8 records the check that the union graph, with every change below applied, is acyclic.

### 6.1 `HabiroCyclotomicCompletions` — keep, enlarge

| stage | change |
|---|---|
| HC.1 | **Moves in:** the elementary $q$-analogue toolkit over $\mathbb Z[q^{\pm1}]$-algebras and formal power series. Namely: $[n]_q$, $[n]_q!$, $q$-binomial and $q$-multinomial coefficients with Pascal recursions and polynomiality; $(x;q)_n$, $(x;q)_\infty$ and their shift identities; the $q$-binomial theorem and Euler's identities $(t;q)_\infty^{-1}=\sum t^n/(q;q)_n$, $(t;q)_\infty=\sum(-1)^nq^{\binom n2}t^n/(q;q)_n$ (V5A2 Cor 2.6); $\log(t;q)_\infty=-\sum_\ell t^\ell/(\ell(1-q^\ell))$ (V5A2 Prop 2.7; GSWZ (logpoc)); $(q^{-1};q^{-1})_n$ in terms of $(q;q)_n$; Jackson $q$-derivatives on $R[q^{\pm1}][x]$; the plethystic exponential on $\mathbb Z((q))[[t]]$ with $\psi^n(t)=t^n$, $\psi^n(q)=q^n$ (V5A2 Defs 5.4–5.5, the Λ-structure imported from QW.1 by HB.8, not here). Requirements unchanged. |
| HC.2 | unchanged (new consumer HS.0) |
| HC.3 | unchanged (consumers HR.1, HB.6) |
| HC.4 | **Moves in:** (i) Wagner v5 Lemma 2.1 in exactly its form, for QW.2. (ii) V5A2 Cors 3.4–3.5. (iii) GSWZ §5.1: the naive ring $\mathbb H_R$ of a torsion-free ring $R$; the filtrations $\mathbb H_{R,N}$, $\mathcal P_{R,N}$ with graded pieces $R[q]/(1-q^N)$ and $\bigoplus_{m\ell=N}R[\zeta_m]$; $D_{m,\ell}=m^{2\ell-1}(\ell-1)!$; injectivity of $\iota$ and isomorphism after $\otimes\mathbb Q$; $M_N$ and Propositions 5.1–5.2; Examples 5.6–5.10 as tests. |
| HC.5–HC.6 | unchanged. HC.6 also exports the toolkit to QM.0 (decision D11) and to HB/HS. |

### 6.2 `HabiroRings` — keep, rescope

| stage | current scope | proposed scope | moves | requires |
|---|---|---|---|---|
| HR.1 | Λ-rings, perfectly covered, étale Frobenius lifts | **Étale Frobenius lifts over Λ-bases and the Taylor-glued relative Habiro ring.** Keep: the unique Frobenius lift $\varphi_p$ on $\widehat R_p$ for étale $R$ over a Λ-ring (BS22 Lemma 2.18 through PR.0), the linearised relative Frobenius equivalence, base change and iterates. Add: for $A$ a polynomial or toric Λ-ring and $R$ étale over $A$, the ring $\mathcal H^{\mathrm{Tay}}_{R/A}\subset\prod_m(R\otimes_{A,\psi^m}A)[\zeta_m][[q-\zeta_m]]$ cut out by the Frobenius-twisted gluing conditions, with ring structure, functoriality and the $\mathcal H_{\mathbb Z}$-algebra structure. Sources: GSWZ Def 1.1 ($A=\mathbb Z$), V5A4 Prop 4.3 (framed case), GW25 Def 1.1. | out: Λ-rings, Adams operations, perfectly covered → QW.1; in: Taylor-glued ring (decision D3) | drop PR.0; add QW.1, HC.3 |
| HR.2 | Habiro-complete modules, B.1–B.8 | unchanged, except that the solid comparison B.6–B.8 uses SA.1's light solid spectra instead of VS2 | supplier change | add SA.1 |
| HR.3 | finite cyclotomic descent, Cor 2.4 | unchanged | — | — |
| HR.4 | relative $q$-Witt rings and $\mathcal H_{R/A,m}$ | **The rings $\mathcal H_{R/A,m}$.** The completions $E_d$, gluing by Cor 2.4, Theorem 2.9 (staticity, uniqueness of the lift, $\mathcal H_{R/A,m}/(q^m-1)\simeq q\text{-}W_m(R/A)$), transition maps identified with $F_{m/d}$ (Remark 2.10), naturality. | out: the $q$-Witt construction, ghost description, operators, the restriction obstruction → QW.2–QW.4 | drop nothing; add QW.4 |
| HR.5 | $\mathcal H_{R/A}$, Lemma 2.12 with the $\Phi_m$ repair | unchanged, plus: $\mathcal H_{R/A}$ equals HR.1's $\mathcal H^{\mathrm{Tay}}_{R/A}$ for toric bases, and V5A2 Prop 3.3 / Wagner Remark 2.14 for $R=\mathbb Z$ | in: comparison with HR.1 | — |
| HR.5-number-field-comparison | GSWZ ring = relative ring | unchanged, plus: $\mathcal H_R$ is finite étale over $\mathcal H_{\mathbb Z[1/\Delta]}$ and finite projective of rank $[K:\mathbb Q]$ (the claim after GSWZ Def 1.1), proved through Theorem 2.9 and étale base change (QW.4) | in: finite étaleness | — |
| HR.6 | interfaces | unchanged | — | — |
| HR.7 | tests | add V5A4 Ex 4.5 with App. A Lemma A.1 (the $q$-multinomial element) and the $\Phi_5$ over $\mathbb F_{11}$ test | in: tests | add HQ.4 (for Ex 4.5) |

### 6.3 `HabiroNumberFields` — keep, rescope

| stage | proposed scope | moves | requires |
|---|---|---|---|
| HB.1 | unchanged (CGZ conventions, finite Chern classes) | — | add `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`, M.1 |
| HB.2 | cyclic quantum dilogarithm (unchanged), plus asymptotic analysis of Pochhammer symbols at roots of unity: GSWZ §2.1 (Lemma 2.1, Proposition 2.2 and its $q^{1/2}$ variant), V5A2 L2 (Lemmas 2.10–2.12, Prop 2.13, Def 2.16, Lemmas 2.17–2.19, Prop 2.20) | in: from GSWZ §2.1 and V5A2 L2 | add HC.1, P.1 |
| HB.6 | **The arithmetic of $\mathcal H_R$.** $\mathcal H_R$ is HR.1's Taylor-glued ring for $A=\mathbb Z$ and $R=\mathcal O_K[1/\Delta]$ (GSWZ Def 1.1; V5A2 Def 3.6 and Remarks 3.7–3.8). Also: the restrictions $\mathcal H_R\vert_\Delta$, $\mathcal H_R\vert_\gamma$; $(\mathcal H_R)^\wedge_p\cong\prod_{(m,p)=1}\widehat R_p[\zeta_m][[x]]\cong\mathcal H_{\widehat R_p}$; $\mathcal H_R=\mathcal P_R\cap\mathcal H_{\widehat R}$; Remark 1.2 (product of domains over the classes of $m\sim pm$); the abelian case; GSWZ §5.2 (Propositions 5.3–5.4, Remark 5.5); Examples 5.6–5.10 for number fields. | construction becomes a specialisation of HR.1 (decision D3) | drop M.1; add HR.1, HC.4 |
| HB.7 | $K_3$-indexed modules, organised in two parts. *Local:* Def 1.3, Lemma 3.4, Cor 3.5, Lemma 3.6, Cor 3.7, Remark 3.8, Def 3.9, Theorem 10, Theorem 1, Cor 3.10, the telescoping argument. *Global:* Def 1.4, Theorem 2, Proposition 1.5, Remark 1.6, the abelian generator. | — | add D.3, V.4 |
| KU-habiroring | readiness checkpoint | — | drop KU-continuous, KU-existing (continuous K-theory is not an input of the ring); add HR.1 |
| KU-finitereg, KU-habiromodules | unchanged | — | — |

### 6.4 `HabiroNahmSeries` — keep, rescope

| stage | proposed scope | moves | requires |
|---|---|---|---|
| HB.3 | unchanged | — | — |
| HB.4 | unchanged, plus V5A2 L4: Lemma 4.1, Thm 4.2 ($\mathrm{Li}_2(e^h)+h\mathrm{Li}_1(e^h)$ modulo $(2\pi i)^2\mathbb Z$), the five-term relations as used (imported from V.3/P.1), Prop 4.5, Cor 4.6, Props 4.8–4.12, Thm 4.13; V5A2 Prop 11.2 (Poisson summation) | in: V5A2 L4, L11 | add HB.2, HC.1 |
| HB.5a, HB.5 | unchanged | — | — |
| HB.8 | **Admissible series, formal Gaussian integration and the identification theorems.** Def 1.7 and (defgamma); Lemma 2.3, Cor 2.4, Lemma 2.5; Lemma 2.6; Theorem 6; Lemma 2.7, Def 2.8, Lemma 2.9, Theorem 7, Lemma 2.10; Def 2.11, Lemma 2.12 (with the Dedekind-eta multiplier identity $D_{\zeta_m}(1)^{24m}=m^{12m}$), Lemma 2.13, Remark 2.14, Lemma 2.15, Lemma 2.16, Cor 2.17; Theorem 8; Theorem 3; Theorem 4; Cor 2.18; V5A2 L5 (Def 5.1, Prop 5.3, Thm 5.6, Examples 5.7–5.8). Proof order: Def 2.11 → Lemma 2.15 → Theorem 8 → Lemmas 2.6, 2.9 → Theorems 6, 7 → Theorem 3 → Theorem 4. | in: Theorem 4 (from HB.9), Theorems 3, 7, 8 and the FGI material; the current text covers Theorem 6 only | add HC.1, HB.2, QM.1 |
| HB.9 | **Theorem 5 and its consequences.** Theorem 5 with its §3.3 proof, which uses CGZ Thm 1.6 and Hutchinson; Remark 1.9; Cors 1.10–1.11, with Zickert's surjectivity and the Kashaev–Mangazeev–Stroganov identity for (b); Remark 3.11; Cor 3.12. Also V5A2 L10–L12 in explicit form: the Nahm ring over $\mathbb Z[t]$ and its relative Habiro ring (from HR.5), Thm 11.3, Thm 12.1, Prop 12.3, Thms 12.4–12.6, with $\varepsilon_m$ taken from HB.2. | out: Theorem 4 → HB.8; in: V5A2 L10–L12 (decision D5) | add HB.4, HR.5, D.4 |
| HB.10 | **Symmetrisation, descendants and explicit examples.** Theorems 11 and 12 with (Jwdef), (psitmdef); Examples 4.1, 4.3–4.5; Remark 4.2 (the matrices for $4_1$, $5_2$, $(-2,3,7)$); GW25 Theorems 1.11–1.13 and Proposition 1.14 in relative Habiro rings. | in: GW25 Nahm elements | add HR.5 |
| KU-* | unchanged | — | — |

### 6.5 `HabiroCohomologyFoundations` — keep, rescope

| stage | proposed scope | moves | requires |
|---|---|---|---|
| HQ.1 | global $q$-de Rham functor (unchanged: Wagner v2 App. A, Theorem A.1, i.e. Sch17 Conj 1.1/3.1; framed complexes imported from QW.6), plus V5A4 L2–L3 module theory: $q$-connections (Def 2.15), Ex 2.17, modified $q$-connections (Def 2.18, Cor 2.21, Props 2.22–2.23, Question 2.24, Ex 2.25), Prop 2.26, Ex 2.27, Cor 2.28, Lemma 3.5, Thm 3.6, Ex 3.7, Props 3.8, 3.12, Cors 3.9, 3.14, Def 3.10, Examples 3.16–3.18 | in: V5A4 L2–L3 | add QW.6 |
| HQ.2 | derived $q$-de Rham (unchanged), plus the twisted complexes $q\Omega^{(m)}$ (Wagner v2 3.14–3.18), Lemma 3.15, Prop 3.19, the Nygaard filtration on $q\Omega^{(p^\alpha)}$ (3.20), Prop 3.22, Lemma 3.29 | in: Wagner v2 §3.3 and the $q$-de Rham part of §3.4 | add QW.7, HR.3 |
| HQ.3 | $q$-Hodge filtrations and Theorem 3.11 (unchanged), plus Wagner v2 §§3.5–3.7 (3.32–3.54, including the cyclotomic descent previously listed under HQ.4) | in: from HQ.4 | drop HQ.4; add QW.7 |
| HQ.4 | **Habiro rings of framed algebras and the $q$-Habiro–Hodge complex.** V5A4 Defs 3.19–3.23 and (3.1); Defs 4.1–4.2; Prop 4.3; Remark 4.4; Ex 4.5 with Lemma A.1; Def 4.6; (4.3); Remark 4.7; Thms 4.8 and 4.9 in their *uncompleted* form, via Wagner v2 Ex 3.12 and Cor 3.54 and the identification of the framed Habiro–Hodge complex with the Koszul complex of $\gamma_i-1$ on $\mathcal H_{(R,\square)}$; Remarks 4.10–4.11, 4.14, 4.17; Ex 4.12; Prop 4.13; Ex 5.1; Props 5.2–5.3; Thm 5.4; Remarks 5.5–5.6; Thm 5.7 with Remarks 5.8–5.10, Lemmas 5.11–5.12, Cor 5.13, Prop 5.14. | out: positive-degree $q$-dRW, $F$/$V$ systems, CR.4 specialisations, Cor 3.31 → QW.5, QW.7; Prop 4.15 → QW.2; cyclotomic descent → HQ.3 | drop CR.4, HR.4; add HR.1, HR.5, QW.6, QW.7 |
| HQ.5 | unchanged, plus V5A4 Conj 6.1 and Remark 6.2 stated, with Theorem 4.11 and Cor 4.16 as the proved part | in: V5A4 L6 statements | — |
| HQ.5-trace | unchanged, plus V5A4 Conj 6.4, Thm 6.5 and Examples 6.6–6.9 as citations to RT | — | — |
| HQ.6 | the algebraic–analytic comparison: a comparison functor from HQ's framed and étale data to $D_{\mathrm{Hab}}$ (HS.3) on $\mathbb G_m$ and étale algebras, with the precise open statement (Wagner v2 1.17: comparison expected after a completed localisation) | supplier added | add HS.3 |
| HQ.7 | tests, plus V5A4 Examples 1.4 (Legendre family), 1.5, 2.27, 3.16–3.18, 4.12 | — | — |
| HQ.8 | unchanged | — | — |
| **HQ.9 (new, decision D7)** | **Explicit classes (GW25):** Defs 1.1–1.2, Thms 1.5–1.6, 1.18–1.19, Thm 2.4, Cor 2.5, Thm 2.9, Cor 3.1, Thms 4.2, 4.5–4.7, Cor 4.8 | new | HQ.5, HR.5 |

### 6.6 `ArithmeticQuantumTopology` — keep unchanged

The roadmap uses HC.1, HC.3, HC.4, HC.6, HB.5a and HB.9, all kept. Decision D7 asks whether
Garoufalidis–Wheeler's lift of the colored Jones polynomial (arXiv:2603.01619) extends QT.2/QT.4.

### 6.7 Neighbours

- `CrystallineCohomology` CR.4: its text "Habiro HQ.4 owns the q-deformation and specialization maps" should read
  "`QWittVectors` QW.5 owns …". This is a text change only.
- `PrismaticCohomology` PR.0: split off the δ-ring prefix (δ-rings, Frobenius lifts, Lemmas 2.18, 2.28), which
  does not need `PerfectoidQuotients` Q0, so that QW.1 and HR.1 do not pull in perfectoid rings (decision D10).
  PR.5 imports RS.0 (decision D13).
- `VStackSheavesAndLisseCategories` VS2: may import the $\mathbb Z$-coefficient solid theory from SA.1/SA.3, once a
  light versus κ-condensed comparison has an owner (decision D12).
- `QSeriesPartitionsAndMockModularForms` QM.0: imports $q$-binomial and Pochhammer identities from HC.1 (decision D11).
  QM.1 supplies the Dedekind eta multiplier to HB.8.
- `KTheoryLowDegrees` Z.3: may import the λ-ring notion from QW.1.
- `PadicHodgeRegulators` D.3 owns GSWZ Lemma 3.1, Propositions 3.2–3.3 and Theorem 9, as its current text already says.
- `RefinedTraceMethods`: unchanged (RT.4:q-Hodge still needs HQ.3; RT.4:Habiro-comparison still needs
  HR.5-number-field-comparison).

### 6.8 Consistency check

In scratch, the requirement changes of §§6.1–6.7 were applied to the atlas stage graph (`stages[].requires`
together with `stageEdges`), with the five new roadmaps added. The union graph has no cycle, every referenced
stage id exists, and every `requires` entry of the new definitions resolves to an atlas stage or a new stage.

## 7. (e) Blueprint order

Two tracks can run in parallel. Arrows are "blueprint before".

**Track A (algebraic and number-theoretic).**
1. `HabiroCyclotomicCompletions`, with the enlarged HC.1 and HC.4. Nothing in the family precedes it.
2. `QWittVectors`, part 1 (QW.0–QW.4). It needs PR.0's δ-ring nodes (decision D10) and HC.4's comaximality
   node; request both if their blueprints are not yet promoted.
3. `HabiroRings` HR.1–HR.5 and HR.5-number-field-comparison. HR.6–HR.7 wait for step 8.
4. Suppliers outside the family, which must be blueprinted (or requested) before step 5:
   - `K3BlochGroups` V.3–V.5 (job BP-K3BlochGroups; reserved ids in `reserved-ids.json`);
   - `Polylogarithms` P.1 (BP-Polylogarithms);
   - `ColemanIntegration` L2;
   - `PadicHodgeRegulators` D.1–D.4;
   - `MotivicEtaleKTheory` M.1, M.7;
   - `KTheoryFiniteLocalFields` L.6;
   - the `ProfiniteCohomology` Kummer layer.
5. `HabiroNumberFields` (HB.1, HB.2, HB.6, HB.7).
6. `HabiroNahmSeries` (HB.3–HB.10). HB.5a needs the upstream `ModularForms` roadmap; HB.8 needs QM.1.
7. `QWittVectors`, part 2 (QW.5–QW.7), in parallel with steps 5–6. It needs CR.3–CR.4, AI.0–AI.1, DD.0–DD.5.
8. `HabiroCohomologyFoundations`: HQ.1–HQ.5, HQ.5-trace, HQ.7–HQ.9. Then HR.6–HR.7.

**Track B (analytic).** Independent of Track A until step 12.

9. `SolidAnalyticRings`.
10. `AnalyticStacks`, in two parts: AS.0–AS.2 and AS.3–AS.4.
11. `RingStacksAndTransmutation`. RS.1 waits for PR.5–PR.6; RS.2 needs Ayoub's paper to be fetched.
12. `AnalyticHabiroStack`. It also needs HC.1–HC.2 and HQ.1 from Track A.

**Assembly.**

13. HQ.6, then HQ.8 (which already needs CP and RT).
14. `ArithmeticQuantumTopology` at any time after steps 1 and 6.

The roadmaps with eight or more stages (QW, HQ, and the HB pair if blueprinted jointly) should be split into
parts following PROTOCOL §8. Parts are cut at QW.4/QW.5, HQ.3/HQ.4 and AS.2/AS.3.

## 8. (f) Open questions and differences between the notes and the paper

Items marked **[gap]** must become `gap` entries in the corresponding blueprint unless a written proof is found.
Items marked **[fix]** are local corrections the blueprint makes and records.

1. **$\Delta$ and the primes 2, 3.** The ring needs only $\mathrm{disc}(K)\mid\Delta$ (GSWZ Def 1.1). The modules need
   $6\,\mathrm{disc}(K)\mid\Delta$ and $p>3$ (Thm 1, Remark 1.8, the text before Def 1.4). V5A2 Def 3.6 takes $\Delta=\mathrm{disc}(K)$
   and never mentions 6. Wagner v2 Cor 2.13 uses $\Delta=\mathrm{disc}(F)$. Decision D8.
2. **V5A2 Prop 1.5** prints $f_1=q^{-1/48}(-q^{1/2};q)_\infty$. The Euler identity gives
   $\sum q^{n^2/2}/(q;q)_n=(-q^{1/2};q)_\infty$ with no $q^{-1/48}$; that factor belongs to the modular normalisation
   $q^{-1/48}f_1$. **[fix]** in HC.1/HB.3 tests.
3. **Gluing notation.** V5A2 Prop 3.3 and Def 3.6 write $h_m=h_{pm}$ (resp. $h_m=\varphi_p(h_{pm})$) "in"
   $\mathbb Z_p[\zeta_m][[q-\zeta_m]]\cong\mathbb Z_p[\zeta_{pm}][[q-\zeta_{pm}]]$. The precise form is GSWZ's re-expansion
   $f_m(x+\zeta_{pm}-\zeta_m)=\varphi_pf_{pm}(x)$. The isomorphism is the identification of both rings with the
   $(p,\Phi_m)$-adic completion of $\mathbb Z[q]$, as in Wagner v2 Remark 2.14. **[fix]**, notational.
4. **Wagner v2 Lemma 2.12.** The proof asserts that $\Phi_m$ is irreducible modulo every $\ell\nmid m$. This is false:
   $\Phi_5$ splits into four linear factors over $\mathbb F_{11}$ (Mathlib `normalizedFactors_cyclotomic_card` gives
   $\varphi(5)/\mathrm{ord}_5(11)=4$). The equaliser statement survives with a componentwise argument; HR.5 records this.
   **[fix]**
5. **V5A4 Theorems 4.8–4.9** cite "[Wag22, Prop 5.7, Thm 5.7]", an earlier version. In Wagner v5 the statement is
   Theorem 4.27, $(q-1)$-completed and for $R[[q-1]]$. The uncompleted statement for the Koszul complex on
   $\mathcal H_{(R,\square)}$ follows from Wagner v2 Example 3.12 and Corollary 3.54. That needs the Habiro–Hodge complex of
   the framed $q$-Hodge filtration to be identified with V5A4's Koszul complex (polynomial versus toric
   framings), which neither source writes out. **[gap]** in HQ.4. The display in Theorem 4.8 has
   "$/(1-q)$" where "$/(1-q^m)$" is meant. **[fix]**
6. **V5A4 Conjecture 1.2** is attributed to [Sch17, Conj. 1.1] and called proved (BS22 $p$-adically, Wagner in
   general). Its statement is Scholze's relative conjecture: cohomology of smooth proper $R$-schemes in finitely
   generated $R[[q-1]]$-modules with $q$-connection, Sch17 Conjectures 7.1–7.2, Definition 7.3, Conjecture 7.5.
   What BS22 §16 and Wagner v2 Theorem A.1 prove is the absolute functor of Sch17 Conjectures 1.1/3.1. The
   sources read do not settle the relative conjectures; the plan excludes them (D6).
7. **Two no-go theorems.** V5A4 Theorem 5.7 differs from Wagner v5 Theorem 5.1, as V5A4 Remark 5.10 notes:
   - target category: $\mathrm{CAlg}(D(\mathbb Z[q^{\pm}]))$ versus $\widehat D_{(q-1)}(A[[q-1]])$;
   - hypotheses: the framed Habiro ring with rational $H^0$ versus $q$-dRW cohomology with Frobenius compatibility;
   - counterexample: $\mathbb Z_p\langle t^{1/p^\infty}\rangle/(t-p)$ versus $(\mathcal O_C\otimes A)^\wedge_p$.

   The notes give an outline that uses Theorem 4.8 and animation. HQ.4 proves Theorem 5.7 completely, from the
   notes' route or by reduction to QW.7. **[gap]** until written.
8. **Status of the analytic Habiro ring.** Definition 7.8 is preliminary (Remark 7.9). Lecture 8 uses the variant
   without (ii), while Proposition 7.11 and Lemma 7.14 use (ii). Example 8.2's identification at $q=1$ is stated
   without proof, over a base that is not a Banach field. HS builds both variants (decision D4). The notation
   $u^{\varepsilon n}$ in (ii) is read as $u^{\lfloor\varepsilon n\rfloor}$ (equivalently a norm bound). **[fix]**
9. **Definition 8.4 as printed.**
   - With $k+\ell=n$ the $q$-trinomial has last index $0$, and the sign $(-1)^n$ makes the $q=1$ specialisation
     $(-1)^n(x+y)^n$ (up to binomial factors) rather than a power of $1-x-y$.
   - Example 8.6's sum $\sum_m(-1)^m\binom nm_qq^{\binom m2}x^m(y;q)_{n-m}$ specialises to $(1-x-y)^n$. It must be read
     with $x=(-1)^{\mathrm{Hab}}=q^{1/2}$ (Example 8.3) to give $1+_{\mathrm{Hab}}1$.
   - Remark 8.5's "$(x;y)_n$" is undefined.

   HS.2 pins the definition by the specialisation requirement. **[fix]**, plus a **[gap]** for equivalence of the
   formulations.
10. **Unwritten proofs of the Habiro stack.** The torsor property of $1-_{\mathrm{Hab}}x$, the ring axioms (associativity
    "given by the five-term relation"), the hypotheses of Scholze's Theorem 10.6 for $(\mathbb A^{1,\mathrm{an}})^{\mathrm{Hab}}$, and
    V5A4 Theorem 1.8 have no written proofs. Aoki Theorem 1.7 cites the lecture recordings. **[gap]** (decision D4).
11. **Ayoub.** The proof of Scholze's Theorem 10.6 uses Ayoub's Théorème 1.7.9 (projective base change for stable
    homotopical 2-functors), which no atlas stage owns. RS.2 owns it, and its blueprint job must read Ayoub.
12. **Presentability of analytic rings.** Rodríguez Camargo's notes say this is claimed in the Clausen–Scholze
    lectures but has no known proof. SA avoids it.
13. **Algebraic versus analytic Habiro cohomology.** Wagner v2 1.17 expects agreement only after a completed
    localisation. HQ.6 is therefore a comparison *statement* with an explicit domain, not a theorem.
14. **GSWZ (zjt) and (zjt=0)** print $\prod_iz_j^{A_{ij}}$. The intended product is $\prod_iz_i^{A_{ij}}$, as the
    $q$-difference system (PhiAshift) with $\prod_i\sigma_i^{A_{ij}}$ and the FGI critical-point equation show. **[fix]**
15. **Indexing by $K_3(K)$ or $B(K)$.** The modules are indexed by $K_3(K)$ (Defs 1.3–1.4, Theorem 2), while
    Theorem 5 uses $\xi=\sum[z_j]\in B(K)$. The passage uses Suslin's sequence and CGZ's integral conventions,
    with torsion and 2-/6-primary ambiguities, and must be fixed once (decision D9).
16. **Nahm-sum conventions.**
    - GSWZ: $F_A$ with $q^{\frac12(n^tAn+\mathrm{diag}(A)n)}$ and sign $(-1)^{\mathrm{diag}(A)n}$, and
      $\delta=\prod z_j^{-A_{jj}}\det(\mathrm{diag}(1-z)A+\mathrm{diag}(z))$.
    - V5A2 Theorem 5.6: $(-1)^{an}q^{\frac12an^2-\frac12an}$. Proposition 4.5: $q^{\frac12an^2}$. Theorem 12.1:
      $\delta=z+a(1-z)$, a unit multiple of GSWZ's $\delta$ for $N=1$.

    HB.3/HB.8 fix GSWZ's convention and record the substitutions $t\mapsto\pm q^{\pm a/2}t$. **[fix]**
17. **Asymptotics erratum.** V5A2 Lecture 4 follows the corrected Garoufalidis–Zagier asymptotics; HB.4 already
    requires the corrected normalisation.
18. **Proofs GSWZ only sketches.**
    - Theorem 1's proof runs through Theorem 10 (all $p\nmid\Delta$ are unramified and $>3$); the "telescoping"
      alternative is sketched.
    - Proposition 1.5 is outlined.
    - The finite projectivity claim after Definition 1.1 is not proved in GSWZ; HR.5-number-field-comparison
      proves it.
    - The $m$-periodicity of $I_{A,m,k}$ is cited from [AarhusII]/[GSW]; HB.8 proves it.
    - Theorems 5 and 8 are proved in detail for $N=1$ only; HB.8/HB.9 write general $N$.
    - Corollary 1.11(b) uses Zickert's surjectivity and the Kashaev–Mangazeev–Stroganov identity; HB.9 owns or
      requests them.
    - Lemma 2.12 uses the eta multiplier identity $D_{\zeta_m}(1)^{24m}=m^{12m}$ (Rademacher–Grosswald), requested
      from QM.1.

    **[gap]** where a blueprint cannot supply the argument.
19. **Theorem 6 reference.** GSWZ cite "[Efimov]" together with Kontsevich–Soibelman. The Efimov item in the campaign
    library is the rigidity paper. HB.8 must fetch the correct source (DT integrality for symmetric quivers) or
    prove Theorem 6 by GSWZ's elementary route (Lemma 2.6 and the recurrence), as HB.8's current text intends.
20. **V5A2 Definition 5.4** prints $\lambda^n(a+b)=\sum_{i+j=n}\lambda^i(a)\lambda^i(b)$ (for $\lambda^j(b)$) and conflates the
    λ-ring axioms with Adams operations on $\mathbb Z((q))[[t]]$. QW.1 uses Hesselholt's definition. **[fix]**
21. **Continuous $K$-theory.** V5A2 Theorem 7.6 (Clausen) has no written source; it only motivates (D6).
22. **Announced topics.** The course description's topics (realisation of Berkovich motives, stacky étale
    cohomology of rigid varieties in equal characteristic zero) are not in the notes (D6).
23. **Light versus κ-condensed solid theories.** No comparison is stated in the sources read. It is needed if VS2 is to
    import SA (D12).

## 9. (g) Decisions for the user

Each decision has a recommended default, which the roadmap definitions already follow.

- **D1 — New roadmaps.** Create `QWittVectors` (cohomology), `SolidAnalyticRings`, `AnalyticStacks`,
  `RingStacksAndTransmutation` (foundations) and `AnalyticHabiroStack` (motivic). *Default: create all five.*
  Alternatives:
  - merge SA and AS into one foundations roadmap;
  - put QW inside HabiroRings. This would make HR a 12-stage roadmap mixing Witt-vector algebra with Habiro
    completion.
- **D2 — Home of the $q$-Witt theory.** Move the Λ-rings (from HR.1), the $q$-Witt construction (from HR.4) and the
  positive-degree $q$-de Rham–Witt complexes (from HQ.4) into QW. *Default: yes.*
- **D3 — One construction of $\mathcal H_R$.** Build the elementary Taylor-glued relative ring in HR.1 and make HB.6 its
  specialisation to $A=\mathbb Z$, $R=\mathcal O_K[1/\Delta]$. HR.5 compares it with Wagner's ring. *Default: yes.* The
  alternative keeps two independent constructions linked only by HR.5-number-field-comparison.
- **D4 — Unwritten analytic results** (§8 items 8–10). Options:
  - (a) keep them as targets with source-status markers, to be recorded as gaps, as the HS definition does;
  - (b) turn `AnalyticHabiroStack` into a roadmap-for-a-roadmap until a written account exists;
  - (c) postpone creating HS.

  *Default: (a), with HS blueprinted last.*
- **D5 — V5A2 Lectures 9–12.** *Default:*
  - include the explicit statements of Lectures 10–12 (Thm 11.3, Thm 12.1, Prop 12.3, Thms 12.4–12.6) in HB.9,
    with $\varepsilon_m$ from HB.2 and the relative Habiro ring from HR.5;
  - exclude the relative $K$-theory and relative motivic cohomology of Lecture 9 (Def 9.1, Prop 9.6, the
    universal dilogarithm), and name it as a roadmap-for-a-roadmap in the HB documents.

  Alternative: a new HB stage needing MotivicEtaleKTheory M.6 and StableHomotopyKTheory H.5.
- **D6 — Exclusions.** Confirm that none of the following is a target anywhere in the family:
  - Clausen's continuous $K$-theory, and liquid and gaseous $K$-theory;
  - the $A_{\inf}$ line bundles and shtuka aspirations (V5A2 L12; GSWZ §1.9);
  - higher-weight modules and bad primes (GSWZ §1.9);
  - quantum modularity beyond QT.7;
  - Aoki's 2-motives (Theorems A–D) and Scholze's Lecture XI realisations;
  - the Berkovich extension of $(-)^{\mathrm{Hab}}$;
  - Scholze's relative conjectures Sch17 7.1–7.5;
  - refined THH beyond RT.5;
  - the course-description extras;
  - Gurney's integral prismatization, the ultrasolid de Rham stack, Hodge-filtered stacks.
- **D7 — Follow-up literature.**
  - (i) Garoufalidis–Wheeler, *Explicit classes in Habiro cohomology*, as new stage HQ.9. *Default: yes.*
  - (ii) Garoufalidis–Wheeler, *A lift of the colored Jones polynomial* (arXiv:2603.01619), lifts to the Habiro ring
    of $\mathbb Z[t^{\pm1}]\to\mathbb Z[t^{\pm1},1/\Delta(t)]$, which is HR.1's Taylor-glued ring. Add it to QT as a stage requiring
    HR.1? *Default: record as a QT follow-up; no stage yet.*
  - (iii) Bouis–Gazda, *The cyclosyntomic regulator of a number field* (arXiv:2602.21894): norm maps on $q$-Witt
    vectors, Frobenius maps on $\mathcal H_R$ and a $q$-deformed $p$-adic regulator. *Default: not included; candidate
    later stages for QW (norm maps) and HB.7/PadicHodgeRegulators.*
- **D8 — Conventions.** Rings with $\mathrm{disc}(K)\mid\Delta$; modules with $6\,\mathrm{disc}(K)\mid\Delta$ and $p>3$; compatible
  roots of unity as in GSWZ (zmdef); GSWZ's Nahm-sum normalisation. *Default: as stated.*
- **D9 — Index set of the modules.** Index by $K_3(K)$ as GSWZ does, with the map from $B(K)$ (Theorem 5) fixed once
  in HB.1 together with its torsion conventions. *Default: yes.* The alternative indexes by $B(K)$ and states
  Theorem 2 up to torsion.
- **D10 — Split PR.0.** Separate a δ-ring prefix (δ-rings, Frobenius lifts, BS22 Lemmas 2.18, 2.28, with no
  perfectoid prerequisites) from perfect prisms, so that QW.1 and HR.1 depend only on the prefix. *Default: yes*;
  a restructure proposal for PrismaticCohomology.
- **D11 — Owner of the elementary $q$-analogue toolkit.** HC.1, with QSeriesPartitions QM.0 importing it.
  *Default: HC.1.*
- **D12 — VS2 and SA.** Let VS2 import the $\mathbb Z$-coefficient solid theory from SA once a light/κ comparison has an
  owner. *Default: record as a proposal; no change now.*
- **D13 — PR.5 and RS.0.** PR.5 imports ring stacks, quasi-ideals and transmutation from RS.0. *Default: yes.*
- **D14 — Spurious requirements.** Replace HB.6's `MotivicEtaleKTheory:M.1` and KU-habiroring's continuous
  $K$-theory checkpoints by HR.1 (and HC.4). *Default: yes.*
- **D15 — Order and parts.** Adopt the two-track order of §7 and the part boundaries QW.4/5, HQ.3/4, AS.2/3.
  *Default: yes.*

## Appendix A. Page locators

**GSWZ v2** (printed page = PDF page).

| page | statements |
|---|---|
| 4–8 | §1.3 (p. 4), §1.4 (p. 6), §1.5 (p. 8) |
| 6 | Def 1.1 |
| 7 | Remark 1.2 |
| 8–9 | Def 1.3 |
| 9 | Thm 1 |
| 10 | Def 1.4, Thm 2 |
| 11 | Prop 1.5, Remark 1.6, Def 1.7, §1.6 |
| 13 | Remark 1.8, §1.7 |
| 14 | Thms 3, 4, 5 |
| 15 | Remark 1.9, Cors 1.10, 1.11, §1.8 |
| 17 | §1.9 |
| 18 | §2.1 |
| 19 | Lemma 2.1, Prop 2.2 |
| 20 | §2.2 |
| 21 | Lemma 2.3 |
| 22 | Cor 2.4, Lemma 2.5, §2.3 |
| 23 | Lemma 2.6 (statement) |
| 24 | Thm 6 |
| 25 | Lemma 2.7, §2.4 |
| 26 | Def 2.8, Lemma 2.9 (citing Lemma 2.6), Thm 7 |
| 28 | Lemma 2.10, §2.5 |
| 29 | Def 2.11 |
| 30 | Lemma 2.12 |
| 31 | Lemma 2.13 |
| 32 | Remark 2.14, Lemma 2.15 |
| 33 | §2.6 |
| 34 | Lemma 2.16 |
| 35 | Cor 2.17, Thm 8, §2.7 (Synthesis: Thm 8, then the proofs of Lemmas 2.6 and 2.9) |
| 36 | Cor 2.18 |
| 37 | §3.1 |
| 38 | Lemma 3.1, Props 3.2, 3.3 |
| 39 | Thm 9, Lemma 3.4, §3.2 |
| 40 | Cor 3.5 |
| 41 | Lemma 3.6, Cor 3.7 |
| 42 | Remark 3.8, Def 3.9, Thm 10 |
| 43 | Cor 3.10, §3.3 |
| 44 | Remark 3.11 |
| 45 | Cor 3.12, §4.1 |
| 46 | Thm 11 |
| 47 | Thm 12, Example 4.1 |
| 48 | Remark 4.2, §4.2 |
| 51–57 | §4.3 (51), §4.4 (52), §4.5 (54), Example 4.3 (54), §4.6 (55), §4.7 and Examples 4.4–4.5 (57) |
| 59–70 | §5.1 (59), Prop 5.1 (62), Prop 5.2 (63), §5.2 (64), Props 5.3–5.4, Remark 5.5, Example 5.6 (65), Examples 5.7–5.8 (66), §5.4 (68), Examples 5.9–5.10 (70) |

**V5A2 notes (6 March 2025).**

| page | statements |
|---|---|
| 2 | Def 1.1 |
| 3 | Def 1.2, Prop 1.5 |
| 5 | Def 1.6 |
| 7 | Prop 2.1 |
| 8 | Props 2.2, 2.5, Cor 2.6 |
| 9 | Prop 2.7, Defs 2.8–2.9, Lemma 2.10 |
| 10 | Lemmas 2.11–2.12 |
| 11 | Prop 2.13 |
| 12 | Def 2.16, Lemma 2.17 |
| 13 | Lemma 2.18 |
| 15 | Lemma 2.19, Prop 2.20 |
| 18 | Prop 3.3, Cors 3.4–3.5 |
| 19 | Def 3.6, Remarks 3.7–3.8 |
| 20 | Lemma 4.1, Thm 4.2 |
| 21 | Def 4.3, Prop 4.5 |
| 22 | Cor 4.6 |
| 23 | Props 4.8, 4.10, Cor 4.11 |
| 24 | Prop 4.12, Thm 4.13 |
| 26 | Def 5.1, Prop 5.3, Def 5.4 |
| 27 | Def 5.5 |
| 28 | Thm 5.6, Examples 5.7–5.8 |
| 29 | Defs 6.1–6.2, Thms 6.3–6.4 |
| 30 | Defs 6.5, 6.9, 6.11 |
| 31 | Thm 6.13, Def 6.14, Thm 6.16, Defs 6.17–6.18, Thm 6.19 |
| 32 | Remark 6.20 |
| 33 | Prop 7.1, Def 7.3 |
| 34 | Def 7.5, Thm 7.6, Remark 7.7 |
| 36 | Props 8.1–8.5 |
| 37 | Prop 8.6, Remark 8.7 |
| 38 | Def 9.1 |
| 39 | Example 9.5 |
| 40 | Prop 9.6 |
| 41 | Remark 10.1 |
| 44 | Prop 11.2, Thm 11.3 |
| 45 | Thm 12.1, Example 12.2 |
| 46 | Prop 12.3, Thm 12.4 |
| 47 | Thms 12.5–12.6 |
| 48 | Appendix A |

**V5A4 notes.**

| page | statements |
|---|---|
| 5 | Ex 1.1 |
| 6 | Conj 1.2, Thm 1.3, Examples 1.4–1.5 |
| 7 | Remark 1.6, Thms 1.7–1.8, Remark 1.9 |
| 8 | Defs 2.1, 2.3, Lemma 2.6 |
| 9 | Defs 2.7, 2.10 |
| 10 | Defs 2.12, 2.15, Ex 2.17, Def 2.18 |
| 11 | Cor 2.21 |
| 12 | Props 2.22–2.23, Question 2.24, Ex 2.25, Prop 2.26, Ex 2.27 |
| 13 | Cor 2.28 |
| 14 | Defs 3.1–3.2, Ex 3.4 |
| 15 | Lemma 3.5, Thm 3.6, Ex 3.7 |
| 16 | Prop 3.8, Cor 3.9, Def 3.10, Prop 3.12 |
| 17 | Cor 3.14, Ex 3.16 |
| 18 | Examples 3.17–3.18 |
| 19 | Defs 3.19, 3.21 |
| 20 | Def 3.23 |
| 21 | Defs 4.1–4.2, Prop 4.3, Remark 4.4, Ex 4.5 |
| 22 | Def 4.6, Remark 4.7, Thm 4.8 |
| 23 | Thm 4.9, Ex 4.12 |
| 24 | Props 4.13, 4.15 |
| 26 | Ex 5.1, Prop 5.2 |
| 27 | Prop 5.3, Thm 5.4 |
| 28 | Thm 5.7, Lemma 5.11 |
| 29 | Lemma 5.12, Cor 5.13, Prop 5.14 |
| 32 | Conj 6.1, Def 6.3, Conj 6.4, Thm 6.5 |
| 33 | Examples 6.6–6.10 |
| 34 | Ex 6.11, Prop 6.12 |
| 35 | Remarks 6.13–6.14 |
| 36 | Remark 7.1 |
| 37 | Examples 7.2–7.3, Defs 7.4–7.5 |
| 38 | Defs 7.6, 7.8, Remark 7.9, Lemma 7.10, Prop 7.11 |
| 39 | Def 7.12, Remark 7.13, Lemma 7.14, Ex 7.15 |
| 40 | Remark 7.16 |
| 41 | Lemma 8.1, Ex 8.2 |
| 42 | Ex 8.3, Def 8.4 |
| 43 | Remark 8.5, Ex 8.6 |
| 45 | Lemma A.1 |
| 46–48 | Appendix B |
