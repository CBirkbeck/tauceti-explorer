# PAPER-GAN-ICHINO-18: The Shimura–Waldspurger correspondence for Mp_2n

Wee Teck Gan and Atsushi Ichino, *The Shimura–Waldspurger correspondence for Mp_2n*, [Annals of Mathematics 188 (2018), no. 3, 965–1016](https://doi.org/10.4007/annals.2018.188.3.5); arXiv [1705.10106](https://arxiv.org/abs/1705.10106) (v3).

Extraction by Claude Code, session `cc-d67081`, 22 September 2026 (issue #1149). Status: **complete**. Every missing item is routed exactly once. The machine-readable extraction is [PAPER-GAN-ICHINO-18.result.json](PAPER-GAN-ICHINO-18.result.json):

- 89 items: 1 in the libraries, 18 planned, 70 missing;
- 6 routes: one Part II and five source routes;
- 48 prerequisite entries;
- 4 source issues.

**Source.**

- **arXiv v3** (3 August 2018, 38 pages, SHA-256 `5d1408c5…b291d`) was read in full on 2026-09-22. A formula that the text extraction garbled (v3 p. 28) was checked on the page image.
- **The published version** is free on the Annals site (SHA-256 `be54266f…87d68c0`). It was compared with v3 word by word, and every passage that differs was read. The differences are editorial: wording, reference numbering, and the MR and DOI data added to the references. The one exception is a wrong reference, E4 below. Locators give the published page first, then the v3 page.
- **arXiv v1** (May 2017, 52 pages) was compared for the history of the statements. It called generic parameters "tempered". It had two appendices on real groups, which v3 replaces by a citation of Gan–Ichino, Tunisian J. Math. 1 (2019).

The cited inputs were not read, apart from the introduction and main theorem of Ishimoto (arXiv:2301.12143). Each item that rests on an input says so. The inputs include Gan–Savin, Adams–Barbasch, J.-S. Li, Arthur, Mœglin, Ichino–Lapid–Mao and Sakellaridis–Venkatesh.

## What the paper proves

**The problem.** Waldspurger described the automorphic discrete spectrum of Mp_2, the double cover of SL_2, through theta lifts to PGL_2 = SO_3 and its inner forms. For Mp_2n, the lift of a cuspidal π to SO_2n+1 vanishes when L(1/2, π) = 0. Waldspurger's way around this was a nonvanishing theorem for quadratic twists of L(1/2, π), which is out of reach in higher rank.

**The main results.** Fix a number field F and a nontrivial character ψ of F\A.

- **Theorem 1.1** (unconditional). L²_disc(Mp_2n) = ⊕_φ L²_{φ,ψ}(Mp_2n). The sum runs over Arthur's elliptic A-parameters φ, which are also those of SO_2n+1. Each L²_{φ,ψ} is a full near equivalence class: the L-parameter of π_v relative to ψ_v is ϕ_{φ_v} for almost all v.
- **Theorem 1.4.** For generic φ = ⊕ φ_i:
  - L²_{φ,ψ}(Mp_2n) ≅ ⊕_η m_η π_η, with m_η = 1 exactly when Δ*η = ε_φ, where ε_φ(a_i) = ε(1/2, φ_i);
  - π_η is built from a local Langlands correspondence for Mp_2n, defined by composing the local Shimura correspondence θ_ψ : Irr Mp_2n ↔ Irr SO(V⁺) ⊔ Irr SO(V⁻) with the correspondence for SO(V);
  - the result is the one for SO_2n+1 with ε_φ in place of the trivial character.
- **Corollary 1.6.** The generic part of the discrete spectrum is multiplicity-free.
- **Remark 3.3.** Over totally imaginary fields the whole discrete spectrum is multiplicity-free.

**The hypothesis.** Theorem 1.4 assumes Arthur's multiplicity formula (6.1) for non-split SO_2n+1. Ishimoto (IMRN 2024) proved it for generic parameters. His introduction says this makes the result "unconditional".

**The method.**

1. **The stable range (§§2–3).** J.-S. Li's theory lifts every square-integrable, not only cuspidal, π to SO_2r+1 with r > 2n + 1, with m_disc(π) ≤ m_disc(θ(π)) ≤ m(θ(π)) ≤ m(π) (Theorem 2.1). Arthur's classification of SO_2r+1 then gives the parameter φ ⊕ S_{2r−2n} (Proposition 3.1).
2. **Generic parameters (§4).** Every realization of π is cuspidal (Proposition 4.1). Multiplicities are therefore preserved (Corollary 4.2), and Arthur's formula transports to a formula for Mp_2n with packets built from SO_2r+1 (Proposition 4.4).
3. **Identifying the local structure (§§5–6).**
   - Proposition 6.1 shows that the local theta lift from Arthur's packet Π_{φ⊕S_{2r−2n}}(SO_2r+1) to Mp_2n agrees with the local Shimura correspondence. Proposition 5.4 shows that packet has nonzero, irreducible, distinct members.
   - The proof reduces to good parameters by irreducibility of induced representations (Lemmas 5.2 and 5.5).
   - It then uses a global argument with globalized parameters Φ satisfying L(1/2, Φ) ≠ 0.
   - The globalizations (Appendix A) are proved by Poincaré series, after Sakellaridis–Venkatesh and Prasad–Schulze-Pillot. For n = 1 this reproves Waldspurger's result without his nonvanishing theorem.

## What the libraries and the atlas already have

**The libraries.** Tau Ceti has, at the pinned commit f790474:

- the orthogonal and special orthogonal groups of a quadratic map;
- the hyperbolic plane and the signed discriminant;
- the spinor norm SO(Q) → K^×/(K^×)², the one library item.

Mathlib has the symplectic matrix group. There is nothing on metaplectic covers, Weil representations or theta lifts: the library audit marks MP.0–MP.8 "not built".

**The atlas plans the foundations and the Arthur side.**

- *Metaplectic groups, Weil representations and automorphic theta kernels* (MetaplecticAutomorphicForms):
  - the local cover and genuine representations (MP.1);
  - the Weil representation (MP.2–MP.4);
  - big theta modules, small theta quotients and Jacquet filtrations (MP.3);
  - the adelic cover, genuine cusp forms and the global theta lift of cusp forms (MP.4–MP.5).
- ML.4 plans Arthur's classification of SO_2r+1: parameters, local A-packets, the multiplicity formula, and the symplectic/orthogonal dichotomy of self-dual cuspidal representations.
- Other inputs:
  - the p-adic local Langlands correspondence for GL_n (ET.6);
  - partial L-functions (AL.4);
  - Jacquet–Langlands (R17.1, R17.3);
  - toric distinction and Waldspurger's period theorem (GZ.4, GZ.5);
  - local and global classification of quadratic forms (Tau Ceti's quadratic-forms roadmaps, 6C–6D and Layers 1, 7 and 8).

**Nothing plans the theta correspondence as a correspondence.** The atlas has no layer for:

- Howe duality in general (MP.3 calls it "a separately source-qualified extension");
- the conservation relation;
- the local Shimura correspondence;
- J.-S. Li's stable-range theory;
- the Rallis inner product formula;
- the discrete spectrum of Mp_2n.

## Routes

**1. Part II: `MetaplecticAutomorphicFormsPartIIShimuraWaldspurger` (57 items).** Title: "Metaplectic groups, Weil representations and automorphic theta kernels, Part II: theta correspondences and the Shimura–Waldspurger correspondence for Mp_2n".

The parent roadmap builds the objects: covers, Weil representations and theta modules. The paper's theory is the next step in the same direction, the correspondence and what it does to the spectrum. The brief lays out nine layers:

1. local genuine representation theory of Mp_2n: induction and χ_ψ, Langlands quotients, unramified representations, Whittaker models;
2. the local Shimura correspondence and the local Langlands correspondence for Mp_2n;
3. J.-S. Li's rank and stable-range theory;
4. global theta lifts and the Rallis inner product formula;
5. the discrete spectrum and Theorem 1.1;
6. generic parameters (Proposition 4.1 to Proposition 4.4);
7. the comparison of local theta lifts (Propositions 5.4 and 6.1);
8. the globalizations of §6.2 and Appendix A;
9. Theorem 1.4 and Corollary 1.6.

Layers 1–4 are general theta-correspondence theory, and the brief asks for them to be importable on their own. The brief imports the Arthur side from ML.4 rather than planning it again.

**2. Source of MP.3 (5 items).** These are local facts about the dual pair (Mp_2n, O(V)), which MP.3 owns:

- Howe duality (Howe; Waldspurger; Gan–Takeda, which is the "actual theorem" MP.3 asks for);
- the Sun–Zhu conservation relation;
- Kudla's induction principle;
- the MVW involution;
- the unramified theta correspondence (as in PAPER-CHENEVIER-TAIBI-20).

**3. Source of ML.4 (4 items).** These are properties of the packets and multiplicities ML.4 owns:

- the Vogan-packet local Langlands correspondence over both SO(V⁺) and SO(V⁻) (Mœglin–Renard; Ishimoto);
- Lemmas 5.1 and 5.5, irreducibility of induced representations from L- and A-packets;
- the multiplicity formula (6.1) for non-split SO(V), the paper's hypothesis, now Ishimoto's theorem. ML.4 already asks for conditional hypotheses to be kept visible "until the exact missing result and applicable replacement are verified".

**4. Source of ML.5 (2 items).** The lift of generic cusp forms from SO_2n+1 to GL_2n, and the local descent to Mp_2n. PAPER-BOXER-CALEGARI-GEE-25 and PAPER-JIANG-ZHANG-20 routed the same transfers here.

**5. Source of AF.1 (1 item).** The archimedean local Langlands correspondence for GL_n, as in PAPER-CHENEVIER-TAIBI-20.

**6. Source of AL.3 (1 item).** Jacquet–Shalika's strong multiplicity one for isobaric representations, a consequence of the Rankin–Selberg theory AL.3 plans.

## Source issues (`sourceIssues` E1–E4)

**Three gaps**: steps that extend a cited result without an argument. The statements are plausible, but each is a proof obligation for a formaliser.

- **E1. Lemma 5.2** (p. 988). Gan–Savin's Lemma 7.4 "continues to hold for s > −1/2". The p-adic case of the lemma itself is also attributed to Atobe, so only the included proof is affected.
- **E2. Lemma 6.3** (p. 992). The induction principle "easily extends to the case at hand": the stable-range pair (Mp_2n, SO_2r+1), with non-tempered A-packet members. It lies on the path to Theorem 1.4.
- **E3. Proposition A.2** (p. 1005). "The analog of [Ichino–Lapid–Mao, Lemma A.2] for Mp_2n" is used to isolate π_S in the Fell topology. The globalizations behind Lemmas 6.8–6.12 depend on it.

**One misprint, in the published version only.**

- **E4.** In the proof of Proposition 4.1, "[44, p. 205]" is cited for the embedding of a non-cuspidal automorphic representation in a representation induced from a cuspidal one.
  - In arXiv v3, [44] is Langlands, "On the notion of an automorphic representation", Corvallis Part 1, pp. 203–207.
  - In the published list, [44] is Langlands' "Ein Märchen" (Part 2, pp. 205–246), with the Märchen's MR and Zbl numbers, and the note has no entry at all.
  - All the other references match v3 after renumbering, so the entry was presumably replaced in copyediting.

None of the four was found corrected. The places searched were the arXiv versions, the Annals article page, Crossref, and Ishimoto's paper.

## Other points for a formaliser

- **Asserted without argument.** Two steps are asserted but are easy, and they are verified in the item notes rather than recorded as issues:
  - the local toric distinction (A.1), which is the Saito–Tunnell criterion case by case;
  - "[70, Lemma 4.4] continues to hold for v ∈ S_∞", immediate because G_v is compact there.
- **Linear-group arguments applied to the cover.** Langlands' constant-term argument (Proposition 4.1) and the Whittaker–Plancherel input of Proposition A.2 are applied to Mp_2n without comment. MetaplecticAutomorphicForms MP.8 warns that linear-group results do not transfer to covers automatically.
- **Inputs used without a reference.** Two inputs are used with no citation:
  - the lift from SO_2n+1 to GL_2n in Proposition A.1 (standard source: Cogdell–Kim–Piatetski-Shapiro–Shahidi);
  - the bound |s_i| < 1/2 behind "almost tempered" (Jacquet–Shalika).

## Prerequisites not yet covered

**The local theta correspondence:**

- Gan–Savin (Compos. Math. 2012);
- Adams–Barbasch (J. Funct. Anal. 1995; Compos. Math. 1998);
- Gan–Takeda (J. Amer. Math. Soc. 2016; Contemp. Math. 664);
- Howe (J. Amer. Math. Soc. 1989);
- Sun–Zhu, Kudla, Mœglin–Vignéras–Waldspurger, Sun;
- Atobe (Math. Ann. 2018);
- Gan–Ichino (Invent. Math. 2014 and 2016; Tunisian J. Math. 2019).

**J.-S. Li:** Invent. Math. 97; Compositio Math. 71; Amer. J. Math. 119.

**Global theta lifts:**

- Kudla–Rallis (Ann. of Math. 1994);
- Gan–Qiu–Takeda (Invent. Math. 2014);
- Yamana (Invent. Math. 2014);
- Gan's Saito–Kurokawa paper;
- Furusawa.

**Packets:**

- Ishimoto (IMRN 2024);
- Mœglin–Renard (LNM 2221; Contemp. Math. 691);
- Mœglin (Represent. Theory 2006; Contemp. Math. 489; Adv. Math. 2011);
- Mœglin–Waldspurger (Astérisque 347).

**Globalization:**

- Ichino–Lapid–Mao (Duke 2017);
- Sakellaridis–Venkatesh (Astérisque 396);
- Prasad–Schulze-Pillot;
- Jiang–Soudry;
- Ginzburg–Rallis–Soudry;
- Cogdell–Kim–Piatetski-Shapiro–Shahidi;
- Savin.

**Other inputs:**

- Ban–Jantzen, Lapid–Muić–Tadić, Speh–Vogan, Bergeron–Clozel;
- Jacquet–Shalika (1981), Shahidi (1981);
- Ranga Rao.

**Endoscopic character relations** (§1.5): Adams, Renard and Luo.

**The case n = 1:** Waldspurger, Forum Math. 1991.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-GAN-ICHINO-18.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the three files: 3 files, 0 problems.
- Every library declaration cited was read at the pinned commits: Mathlib 082e2d3 and Tau Ceti f790474.
- Every prerequisite DOI was resolved on Crossref. The arXiv ids were checked on the arXiv API.
- The reference lists of v3 and the published version were matched entry by entry, and their in-text citations compared.
- Two computations were checked by hand: the decomposition Ad ∘ φ̃′ in the proof of Lemma 4.3, and the pole argument of Proposition 3.1.

## Review (REV-PAPER-GAN-ICHINO-18, 23 September 2026)

The review, by Claude Code (session cc-39fac3), accepted the extraction and its six routes after corrections made in place. The full record is `research/blueprint/reviews/REV-PAPER-GAN-ICHINO-18.md`.

- **Statements and locators:** 29 statements and 8 locators corrected, among them the complex conjugates in automorphic-theta and whittaker-mp.
- **New items:** 15 (3 planned, 12 missing). The Part II brief's sentence on E1–E3 is replaced, and a corrections paragraph is added.
- **Source issues:** E1–E3 are rejected, since each step is covered by the cited source. E4 is confirmed. E5–E7 are new:
  - The proof of Proposition 3.1 needs a non-vanishing input (E5).
  - Proposition A.2 is unproved as printed for n ≥ 2, because the cited Jiang–Soudry Th. 2.2(2) fails there (E7). The fix is to assume θ_{ψ_{v0}}(π_{v0}) supercuspidal, which holds in the only application.
  - Theorems 1.1 and 1.4 stand.
