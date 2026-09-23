# Review: PAPER-GAN-ICHINO-18 (Gan–Ichino, The Shimura–Waldspurger correspondence for Mp_2n)

Job `REV-PAPER-GAN-ICHINO-18` (issue #1150), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-d67081`. **Verdict: accept**, after the corrections below, which were made in place. All six routes are accepted.

## What was read

- **The published paper**, Ann. of Math. 188 (2018), 965–1016 (52 pp.), read in full again. It is free on the Annals site, with the same SHA-256 (be54266f…) as the extraction's.
- **arXiv 1705.10106v3** (same SHA-256 5d1408c5…), compared where needed.
- **Errata:** Crossref records no update and the Annals page links no erratum.
- **Method:**
  - Four checkers split the paper: §§1–3; §§4–5 with §1.2–1.3; §6; Appendix A. Each compared every item with the text and checked mistakes on page images.
  - The checkers also consulted the cited sources behind E1–E3 and the new E7: Gan–Savin (Compos. Math. 148), Adams–Barbasch, Ichino–Lapid–Mao (arXiv 1404.2909v2), Jiang–Soudry (Ann. of Math. 157) and Bakić–Hanzer (arXiv 1902.07357).
  - Checker 3 checked the chain from §6 to Theorem 1.4 and found it complete, conditional on (6.1).

## Changes made to the extraction

- **Statements:** 29 corrected. Among them:
  - automorphic-theta now has the conjugate of ϕ(g) printed on p. 975; without it the lift would be θ(π^∨).
  - whittaker-mp now has the conjugate of ψ(x) printed on p. 1003; without it the item gives the ψ^{-1}-coefficient.
  - local-shimura has Θ = θ only for p-adic F.
  - kudla-filtration was garbled.
  - amf-nonsplit now includes the near-equivalence decomposition for non-split SO(V), which Lemma 6.10 uses.
  - prop-a-2 has the corrected hypothesis (E7).
  - psp-lemma has its supercuspidal and nonarchimedean hypotheses.
  - jacquet-langlands has its compatibility at the ramified places.
- **Locators:** 8 corrected. Lemma 6.12 runs to p. 1001.
- **Statuses:** unchanged. Two notes are recorded on the items:
  - selfdual-types (ML.4) and partial-l-function (AL.4) are only partly planned by those stages.
  - The planned Hasse invariant is not normalized as the paper's ε(V).
- **New items (15):**
  - **3 planned:**
    - Arthur's sign character ε_φ′ (ML.4);
    - local components of symplectic and orthogonal cuspidal representations (ML.4);
    - analytic properties of partial L-functions of GL_m (AL.2–AL.3).
  - **12 missing:**
    - 9 to the Part II, among them the Kudla–Rallis cuspidality criterion, ε-dichotomy coherence, number fields with prescribed completions, the Whittaker Poincaré series and Plancherel support, and weak lifts to GL_2n;
    - 2 to MetaplecticAutomorphicForms;
    - 1 to AutomorphicLFunctionsAndLocalFactors (the Jacquet–Shalika bound).
- **Part II brief:**
  - The sentence recording E1–E3 as open proof obligations is replaced, since all three are rejected.
  - A corrections paragraph is added.

## Mistakes in the paper (`sourceIssues`, E1–E7)

- **E1 is rejected.** Gan–Savin's proof of their Lemma 7.4 needs only −s + t₁ ≠ (k − r)/2. With t₁ ≤ 0 that holds for every s > −1/2, the range Lemma 5.2 needs, and the p-adic case is also covered by Atobe, Th. 3.13.
- **E2 is rejected.** Adams–Barbasch's Theorem 8.4 covers real dual pairs of any size, and for p-adic fields the same short argument runs in Kudla's framework. The step needs no stable range, temperedness or A-packets.
- **E3 is rejected.** Ichino–Lapid–Mao's Appendix A states the Mp analogue of their Lemma A.2 and names its extra input, so the paper cites a stated result.
- **E4** is confirmed: a misprint in the proof of Proposition 4.1 and reference [44].
- **E5 (new; gap in the proof of Proposition 3.1).**
  - The pole of L^S(s, θ^abs_ψ(π)) at s = r − n + 1/2 needs L^S_ψ(r − n + 1/2, π) ≠ 0, but the text invokes only holomorphy for Re s > n + 1.
  - Absolute convergence of the Euler product there, which the bounds on the unitary Satake exponents give, fills it in one line.
- **E6 (new):** "form" for "from" on p. 997.
- **E7 (new; gap in a stated result: Proposition A.2).**
  - The proof uses that θ_{ψ_{v0}}(π_{v0}) is supercuspidal, citing Jiang–Soudry Th. 2.2(2). That theorem fails for n ≥ 2:
    - Take the extension σ′^{−ε} of a generic supercuspidal σ′ of SO_{2n−1} that first occurs at Mp_2n (conservation relation).
    - Its lift π is a ψ-generic supercuspidal of Mp_2n.
    - The lift of π to SO_{2n+1} is square-integrable, not supercuspidal. This agrees with Bakić–Hanzer, Prop. 3.5(2).
  - For such π_{v0}, the global lifts in the proof need not be cuspidal, and the isolation argument breaks.
  - **Fix:** assume θ_{ψ_{v0}}(π_{v0}) is supercuspidal, equivalently that its parameter contains no S_2. For n = 1 this is the printed condition.
  - **Effect:** Proposition A.1 applies A.2 only to descents of supercuspidals, which satisfy the fix, so Propositions 6.5 and 6.6, Corollary 6.7, Lemmas 6.8–6.12 and Theorems 1.1 and 1.4 are unaffected.
  - No correction was found for Gan–Ichino, Ichino–Lapid–Mao or Jiang–Soudry.
- **Effect:** Theorem 1.1 stands, and Theorem 1.4 stands conditional on (6.1).

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-GAN-ICHINO-18.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once, and every stage id exists in the atlas.
