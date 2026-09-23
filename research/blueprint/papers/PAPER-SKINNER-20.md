# PAPER-SKINNER-20 — A converse to a theorem of Gross, Zagier, and Kolyvagin

Christopher Skinner, *A converse to a theorem of Gross, Zagier, and Kolyvagin*, Annals of Mathematics (2)
**191** (2020), no. 2, 329–354, doi [10.4007/annals.2020.191.2.1](https://doi.org/10.4007/annals.2020.191.2.1).

Issue #2170 · Claude Code · session `cc-7b31c4` · 2026-09-23 · **complete**.

62 items (0 library, 19 planned, 43 missing), four routes taking all 43 missing items exactly once, four
recorded source issues, thirteen prerequisites. No formalisation is claimed; no Lean file is part of this
job.

## Which version was read, and why it matters

The paper was read in full in the **published version**, the open-access PDF linked from the Annals article
page for volume 191 (2020), issue 2 (`https://annals.math.princeton.edu/2020/191-2/p01`), sha256
`cfdfab6e62ac507be40d1f0bc8d9cb8371d95b42c5ae259fde054c70fb20c214`, 26 pages, read 2026-09-23. The Annals
page records **Received 1 August 2013, Revised 1 December 2019, Accepted 2 December 2019, Published online
13 February 2020**, and lists no erratum.

The only arXiv version is **v1 of 28 May 2014** (23 pages; e-print archive sha256
`80518dbef19f9dcf86686421f8c59c76af0bb1b2d6e69481b306d893162c0099`, one file `GZconverse-arxivready.tex`
of 1464 lines; PDF sha256 `9e4650618c83394c400a10e990759f9fba42113eedc79fe2fcbe029d6c8381ff`). It
predates publication by six years, so it was read alongside the published PDF and the two were compared
statement by statement rather than being treated as interchangeable. The arXiv LaTeX was used for the exact
form of every displayed formula; the published text was read from the content streams of its PDF, which
recovers the ligatures and the font runs that a naive text layer loses.

**The comparison.** The two versions have the same nineteen numbered statements with the same numbers —
Theorems A, A′, B, C, D, E; Lemmas 2.2.1, 2.2.2, 2.3.1, 2.3.2, 2.8.1; Propositions 2.5.1, 2.6.1, 2.7.2,
2.7.3; Corollaries 2.5.2, 2.6.2; Conjecture 2.7.1; Remark 2.9.1 — and, except in §§2.6–2.7, the same text.
The one mathematical difference is the coefficient ring of the p-adic L-function and of the main
conjecture, recorded as **source issue E1**: the published version introduces `O^ur`, the ring of integers
of the completion of the maximal unramified extension `L^ur` of `L`, places `L^S_𝔭(f) ∈ O^ur[[Γ]]`, and
states Conjecture 2.7.1 and Proposition 2.7.2 as statements about ideals of `Λ^ur ⊗_O L` with `Λ = O[[Γ]]`
and `Λ^ur = O^ur[[Γ]]`; the preprint uses `O[[Γ]]` and `Λ ⊗_{Z_p} Q_p` throughout. The published
bibliography is also updated: Wan's paper is Algebra & Number Theory **14** (2020), 383–483 and the
citation is to its Theorem 1.2, not to part (2) of Theorem 1.1 of the 2013 Columbia preprint.

**Every item below states the published form.** A blueprint written from the preprint would state a main
conjecture over the wrong ring.

## What the paper does

Let `f ∈ S_2(Γ_0(N))` be a newform of trivial nebentypus and `A_f` the Eichler–Shimura abelian variety,
`M_f = End^0_Q(A_f)`. Gross–Zagier and Kolyvagin prove `ord_{s=1}L(f,s) = r ⟹ rank_Z A_f(Q) = [M_f:Q]r`
and `#Ш(A_f) < ∞` for `r = 0, 1`. The converse at `r = 0` was known (Skinner–Urban, Wan) and at `r = 1`
only for CM elliptic curves (Rubin). This paper proves it at `r = 1` for `N` squarefree:

* **Theorem A / A′.** If some odd `ℓ` has `π_ℓ` the unramified quadratic twist of the special
  representation, or two odd primes have `π_ℓ` special — equivalently, for a semistable elliptic curve,
  non-split multiplicative reduction at one odd prime or split multiplicative reduction at two — then
  rank one and finite Ш force `ord_{s=1}L(f,s) = 1`.
* **Theorem B**, the engine: a p-adic criterion over an imaginary quadratic `K` in which 2 and `p` split,
  with hypotheses (a)–(e) on ordinarity, residual irreducibility and ramification, the discriminant, and
  the Bloch–Kato Selmer group `H^1_f(K,V)` being one-dimensional and injecting into the semilocal
  cohomology at `p`.
* **Theorem C**, a mod-`p` Selmer criterion, and **Theorem E**, the rank-zero analogue; **Theorem D** is
  the Bhargava–Skinner positive-proportion theorem, for which Theorem B is a crucial input.

The proof is p-adic but avoids both a p-adic Gross–Zagier formula for a derivative and the non-degeneracy
of p-adic heights. The chain is: hypothesis (e) + Nekovář's parity theorem ⟹ `ε(f,K) = −1`; the general
Gross–Zagier formula of Yuan–Zhang–Zhang ⟹ it suffices that the Heegner point `P_K(f)` be non-zero; the
p-adic Gross–Zagier formula of Bertolini–Darmon–Prasanna and Brooks, `L^S_𝔭(f,1) ≐ (log_ω P_K(f))²` ⟹ it
suffices that `L^S_𝔭(f,1) ≠ 0`; and Wan's Iwasawa–Greenberg divisibility on `U(3,1)` gives
`L^S_𝔭(f,1) = 0 ⟹ H^1_𝔭(K,V) ≠ 0`, whose contrapositive applies because hypothesis (e) makes
`H^1_𝔭(K,V) = 0`. That last step, Lemmas 2.3.1 and 2.3.2, is a short and entirely self-contained Galois
cohomology argument, and it is where the splitting of `p` in `K` is really used.

## Routing

The maintainer had already routed this paper to a Part II, `RankOneConverse` (DESIGN-SKINNER, issue #951),
of `RankZeroOneBSD`, with the instruction not to re-route it. Accordingly:

1. **Part II of `RankZeroOneBSD`: `RankOneConverse`** — 37 items, area `iwasawa`, with the same id, title
   and area that PAPER-CASTELLA-ETAL-22 already reused for the Eisenstein-prime branch of the same
   p-converse. The parent proves the Gross–Zagier–Kolyvagin direction at BSD.3–BSD.4 and has no converse
   layer; BSD.5–BSD.9 plan leading-term formulas, not a Selmer-to-analytic implication. This route carries
   Theorems A, A′, B, C, E and their proofs, the Heegner point `P_K(f)` with its `ε_f`-normalisation and
   the Case I/Case II dichotomy, the twelve named hypotheses and the implications among them, the strict
   and `𝔭`-relaxed Selmer groups with Lemmas 2.3.1–2.3.2, the big Galois module `M` with Conjecture 2.7.1
   and Propositions 2.7.2–2.7.3, and the auxiliary-field construction of §§3–4.
2. **Source of `SelmerIwasawaCohomology` L4** — 1 item: Nekovář's parity theorem (Selmer complexes,
   Theorem 12.2.3) for Selmer groups of a modular form ordinary at `λ`. Nothing in the atlas plans a Selmer
   parity theorem; BSD.0 plans only the root-number parity of the *analytic* order. It is the sole source
   of the sign hypothesis (sgn) that all three of Yuan–Zhang–Zhang, Bertolini–Darmon–Prasanna and Wan
   require.
3. **Source of `AutomorphicGaloisRepresentations` R19.1, R19.3** — 3 items: density one of the ordinary
   primes for a non-CM form (Ramanujan bound plus Serre's density-zero theorem for `a_p(f) = 0`),
   irreducibility of `ρ̄_{f,λ}` for large `p` (Ribet), and its ramification at every prime dividing `N` for
   large `p` (Ribet level-lowering, planned at SerreWeightAndLevelOptimisation R20.2, plus the finiteness
   of newforms of weight two and level dividing `N` and multiplicity one). These are statements about the
   compatible system as a whole, which R19.1 and R19.3 own.
4. **Source of `GrossZagierAndArithmeticHeights` GZ.9** — 2 items about the BDP/Brooks p-adic L-function
   that GZ.9 constructs but does not state: that it lies in the Iwasawa algebra `O^ur[[Γ]]` rather than
   merely being continuous on `Γ` — without which §2.7 cannot be formulated at all — and the precise
   dictionary between the imprimitive `L^S_𝔭(f)` used here and the published `L_p(f,χ)`, including the
   character sets `Σ^{(2)}_{cc}(𝔫)`, `Σ^{(2)}_{cc}(𝔫^+)` and the constants `C(f,χ,1)`, `w(f,χ)`,
   `α(f,f_{GL_2})^{-1}`.

## Library and planned items

**No item of this paper is in the pinned libraries.** Tau Ceti has `WeierstrassCurve.Affine.selmerGroup₂`,
the 2-Selmer group from explicit descent, and a Chebotarev package, but nothing that matches the objects
here — Bloch–Kato Selmer groups of p-adic representations, `Sel_p(E)` for odd `p`, Iwasawa algebras of
anticyclotomic towers, Heegner points on Shimura curves. Mathlib has `PontryaginDual` and the standard
commutative algebra, but no Iwasawa module theory.

The nineteen **planned** items and their layers: the Eichler–Shimura variety `A_f` (ModularCurvesPartII
R14.5, EllipticCurveModularity R29.5, AutomorphicGaloisRepresentations R19.1); Gross–Zagier–Kolyvagin
(RankZeroOneBSD BSD.3–BSD.4, HeegnerPointEulerSystems HE.7, GrossZagierAndArithmeticHeights GZ.8); the
rank-zero converse (ModularIwasawaMainConjectures L1, L5); Theorem D (ArithmeticStatistics ST.4–ST.5); the
representation `V` (R19.1, R19.4, R19.5); the local root numbers of the base change
(GL2AutomorphicRepresentationsAndTransfer R16.3, R17.4, AutomorphicLFunctionsAndLocalFactors AL.2);
Bloch–Kato Selmer groups and the Selmer group of `A_f` (SelmerIwasawaCohomology L1, L2, L4); Tate duality
and the Euler characteristic (ArithmeticGaloisDuality R02.3–R02.4, SelmerIwasawaCohomology L1); the Heegner
point in Case I (HeegnerPointEulerSystems HE.0–HE.1, ComplexMultiplicationAndExplicitReciprocity CM.3);
Proposition 2.5.1 (GrossZagierAndArithmeticHeights GZ.0, GZ.3, GZ.8); the anticyclotomic tower and its
Hodge–Tate characters (AutomorphicPadicLFunctions L0, SelmerIwasawaCohomology L3, CM.4); the BDP p-adic
L-function and Proposition 2.6.1 (GrossZagierAndArithmeticHeights GZ.9); characteristic ideals
(PadicMeasuresIwasawaAlgebras L4–L5); the Panchishkin/Greenberg formulation (ModularIwasawaMainConjectures
L0, SelmerIwasawaCohomology L2); **Wan's two-variable divisibility** (AutomorphicCongruences L2, which
plans precisely the U(3,1) Eisenstein/Rankin–Selberg families and their two-variable divisibility);
Friedberg–Hoffstein (RankZeroOneBSD BSD.2, which names it); and Kato's Euler system as the alternative at
rank zero (KatoEulerSystems L4, RankZeroOneBSD BSD.4). Each planned item carries a note saying what the
named layer plans, and where the paper's use goes beyond it the excess is a separate missing item —
`bdp-integrality` and `bdp-identification` beyond GZ.9, `iwasawa-modules` beyond
ModularIwasawaMainConjectures L0, `wan-specialisation` beyond AutomorphicCongruences L2.

## Source issues

Four findings; three are new.

* **E1** (error, affects a stated result) — arXiv:1405.7294v1 places `L^S_𝔭(f)` in `O[[Γ]]` and states
  Conjecture 2.7.1 and Proposition 2.7.2 in `Λ ⊗_{Z_p} Q_p`. The interpolation formula contains the p-adic
  period `Ω_p^{4n}` of a CM elliptic curve, a unit of the completed maximal unramified extension and not of
  `O`, and the same is true of Wan's two-variable function in `O^ur[[Γ_K]]`; the preprint's statements are
  therefore not the ones its sources prove. `known` points at the published version, which introduces
  `O^ur` and `Λ^ur` and restates both over `Λ^ur ⊗_O L`.
* **E2** (misprint, affects nothing, **new**) — §2.7, published p. 346: "the rings `O^ur[[Γ_K]]` and
  `Λ^ur` are unique factorization **ideals**" should read "unique factorization **domains**"; the property
  used, and the content of the Skinner–Urban corollary cited, is that these Iwasawa algebras are UFDs with
  principal characteristic ideals. The sentence was read directly from the content stream of the published
  PDF, where it is unchanged from the preprint.
* **E3** (misprint, affects the proof, **new**) — §2.8, the proof of Lemma 2.8.1: "Suppose now that
  `ρ̄_{f,λ}` is reducible over `k̄`" must read "`ρ̄_{f,λ}|_{G_K}` is reducible over `k̄`". Lemma 2.8.1
  asserts (irr) + (res) ⟹ (irr_K), so the hypothesis for contradiction has to be the failure of (irr_K);
  as printed the proof assumes the failure of (irr) and then concludes "contradicting (irr)", proving
  nothing. The next sentence, which speaks only of the image of `ρ̄_{f,λ}|_{G_K}`, and the torus/Borel
  dichotomy that follows both confirm the intended reading.
* **E4** (misprint, affects nothing, **new**) — same proof: "if `τ_ℓ` is a topological generator of tame
  inertia at `q`" should read "at `ℓ`"; no prime `q` occurs in the lemma, the element is written `τ_ℓ`, and
  the footnote refers to `ρ_{f,λ}|_{G_{Q_ℓ}}`.

One further slip was noticed and deliberately **not** recorded, because it is purely grammatical and was
introduced in typesetting: §2.9 of the published version reads "So Propositions 2.7.2 and 2.7.3 apply that
if `H^1_𝔭(K,V) = 0`, then `L^S_𝔭(f,1) ≠ 0`", where the preprint reads "apply: if … then …". The proof of
Proposition 2.5.1 also drops a closing parenthesis in `⟨P_K(f),λ(P_K(f)⟩_{NT}`.

## Notes for the reviewer and for later blueprint work

* **`RankOneConverse` now has three contributing extractions**: the maintainer's DESIGN-SKINNER for this
  paper, PAPER-CASTELLA-ETAL-22 for the Eisenstein-prime branch, and this one. The design job should keep
  a single owner for the p-converse property and should not split Skinner's Theorem B from
  Castella–Grossi–Lee–Skinner's Theorem E; `CMRankZeroConverse` (from PAPER-BURUNGALE-TIAN-26) is the
  adjacent rank-zero CM roadmap and is not a supplier here.
* **Wei Zhang's theorem is not a substitute.** It drops the second half of hypothesis (e) and adds the
  hypothesis that the Tamagawa factors at the primes that split in `K` or are `≡ ±1 mod p` be prime to
  `p`; Theorem B imposes no Tamagawa hypothesis. Item 53 states the comparison; neither result subsumes
  the other, and a blueprint must plan both statements.
* The proof of Lemma 2.3.2 is terse. The step "it then follows that `X_𝔭 ⊂ H^1_f(K_{𝔭̄},V)`" uses that
  `X_f` is a `c`-eigenline and that `c(x)` has trivial component at `𝔭̄` for `x ∈ X_𝔭`, so that the
  `𝔭̄`-component of `x + c(x) ∈ X_f` is that of `x`; and the contradiction is that `X_f = X ∩ H^1_f(K_p,V)`
  then equals the two-dimensional `X`. A blueprint should write that out rather than copy the two lines.
* Remark 2.9.1 is the map of which hypothesis comes from which source: (i)–(iv) and (vi)–(viii) are
  inherited from Wan, Bertolini–Darmon–Prasanna and Brooks, (v) says ordinarity is needed only for Wan's
  theorem and the parity theorem, (ix)–(x) are the two halves of hypothesis (e), and (xi)–(xiii) point at
  Liu–Zhang–Zhang, Rubin and Wei Zhang. Item 52 keeps all thirteen; they should drive the hypothesis
  bookkeeping of the design job.
* The BDP/Brooks p-adic L-function is used at a point **outside** its interpolation range (the trivial
  character is not in `Σ^c_𝔭`), and its interpolation range is over crystalline characters of weight
  `(−n,n)` with `n > 0` and `n ≡ 0 mod p−1`. GZ.9 already warns against reusing a good-ordinary
  interpolation argument without proving the extension; the same warning applies here.
* `L^S_𝔭(f)` is *imprimitive*: the Euler factors at the primes of `S` not dividing `p` are removed, and `S`
  is `{ℓ | pND}`. Every comparison with a published p-adic L-function must carry that, and the constant
  `≐` in Proposition 2.6.1 depends on the eigenvalues at the primes of `S`.

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-SKINNER-20.result.json` reports `ok`, and
`python3 research/blueprint/intake.py check-files` reports no problems on the two deliverables. The
structural checks run while generating the result — every missing item routed exactly once, every planned
item naming layers that exist in the atlas, the source routes naming layers owned by the roadmap they name,
the Part II title matching its parent's and its area being a galaxy id — do not certify the mathematics.
No Lean file is authorised or compiled for this job.
