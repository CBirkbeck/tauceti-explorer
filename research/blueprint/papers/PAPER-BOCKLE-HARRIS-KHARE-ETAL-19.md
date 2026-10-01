# PAPER-BOCKLE-HARRIS-KHARE-ETAL-19: Ĝ-local systems on smooth projective curves are potentially automorphic

Gebhard Böckle, Michael Harris, Chandrashekhar Khare and Jack A. Thorne, *Ĝ-local systems on smooth projective curves are potentially automorphic*, [Acta Mathematica 223 (2019), no. 1, 1–111](https://doi.org/10.4310/acta.2019.v223.n1.a1); arXiv [1609.03491](https://arxiv.org/abs/1609.03491). With two appendices by **D. Gaitsgory**.

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1468). Status: **complete**. All eleven sections, both appendices and the bibliography were read. The machine-readable extraction is [PAPER-BOCKLE-HARRIS-KHARE-ETAL-19.result.json](PAPER-BOCKLE-HARRIS-KHARE-ETAL-19.result.json): 53 items (10 planned, 43 missing), 9 routes, 43 prerequisite entries and 18 recorded source issues, after the fixes of 1 October 2026 (see the last section; the extraction had 36 items, 5 routes and 16 source issues).

**Source.** **arXiv v2** (29 August 2019, dated 30 August 2019 in its header), 77 pp., SHA-256 `ec54cf92…9743b9`, fetched and read 2026-09-22. It is the last arXiv version and is contemporaneous with publication. The **published version could not be consulted** — Acta Mathematica is not open access and no copy was reachable — so every reading and every recorded source issue is against v2 and may have been corrected in production; each issue's `searched` field says so. Crossref (checked 2026-09-22) records no correction notice and no update relation for the DOI. Locators are v2 pages together with the paper's own statement numbers. Pages 5, 10–18, 21–26, 32, 43–48, 51, 54, 58–60, 64–66 and 71 were additionally read as **rendered page images**, because the text layer flattens the sub- and superscripts and the hats on which most of the recorded items turn.

## What the paper proves

This is the **converse** to V. Lafforgue's theorem — potentially, and for every split semisimple group. Let X be a smooth projective geometrically connected curve over F_q, K = F_q(X), G split semisimple over F_q with dual group Ĝ (split reductive over **Z**), and l ∤ q.

**Theorem 1.1 = Theorem 11.1.** For every continuous σ : π_1(X) → Ĝ(Q̄_l) with **Zariski dense image** there are a finite Galois extension K′/K and an everywhere unramified cuspidal automorphic representation Π of G(A_{K′}) such that σ|_{W_{K′_v}} and Π_v are matched at every place v of K′ under the unramified local Langlands correspondence — explicitly, χ_V(σ(Frob_v)) is the eigenvalue of T_{V,v} on Π^{G(Ô_{K′})}. One expects K′ = K but cannot prove it. Nothing is new for GL_n or PGL_n, where L. Lafforgue has the full correspondence, and split classical groups would follow from his theorem with descent or the twisted trace formula; "however, for semisimple groups in the exceptional series, this is the first theorem of this kind".

The four ingredients listed in §1 are (i) Ĝ-valued Galois representations attached to automorphic forms, (ii) an automorphy lifting theorem for them, (iii) local systems with big mod-l monodromy, (iv) universally automorphic Ĝ-valued representations; they are combined by the **"chutes and ladders"** argument of [Ell05]. The genuinely new mathematics is:

- **Ĝ-pseudocharacters and their deformation theory** (§§3–4). V. Lafforgue's pseudocharacters — compatible families Θ_n : Z[Ĝ^n]^Ĝ → Map(Γ^n, A) — correspond bijectively to Ĝ-completely reducible representations over an algebraically closed field of **any** characteristic (Theorem 4.5), have integral models by Bruhat–Tits theory (Theorem 4.8), and, when the centralizer of ρ̄ in Ĝ^{ad} is **scheme-theoretically trivial**, deform exactly as the representation does: Def_ρ̄ ≅ PDef_Θ̄ (Theorem 4.10). For GL_n that hypothesis is Schur's lemma and the statement is Carayol's; in general it is strictly stronger, and it is what the whole paper pays for. The proofs rest on invariant theory over a DVR, including a **mixed-characteristic case of Luna's slice theorem** (§3.2), and on Richardson's closed-orbit theory together with Bate–Martin–Röhrle's G-complete reducibility and the separability results of [BMRT10] in very good characteristic.
- **Deformation theory of Ĝ-valued representations of Γ_K** (§§5–7). R_ρ̄,S has **as many relations as generators**, because the global Euler characteristic of a function field vanishes, and is a reduced finite flat complete intersection with characteristic-zero points — the finiteness coming from **de Jong's conjecture** as proved by Gaitsgory [Gai07], the reducedness from L. Lafforgue's punctual purity. Taylor–Wiles data are places where ρ̄(Frob_v) is regular semisimple with connected centralizer; the diamond group is the l-power quotient of ∏_v T(k(v)); the largeness hypothesis is **Ĝ-abundance** (Definition 5.18), a new member of the "big"/"adequate"/"enormous" family, which supplies Taylor–Wiles places by Chebotarev with the quantitative error term of [Cha97].
- **The automorphy lifting theorem** (§8). The excursion algebra has a finite flat **integral** form B(U, O) whose maximal ideals carry residual representations σ̄_m (Corollary 8.11); integral spaces of cusp forms are **free** over the group ring of the diamond operators, because that group acts freely on the adelic double coset space [BK06] and a Hecke operator can be manufactured to annihilate every Eisenstein constituent (Lemmas 8.15–8.16, on Harder's reduction theory and [MW95]); Taylor–Wiles patching then gives **R = B**, an isomorphism f_m : R_{σ̄_m,∅} ≅ B(U, O)_m with C_cusp(U, O)_m free over it (Theorem 8.20, Corollary 8.21).
- **Potential automorphy** (§§9–11). Moret-Bailly's theorems link two residual representations over a common extension (§9); an auxiliary curve supplies a compatible system with full Ĝ(F_l)-monodromy (Proposition 9.5), so **no families of "Ĝ-motives" are needed**; and the universally automorphic objects are **Coxeter parameters** (§10), whose automorphy is deduced from Braverman–Gaitsgory's geometric Eisenstein series, with Gaitsgory's two appendices proving the resulting automorphic function cuspidal and non-zero. "Thus the geometric Langlands program plays an essential role in the proof of Theorem 1.1, although it does not appear in the statement."

§11.1 is explicitly informal: granting the then-announced Genestier–Lafforgue local parametrization, Proposition 11.5 would show that the semisimple local correspondence hits every Ĝ-irreducible parameter, but it assumes **Conjecture 11.6** (cyclic descent) and an unproved generalization of Theorem 11.1. §11.2 sketches the globally generic variant (Theorems 11.8–11.9).

## What the atlas already has

Ten items are `planned` rather than `missing`. Five were planned at extraction: the quantitative Chebotarev theorem (`FunctionFieldArithmetic:FA.5`), root data and the dual group over a base (`ReductiveGroupsPartII:RG2.5`), the Hecke algebras H_V of §7 (`SmoothRepresentationsOfLocalGroups:SR.1`), integral cusp forms with the Satake transform (`FA.6` + `SR.4` + `RG2.5`), and V. Lafforgue's excursion package itself (`GlobalShtukasAndFunctionFieldLanglands:GS.5/GS.7`) — the last of these is the input Theorem 1.1 inverts, already extracted in this repository as [PAPER-LAFFORGUE-18](PAPER-LAFFORGUE-18.result.json).

**Corrected on 1 October 2026** (red-team findings /4–/6). The report used to say that SR.1, SR.2 and SR.4 plan the Iwahori–Hecke algebra and unramified principal series. None of them plans an Iwahori–Hecke algebra, the Bernstein presentation or Casselman's theorem, so item 21 keeps only the Hecke algebras H_V (SR.1), and the rest became items 37–40. Proposition 8.3 (Chevalley restriction over **Z**, item 41) and Definition 8.7 with Lemma 8.8 (item 42) were inside planned items although no stage plans them, and are now missing items. Five cited inputs were added as planned items: Lemma 7.1 (`FunctionFieldArithmetic:FA.4`, `ReductiveGroupsPartII:RG2.5`), L. Lafforgue's purity and compatible systems and Chin's Theorem 4.6 (`GlobalShtukasAndFunctionFieldLanglands:GS.6`), Weil II (`DeligneWeightsAndPurity:DWP.7`), and the Euler characteristic formula with Poitou–Tate for coefficients prime to p (`ArithmeticGaloisDuality:R02.3/R02.4`).

## Routes

1. **Part II** of `GlobalShtukasAndFunctionFieldLanglands`, new roadmap `GValuedDeformationsAndPotentialAutomorphy`, area `functionfields` — 28 items (22 at extraction): the Ĝ-valued deformation theory of §§5–7, the integral excursion algebra and the R = B lifting theorem of §8, Coxeter parameters and the two appendices, and the chutes-and-ladders conclusion. The parent constructs the shtuka cohomology, the excursion operators and Θ_{U(N)}; this paper runs the machine backwards, and nothing in the parent's stages plans a deformation ring. It is deliberately distinct from `PotentialAutomorphyInfrastructure` (CM fields), `PotentialModularityAndCompatibleSystems` (Hilbert–Blumenthal GL₂), `GlobalGaloisDeformations` (number fields, polarized) and from the three sibling Part IIs already proposed for the same parent (`ShtukaSpecialCyclesAndHigherSiegelWeil`, `ShtukaTateCohomologyAndGlobalBaseChange`, `GlobalShtukasPartIIRamanujanArthur`). Corrected on 1 October 2026: the abstract Ĝ-valued deformation functor (item 12) moved to route 7 and Proposition 8.10 with Corollary 8.11 (item 34) to route 6; Lemma 7.2(ii), Lemma 8.8, the residual representations of Levis and five imported black boxes (flat Poitou–Tate, de Jong–Gaitsgory, Chin, Larsen–Snowden–Wiles, Völklein) were added. The brief now says split semisimple, not reductive, has tests the Part II can meet, and imports GS.6, DWP.7, R02.3/R02.4, R04.1/R04.2, R08.1, SR.2, FA.4 and the parahoric Part II.
2. **Source** route to `LanglandsParameterStacks` **LP2, LP3** — 4 items (Proposition 8.3, item 41, added on 1 October 2026): §3's invariant theory. LP2 owns the coarse quotient and closed semisimple orbits, LP3 integral reductive invariant theory; §3 is exactly that, in a stronger form (arbitrary characteristic, and over a DVR) than the characteristic-zero statements those stages currently quote from [Ric88].
3. **Source** route to `IntegralHeckeAndGaloisDeterminants` **IHG.0, IHG.1** — 4 items: Definition 4.1, Theorem 4.5, continuity (Proposition 4.7) and Theorem 4.10. Those stages build polynomial laws, determinants and Cayley–Hamilton reconstruction for GL_n; the Ĝ-valued theory is the same statement with Z[Ĝ^n]^Ĝ in place of the characteristic polynomial, and belongs beside it. Since 1 October 2026 the route's reason records IHG.1 as the **one owner** of the reconstruction theorem, in its general form (possibly disconnected H, any characteristic); LP2:semisimple-characters and GS.5 import it.
4. **Source** route to `ArithmeticGaloisRepresentations` **R01.1** — 1 item: Theorem 4.8, integral models, the Ĝ-analogue of the invariant-lattice/Brauer–Nesbitt package R01.1 plans for GL_n, proved with Bruhat–Tits theory and [Lar95, Lemma 2.4].
5. **Source** route to `PotentialModularityAndCompatibleSystems` **R23.1** — 1 item: §9's use of Moret-Bailly. R23.1 is the atlas's "Moret–Bailly's theorem" stage and already asks for the function-field case; [MB90] is quoted here without proof, which is worth recording where the stage is formalized.
6. **Source** route to `GlobalShtukasAndFunctionFieldLanglands` **GS.5** — 1 item, added on 1 October 2026: Proposition 8.10 and Corollary 8.11 (item 34), which are V. Lafforgue's Proposition 13.1 with Lemme 10.5 and his Theorem 13.2 at one maximal ideal, beside PAPER-LAFFORGUE-18/41. GS.5's node should state them at arbitrary level U, with B(U, O) finite flat and Θ_U valued in it.
7. **Source** route to `GlobalGaloisDeformations` **R04.1, R04.2** — 2 items, added on 1 October 2026: the unframed Ĝ-valued deformation functor of a profinite group satisfying Φ_l (item 12) and Lemma 5.9 (item 53). The framed functor is already at `LocalGaloisDeformationRings` R08.1 through PAPER-PASKUNAS-QUAST-26.
8. **Source** route to `SmoothRepresentationsOfLocalGroups` **SR.2** — 1 item, added on 1 October 2026: Casselman's isomorphism and Lemma 7.2(i) (item 38).
9. **Part II** `SmoothRepresentationsPartIIParahoricCenters` of `SmoothRepresentationsOfLocalGroups` — 1 item, added on 1 October 2026: the Iwahori–Hecke algebra over O with its Bernstein presentation (item 37). The route coalesces with the parahoric-centers Part II proposed by PAPER-KISIN-PAPPAS-18 and extended by PAPER-HE-21, PAPER-ZHU-17 and PAPER-CLOZEL-THORNE-17.

## Source issues (`sourceIssues` E1–E18)

Sixteen entries, every one verified in the text (and, where sub/superscripts or hats matter, on a rendered page image). The substantive ones:

| id | locator | printed | correction |
|----|---------|---------|------------|
| E1 | Lemma 9.1(i), p. 51 | "finite étale **K**-scheme" | finite étale **Y_K**-scheme — the proof of Proposition 9.2 uses it as "a smooth, geometrically connected **curve** over K" |
| E5 | Lemma 8.15, p. 43 | hypothesis stated for one unnamed P = MN | must quantify over **every proper standard parabolic** P = MN, as the proof and the application in Lemma 8.16 do |
| E6 | proof of Lemma 8.16, p. 44 | I_P = constituents of A_0(N(A_K)M(K)\G(A_K))_χ | constituents of A_0(M(K)\M(A_K))_χ — otherwise Proposition 8.12 does not apply and the induction i^{G(A_K)}_{P(A_K)}(π ⊗ ψ) is meaningless |
| E8 | proof of Proposition 5.19, p. 23 | h¹(Γ_{K,S∪Q}) = r#Q = h¹(Γ_{K,S∪Q}) + (r−1)#Q | the second h¹ is over **S**, not S ∪ Q; as printed the display forces (r−1)#Q = 0 |
| E13 | proof of Proposition 10.2, p. 54 | "dim_k ĝ_k ≥ r" | dim_k ĝ^{ẇ}_k ≥ r — as printed the clause is vacuous |
| E7 | pp. 46–47 vs. p. 48 | H_0 / H^*_0 used with the meanings **opposite** to their definition, and before it | read H′_0 = C_cusp(U, O)_m, H_0 = Hom_O(H′_0, O) throughout |
| E3, E4 | p. 47 | "According to Lemma 5.15"; "ρ_m(Frob_v)" twice | Lemma 5.17; σ̄_m(Frob_v) — no ρ_m is defined in the paper |
| E2 | §8.4(ii), p. 45 | "Z_{Ĝ^{ad}}(σ̄_m(Γ_K)) of Ĝ_k" | of Ĝ^{ad}_k, as Theorem 4.10 and the paper's own paraphrase have it |
| E14, E15 | pp. 59–60, 65 | "let η : G → H denote the adjoint group of G"; "applying Theorem 90"; "ρ|Γ_{K′}" | η is the isogeny to the adjoint group H; **Hilbert's** Theorem 90; ρ_λ|Γ_{K′}, quantified over λ as in Theorem 11.4 |

E9–E12 collect fourteen hat-, index- and variable-slips with mathematical content, grouped by section: `g` for `ĝ` in the coefficient module of §5, `G` for `Ĝ` five times in §§2–4, `Art_{K_v} : K^×` for `K_v^×`, a bilinear form "on G" that must be on 𝔤, `K[X]` for `K[T]`, division by λ where the uniformizer ̟ is meant, and `G_k·φ(x)` for `G_k·x` in the slice-theorem proof. E16 is the typographical group (ten doubled or dropped words, and [Ric88] printed with no volume or pages). Recorded in full, with reasons, in the JSON.

Deliberately **not** recorded: readings that turned out to be artefacts of the text layer (flattened exponents, ligatures, the `⫽` of the quotient), and "corrections" I could not verify against the rendered page.

Two entries were added on 1 October 2026 from the red team (findings /10 and /11), checked against v2 and the published text:

| id | locator | printed | correction |
|----|---------|---------|------------|
| E17 | Theorem 11.9(ii)–(iii), p. 65 | π only required to be cuspidal with π^{G(Ô_K)} ≠ 0; the embedding also called φ | π must correspond everywhere locally to the Coxeter homomorphism φ, as in Theorem 10.11, which the proof of Theorem 11.8 uses; rename the embedding |
| E18 | Appendix A, step 3, p. 68 | Ē_Ť1 "automatically strongly regular", strong regularity defined "for any w′ ∈ W" | false: G_2 with a Ť[2]-torsor from an elliptic curve is a counterexample, since −1 ∈ W fixes Ť[2]; assume strong regularity (w′ ≠ 1), which holds for Coxeter parameters, the only case used |

## Prerequisites not yet covered

43 entries. Three deserve flagging for the atlas: **[Ras]** (Raskin, *Chiral principal series categories I*) and **[Con]** (Conrad, *Lifting global representations with local properties*) are **preprints** on which Appendix B and the reduction of Theorem 11.1 to the simply connected case respectively depend; **[BAdR]** (Böckle–Arias-de Reyna) is announced as "in preparation" and is where results like Proposition 6.7 "will be studied exhaustively". Theorem 11.1 therefore rests, as published, on two unpublished manuscripts. Beyond those, the atlas has no stage owning Braverman–Gaitsgory's geometric Eisenstein series ([BG02, Thm. 2.2.8] is the source of automorphy for Coxeter parameters) — the same gap PAPER-LAFFORGUE-18 reported: there is no geometric-Langlands roadmap, although `geomlanglands` is a galaxy id.

## Checks

`scripts/check_paper.py` passes. 31 missing items, each routed exactly once; 5 planned items carry stage ids owned by the named roadmaps. The new roadmap id `GValuedDeformationsAndPotentialAutomorphy` is free in `data/atlas.json` and in `research/blueprint/roadmaps/`.

After the fixes of 1 October 2026 the extraction still passes `scripts/check_paper.py`: 43 missing items, each routed exactly once across nine routes, and 10 planned items whose stage ids exist in `data/atlas.json`.

## Review (REV-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19, 23 September 2026)

An independent review by Claude Code, session cc-d67081, for issue
[#1469](https://github.com/CBirkbeck/tauceti-explorer/issues/1469). **Verdict: accept.**
No item, status or route changed.

- **The published text is available and was read.** The extraction recorded that it "could
  not be consulted (Acta Mathematica is not open access)". Unpaywall reports the DOI as gold
  open access and the publisher serves the full text; the review fetched it (111 pages,
  SHA-256 `15c4b966…ba2c`, printed page = PDF page), re-checked all 16 findings against it,
  recorded it under `source.publishedVersion`, and added published page numbers to twelve
  locators.
- **The published text differs from arXiv v2.** Copyediting repaired two recorded slips —
  E14(b) ("Theorem 90" → "Hilbert's Theorem 90", p. 88) and E16(b) (the misspelling
  "correspondenec"). Both are annotated in place as slips of v2 only, **not** mistakes in
  published work.
- **All 16 confirmed**, several decisively in print: E4 (p. 69 writes `σ̄_m(Frob_v)`, p. 71
  writes `ρ̄_m(Frob_v)` twice for the same element); E8 (p. 34 prints the same group on both
  sides of an identity, forcing `(r−1)#Q = 0`); E14(a) (Proposition 11.2 contradicts the
  proof of Theorem 11.1 on the same page); E12 (the local Artin map given source `K^×`).
- Where a finding bundles several elements, or its correction rests on a page-image reading
  of a hat the text layer flattens, **the verdict says so explicitly**.
- **Items and routes:** no library items; 5 planned items resolving; 31 missing items routed
  exactly once; the single Part II title is an exact prefix extension and its name is free.

Full report: `research/blueprint/reviews/REV-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19.md`.

## Fixes after the red team (1 October 2026)

Job FIX-RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19 (issue [#5014](https://github.com/CBirkbeck/tauceti-explorer/issues/5014)), Claude Code, session `cc-c2c06b`. It applied the nine medium findings of RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19 that the verifier confirmed, in the verifier's version where it differed. The report of what changed, finding by finding, is `research/blueprint/redteam/RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19.fixes.md`.

- **/2:** Proposition 8.10 and Corollary 8.11 (item 34) are routed to GS.5 (route 6), with the note corrected.
- **/3:** route 3's reason records IHG.1 as the one owner of the reconstruction theorem.
- **/4:** item 21 is split into items 21 and 37–40.
- **/5:** Proposition 8.3 (item 41) and Definition 8.7 with Lemma 8.8 (item 42) are split from items 32 and 33.
- **/6:** nine cited inputs and the residual representations of Levis are added as items 43–52, and the brief imports their owners.
- **/7:** item 12 and Lemma 5.9 (item 53, split from item 14) are routed to GlobalGaloisDeformations R04.1/R04.2 (route 7).
- **/8:** the route 1 brief says split semisimple and has new tests.
- **/10, /11:** items 31 and 28 are corrected, with new source issues E17 and E18.

Routes 6–9 are new and have no review verdict yet; routes 1–5 keep their positions.
