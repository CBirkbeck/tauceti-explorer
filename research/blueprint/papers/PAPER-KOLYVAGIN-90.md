# PAPER-KOLYVAGIN-90: Kolyvagin, *Euler systems*

V. A. Kolyvagin, "Euler systems", *The Grothendieck Festschrift*, Vol. II, Progress in Mathematics 87, Birkhäuser (1990), 435–483, doi:10.1007/978-0-8176-4575-5_11.
Extraction by Claude Code (session `cc-f805bf`), 29 September 2026, issue #4500.

## What was read, and what was not

Kolyvagin's article is not publicly available, and I did not read it. The maintainer's note on the issue asks for the rank-one finiteness argument (Mordell–Weil rank and Ш from a nonvanishing Heegner point), taken from a public text that develops the method, with a record of which text was read. Two texts were read:

1. **Rubin, *Euler systems*.** The author's 1999 draft of *Annals of Mathematics Studies* 147 (Princeton, 2000), 187 pp., SHA-256 recorded. I read it completely in these ranges:
   - the Introduction;
   - Chapter I (Galois cohomology and duality);
   - Chapter II (definition and main results);
   - Chapter III §§1–2 (cyclotomic units, Kolyvagin's original class-group application) and §5 (Kato's Euler system for elliptic curves);
   - Chapter IV (Kolyvagin's derivative classes) and Chapter V (bounding the Selmer group);
   - Chapter IX (variants, including anticyclotomic Euler systems, the abstract setting of Heegner points);
   - Appendix B.

   I did not extract Chapters VI–VIII (twisting, Iwasawa theory, p-adic L-functions), which go beyond Kolyvagin's article.
2. **Gross, "Kolyvagin's work for modular elliptic curves".** *L-functions and Arithmetic*, LMS Lecture Note Series 153 (1991), 235–256, doi:10.1017/CBO9780511526053.009. I read the whole chapter on a scanned copy.

Each item's locator names its text. The status is `complete` for this scope.

## The mathematics

**The method.** An Euler system is a norm-compatible family of Galois cohomology classes over abelian extensions: in Kolyvagin's article, cyclotomic units and Heegner points.
- Kolyvagin's derivative operators D_𝔮 turn it into classes κ_{𝔯} that are unramified away from p𝔯 and controlled at the auxiliary primes 𝔮 | 𝔯 (Rubin IV).
- Poitou–Tate duality then bounds the Selmer group of the dual representation (Rubin V; Theorems II.2.2, II.2.3 and II.2.10).
- Kolyvagin's original congruence condition reappears in Rubin as Corollary IV.8.1.

**Class groups.** For cyclotomic units the method bounds χ-eigenspaces of ideal class groups (Rubin III.2, IX.1).

**Heegner points (Gross).** Suppose the Heegner point y_K ∈ E(K) has infinite order. Then E(K) has rank one and Ш(E/K) is finite. Gross proves the clean case in full: p odd, full GL₂ image mod p, and p ∤ y_K give Sel_p = ℤ/p · δy_K. The proof goes through:
- the classes c(n) and d(n);
- local Kummer theory at Kolyvagin primes, and Kolyvagin's local pairing formula (7.6);
- a Čebotarev and Kummer-duality argument over K(E_p).

Gross only quotes Kolyvagin's general bound #Ш | t·I_K² (Theorem 1.3) and never descends to ℚ.

**Kato's Euler system (Rubin III §5).** Rubin applies the method to Kato's Euler system and gets rank zero and finite Ш when L(E,1) ≠ 0. He credits the first proof of this to Kolyvagin.

## What the atlas already has

The extraction has 403 items: 286 are `planned`, 12 are `library` and 105 are `missing`.

**Where the planned items sit.**
- EulerSystemsAndKolyvaginSystems ES.0–ES.5 plans the abstract machinery; ES.4 cites "Rubin II.2.2" for the core bound.
- HeegnerPointEulerSystems HE.0–HE.7 plans the Heegner-point argument, and RankZeroOneBSD BSD.3 plans the analytic-rank-one theorem.
- SelmerIwasawaCohomology, ArithmeticGaloisDuality and ProfiniteCohomology plan Chapter I's background.
- KatoEulerSystems and EulerSystemsCyclotomicMainConjecture plan the two worked Euler systems.

**Library items.** They cover:
- Mathlib's continuous cohomology, `cyclotomicCharacter`, `Matrix.charpolyRev`, `WeierstrassCurve.LFunction`, and the norm of ζ_ℓ − 1;
- Tau Ceti's explicit H¹, degree-one inflation–restriction and the coinduced module `TauCeti.coind`;
- Tau Ceti's canonical-height criterion ĥ(P) = 0 ⇔ P torsion.

## Routes

All five routes are `source` routes to existing layers; no new roadmap is needed.

1. **EulerSystemsAndKolyvaginSystems (ES.0–ES.4, ES.8). 70 items.** These are the steps of Rubin's version of Kolyvagin's method that the stages do not name:
   - the universal Euler system, its freeness and the Ext¹ vanishing (IV §§2–3);
   - δ_L and the induced modules (IV §4), and unramifiedness of the derivative classes with their local lifts (IV §6);
   - the lifted telescoping identity, Lemma IV.7.3, and Kolyvagin's congruence (IV.8.1);
   - Lemma V.3.2, and the universal-norm lemmas of Appendix B;
   - Chapter IX's variants: rigidity, finite depth, χ-anticyclotomic Euler systems (Theorem IX.4.3) and triviality at Σ.
2. **HeegnerPointEulerSystems (HE.3–HE.8). 22 items.** The steps of Gross's rank-one argument that HE.3–HE.7 do not state:
   - local Kummer theory at Kolyvagin primes, and Kolyvagin's pairing formula (7.6);
   - the ±-eigenspaces (8.1);
   - the whole §9 Čebotarev and Kummer-duality argument (9.2–9.6);
   - the classes d(n) in Ш, and the Bertolini–Darmon remark.

   The route's reason warns that HE.7's all-prime statement still needs Kolyvagin's article or another source, since Gross only quotes it.
3. **KatoEulerSystems (L3, L4). 9 items.** The local inputs of Rubin III §5: exp* of the singular quotient, finite generation of E(ℚ_∞), the image hypotheses, the split multiplicative case, Greenberg's result, and the p-part of BSD.
4. **EulerSystemsCyclotomicMainConjecture (L1, L3). 2 items.** Rubin IX.1's cyclotomic-unit Euler system and |A_L^χ| = [E_L^χ : C_{L,χ}]: Kolyvagin's original class-group application.
5. **RankZeroOneBSD (BSD.5, BSD.9). 2 items.** Gross's Conjecture 1.2(2), the order of Ш through the Heegner index, and the worked example 37a.

## Mistakes (`sourceIssues`)

Thirty-nine candidates were each checked on page images by an independent reader, and all were confirmed; some had their kind or correction adjusted. Rubin's file is a 1999 draft, so some Rubin slips may be corrected in the published book, which I could not consult. Items use the corrected statements.

**Rubin: errors in stated results.**
- **Theorem IX.3.3 (E25).** The annihilator is inverted. It should be M/n, not n; as printed, the zero Euler system would kill the Selmer group.
- **Proposition III.5.8(ii) (E10).** H¹(GL₂(ℤ_p),(ℚ_p/ℤ_p)²) = 0 fails for p = 2.
- **Proposition III.5.1 (E11).** It needs p odd: at p = 2, λ_E(E₁(ℚ₂)) can be 4ℤ₂.
- **Remark IX.4.2 (E26).** "Conductor of χ" should be "conductor of E" in the Heegner hypothesis.
- **Theorem IX.5.3 (E30).** n*_W should use the Σ-relaxed Selmer group.

**Rubin: other errors and gaps.**
- **Remark B.2.6 (E5).** Finiteness fails for H² in general.
- **Lemma IV.2.5 (E14).** The printed H² formula is wrong for non-cyclic groups; the proof survives.
- **Corollary IV.8.1 (E19).** It applies Lemma IV.7.3 outside its stated hypothesis, which the proof of 7.3 does not use.
- **Example IV.8.2 (E21).** It drops the valuation factor.
- **Corollary III.5.17 (E12).** It leaves the real place open at p = 2.

**Gross.**
- **(3.5) (E33).** The second D_ℓ⁰ formula is off by (ℓ+1)Tr_ℓ.
- **§9 (E39).** It uses p ∤ D, which is not among the hypotheses. The needed disjointness fails only when K = ℚ(√−p), and the conclusions survive.
- **Four reference and notation slips** (E34–E38).

**Misprints.** The rest are index, group and cross-reference slips.

## Prerequisites the atlas does not cover

- **Kolyvagin (1988), *Math. USSR-Izv.* 32.** The first Heegner-point descent.
- **Kato (2004), *Astérisque* 295.** Kato's Euler system for modular forms.
- **Thaine (1988), *Ann. of Math.* 128.** Thaine's method with cyclotomic units.
- **Bertolini–Darmon (1990), *J. reine angew. Math.* 412.** Kolyvagin's descent over ring class fields.
- **Mazur (1978), *Invent. Math.* 44.** Rational isogenies, used for the GL₂ image.
- **Serre (1972), *Invent. Math.* 15.** The open-image theorem.

Gross–Zagier is already PAPER-GROSS-ZAGIER-86 in the batch list. Kolyvagin's article itself remains unread, and reading it would allow the all-prime bound of HE.7 to be sourced directly.
