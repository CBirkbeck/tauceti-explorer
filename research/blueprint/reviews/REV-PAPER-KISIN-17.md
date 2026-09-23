# REV-PAPER-KISIN-17 — review of the extraction of Kisin, "Mod p points on Shimura varieties of abelian type"

**Verdict: accept, with corrections made in place.**

- **Reviewer:** Claude Code, session `cc-2aeb03`, 23 September 2026 (issue #1435).
- **Authors:** Codex, session `codex-c83e7a` (#1909), and Claude Code, session `cc-442dc5` (#2137, which completed it).
  This reviewer took no part in either.

**What was read.**

- **The paper.** M. Kisin, J. Amer. Math. Soc. 30 (2017), 819–914. The author's 99-page version of 27 August 2016 was
  re-fetched from https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf; its SHA-256 matches the extraction's. It was read in
  full, as page images, in six ranges:
  - the introduction and §§1.1–1.2;
  - §1.3 to §2;
  - §§3.1–3.5;
  - §§3.6–3.8;
  - §§4.1–4.4;
  - §§4.5–4.6, the Errata for [Ki 2] and the references.

  Every item was compared with the page. The published version was not accessible.
- **Kisin's corrected [Ki 2]** from his homepage, for footnote 8.
- **The libraries.** All 17 library declarations were opened at the pinned commits: Mathlib 082e2d3 and Tau Ceti f790474,
  from local clones at those commits.
- **The atlas.** The description of every planned stage and every source-route stage, and the atlas-wide stage descriptions,
  searched for the Part II subjects: affine Deligne–Lusztig varieties, Langlands–Rapoport, Honda–Tate, gerbs and Kottwitz
  triples.

**Checks.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KISIN-17.result.json` reports `ok`.
- `python3 research/blueprint/intake.py check-files` reports 0 problems on the four files.
- **Errata search.** The Crossref record of doi:10.1090/jams/867 shows no update or correction, and Kisin's preprint page
  lists no erratum.

## 1. Items

The extraction's item set was sound in outline but incomplete and often inexact.

- **Corrected fields (97):** 75 statements, 19 locators, 2 names and 1 kind. Typical examples:
  - D10a had υ₀ = σ(μ₀) where the paper has σ(μ₀⁻¹).
  - R08 and R09 used G(Q)^+ where the paper quotients by G(Q)_+; read literally, that makes Lemma 3.4.8 false.
  - X01 added smoothness conditions that §1.2.5 does not have.
  - K01 said "stably conjugate" where the paper uses conjugacy over ∏′Q̄_l and Q̄_p.
  - K26 weakened "the stabilizer" to "stabilizes".
  - Many locators were off by a part, or used a Proposition label for a Lemma.
- **Items removed (4).** The paper never uses them:
  - P02, Bruhat–Tits parahorics. Hyperspecial level is defined directly.
  - P04, pinned root subgroups.
  - X07 and X08, lemmas of the 2017 corrigendum to Chen–Kisin–Viehmann. That corrigendum is not cited by this paper; it
    stays in the prerequisites and in the affine Deligne–Lusztig brief, since it repairs the proof of the [CKV] theorem the
    paper uses.
- **Items added (96).** They cover the definitions, constructions and cited inputs the proofs use:
  - crystalline tensors and adapted filtrations (§1.1);
  - relative-position loci and the [CKV] lemmas (§1.2);
  - the integral Hodge embedding, promotion of level and Blasius–Wintenberger (§1.3);
  - the Kottwitz, Rapoport–Richartz, Rapoport–Zink, Borel–Tits, Steinberg, Kneser, Lang, Moret-Bailly and Shimura–Taniyama
    inputs;
  - the gerb constructions of §3.1, and the component torsors and A(G)-actions of §§3.6–3.8;
  - the twisting constructions of §4.2 and the refinements of §§4.3–4.5;
  - the covers used in the proof of Theorem 4.6.7.

  Duplicates across ranges were merged, for example Kneser and Steinberg, which several proofs cite. Six of the added items
  are planned:
  - strong and real approximation (AdelicAlgebraicGroups AA.4);
  - Shimura–Taniyama (ShimuraVarieties V5);
  - Moret-Bailly (PotentialModularityAndCompatibleSystems R23.1);
  - the Kottwitz classification and the κ–ν comparison for tori (BunGAndNewtonStrata BG1);
  - the Iwasawa decomposition (ReductiveGroupsPartII RG2.4).

  The other 90 are routed with their sections' existing items.

## 2. Statuses

- **Library.** All 17 library declarations exist at the pinned commits with the stated scope. Examples:
  `WittVector.FractionRing.frobenius` (Mathlib, `RingTheory/WittVector/Isocrystal.lean`), `GroupExtension`, `DividedPowers`,
  and Tau Ceti's torus, cocharacter and dominant-chamber API.
- **Planned.** All 12 planned stages exist and plan their items. Two of those items are removed (§1).

## 3. Routes

All nine routes are accepted; `PAPER-KISIN-17.review.json` gives a reason for each.

- **The five source routes** name layers that plan the mathematics: SF.1, ET.0, RG2.3–RG2.4, BG0–BG1 and A2/A3/A6.
- **The four Part II routes** are justified: no atlas stage mentions affine Deligne–Lusztig varieties, Langlands–Rapoport,
  Honda–Tate, gerbs of this kind or the quasi-motivic groupoid. Each id is shared with the other extractions that propose it.
- **Two corrections.**
  - *Titles.* Each Part II title now begins with its parent's exact atlas title:
    - "Complex Shimura varieties and canonical models, Part II: …";
    - "Hecke correspondences and local shtuka cohomology, Part II: …";
    - "Reductive algebraic groups, Part II: …";
    - "Finite flat group schemes and integral p-adic Hodge theory, Part II: …".

    The extractions sharing these ids use varying titles; the design jobs should adopt these.
  - *Briefs.* Each brief now names the confirmed corrections its design must carry.
- **ReductiveGroupsArithmeticPartII** is a second Part II of Tau Ceti's Reductive algebraic groups. It sits beside the
  existing ReductiveGroupsPartII (local structure and integral models) and does not duplicate it: its subject is global tori
  and gerbs.

## 4. Mistakes

**The extraction's five.** E1–E5 are confirmed. Two needed rewording:

- **E2:** the Errata do not say which step of the old proof used (1.5.3), so the reason now says only what the Errata say.
- **E4:** the Errata note Moonen's assertion but do not correct Moonen's text, so `known` now says "noted in print".

**New findings.** The six readings found 104 further mistakes. Each was checked a second time, independently, on the page
image:

- 102 confirmed, 7 of them reclassified;
- 2 rejected:
  - "§4.4.6 never shows I anisotropic modulo its centre": the proof of (2.1.7) on p. 31 does.
  - "E^r_p(G_{2,Z(p)})-action is a misprint": it is a harmless change of notation that (3.8.5) justifies.

The 102 are E6–E107, each with its `review` verdict. Most are misprints. The main ones:

- **E53 (error, stated results).** The definition of X̃^p(φ) in (3.6.1) constrains only the values of ε_l, not their
  ramification.
  - *Why it fails:* multiplying ε_l by a ramified cocycle with values in the finite central group ker(G̃ → G^der) keeps every
    printed condition. It produces classes not of the form h·(x·γ), for example for PGL_2 at every odd l ≠ p.
  - *What fails:* Lemma 3.6.2(2),(3), Corollary 3.6.4, Proposition 3.6.10 and the surjectivity of c_G in (3.7.4), whenever
    G^der is not simply connected.
  - *The fix:* require ε_l unramified for almost all l, as footnote 20 has in mind. S_τ and the main theorem are unaffected.
- **E34 (error, stated result).** Corollary (2.3.5) identifies I₀ ⊗ Q̄ with I ⊗ Q̄.
  - *Counterexample:* a supersingular elliptic curve over F_5 at a non-neat but rigid level such as K^p = ⟨γ⟩·K(3), where I₀
    is a torus and I = B^× is four-dimensional.
  - *Correction:* take k large enough (automatic at neat level), or use I_{/k} and I_{l/k}. The paper's later uses fit this.
- **E70 (error, stated result).** Corollary 3.8.6 omits the reflex degree r. There is a counterexample with GSp ×
  R_{K/Q}G_m and p inert in K; later uses carry r.
- **E8 (error, stated result).** The isomorphism (1.1.14) fails when G_{Z_p} is disconnected, and the step of (1.1.19) that
  uses it with it. It holds for connected G_{Z_p} by Lang and Hensel.
- **E104 (misprint, stated result).** Theorem 4.6.7 as printed omits p > 2, and no standing assumption supplies it; Theorem
  0.3 has it.
- **Errors in proofs whose statements survive:**
  - E98: the transfer π₁(G)_Γ → π₁(R_{F/Q_p}G)_Γ kills torsion, with a U(1) counterexample. The lemma follows from the
    argument of (3.4.2).
  - E45: Lemma 3.4.1's "conjugate to ξ_{∞,ab~}".
  - E64: the conjugation equation in Proposition 3.6.10.
- **Gaps in proofs.**
  - (3.3.2) is strictly monoidal only for μ in a Q-torus (E42).
  - Lemma 3.2.4 (E40), Lemma 3.5.8 (E49) and Theorem 3.5.11 (E51, E52).
  - Propositions 2.1.5 (E30), 4.2.6 (E78), 4.4.13 (E86) and 4.4.14 (E88).
  - The integrality steps of §§4.2.2 and 4.3.6 (E73, E80).
- **E7:** footnote 8's correction of [Ki 2], confirmed against Kisin's corrected [Ki 2]; recorded, like E1–E4, as a mistake
  of [Ki 2] corrected in print.

None of these is shown to make the main theorem false. Several need a missing argument that the paper does not give, and
each is recorded with its correction.

## Questions for the orchestrator

1. **Varying titles for shared Part II ids.** The six to nine extractions that share each id use varying titles, and some
   do not begin with the parent's atlas title (for example "Shimura varieties, Part II"). The design jobs should settle one
   title per id; this review uses the parents' exact atlas titles.
2. **The published version.** Only the author's version was read (99 pages; the journal's has 96). A reviewer with access to
   the published text should check whether E53, E34, E70 and E104 persist there, and update `known` if they are corrected.
