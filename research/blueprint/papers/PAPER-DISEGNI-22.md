# PAPER-DISEGNI-22 — The universal p-adic Gross–Zagier formula

Daniel Disegni, *The universal p-adic Gross–Zagier formula*, Inventiones mathematicae **230** (2022),
no. 2, 509–649, doi [10.1007/s00222-022-01133-w](https://doi.org/10.1007/s00222-022-01133-w).

Issue #1260 · Claude Code · session `cc-7b31c4` · 2026-09-23 · **complete**.

153 items (1 library, 22 planned, 130 missing), nine routes taking all 130 missing items exactly once,
six recorded source issues, seventeen prerequisites. No formalisation is claimed; no Lean file is part of
this job.

## The source read

arXiv:2001.00045v4 (23 February 2024) was read in full, including both appendices and the bibliography.
The abstract page carries the journal reference Invent. math. 230 (2022), 509–649 and the comment
"89 pages, 1 figure. **New in this version: a correction as Appendix B (to appear separately in
Invent. math.)**". Two files were used:

* the e-print archive of v4, sha256 `24d867874a39fd374d8820069c76e972d9260b7bc6b0b5617e2bafdcc86d330c`,
  whose main file `univ-corr-arxiv.tex` has 6803 lines and sha256
  `ca60c39e761b3e5b5dd0d4c6423c0eba4703b9065850ce5909a95b58d7399f2e`, and which uses `smfart.cls` with
  `smfenum.sty`, `smfhyperref.sty`, `smfthm.sty`;
* the compiled PDF of v4, sha256 `c50d0cd394a5e803c0b7adef5700b425f4f304679415b2c666cd351eefcd9602`.

**Numbering.** The SMF class puts `theo`, `prop`, `conj`, `coro`, `lemm`, `defi`, `rema`, `exem` *and*
`enonce` on one counter, numbered within each subsection (`\NumberTheoremsIn{subsection}`), with a
separate equation counter also within subsection; the lettered `theoA` environment is numbered A–H, and
`customthm`/`customconj` carry the manual labels B^ord and Pf. Re-deriving the numbering from the LaTeX
gives **107 numbered statements**: 37 Lemmas, 26 Propositions, 15 Remarks, 12 Definitions, 8 lettered
Theorems, 4 Theorems, 4 Corollaries, 1 Construction. It was checked against every one of the 68 typed
cross-references the PDF prints. Exactly two apparently disagreed: `2.4.5` is an external citation
(Howard, proof of Proposition 2.4.5), and `5.2.2` is a genuine misprint, recorded below as E3.

**Mechanical audits of the source**, all clean except the one finding: no duplicate `\label`; no
undefined `\ref`; and, comparing the capitalised word introducing each `\ref` with the environment
carrying the target label, exactly one mismatch, again E3.

## What the paper does

Fix a prime `p`, a totally real field `F`, a CM quadratic extension `E/F`, an incoherent totally
definite quaternion algebra `B` over `F_A`, split at `p`, with ramification set `Σ ⊔ {v|∞}`, and the
groups `G`, `H = Res_{E/Q}G_m`, `(G×H)' = (G×H)/Z`, `H' = H/Z`. The associated towers of Shimura
varieties are `X/F`, `Y/E`, `Z/E`, `Y'/E`, with a diagonal `e' : Y' → Z`. For an ordinary, locally
distinguished automorphic representation `Π = π ⊗ χ` of `(G×H)'(A)` of cohomological weight `W` over a
p-adic field, the Abel–Jacobi images of the CM 0-cycles with coefficients in the local system attached
to `W` give an `H'(A)`-invariant functional `P_Π : Π → H¹(E,V_Π)`.

* **Theorem B** computes `h_V(P_Π(f₁),P_{Π^∨}(f₂))/(f₃,f₄)_Π` as `e_{p∞}(V)^{-1}·𝓛'_p(V_{(π,χ)},0)`
  times the normalised product `Q` of local toric integrals.
* **Theorem C** constructs the universal Heegner class `𝓟` over a locally distinguished Hida family and
  shows that it specialises to `P^{ord}_{Π_z}` at *every* classical point, answering the
  generalisation of Howard's question.
* **Theorem D** is the interpolated identity over the family: the height of `𝓟` against the
  interpolated pairing equals the normal derivative `d^♯𝓛_p(𝓥^♯)` times the interpolated toric
  functional `𝓠`.
* **Theorems A, E, F, G, H** are the applications: the p-adic Beilinson–Bloch–Kato conjecture in
  analytic rank one; an Iwasawa main conjecture for derivatives; the generic non-vanishing of p-adic
  heights on self-dual CM motives and along an exceptional classical Hida family; and a universal
  Waldspurger formula for coherent totally definite quaternion algebras.
* **Conjecture Pf** (§7.3) predicts the order of vanishing and leading term of `𝓟` at any classical
  point in terms of Pfaffian regulators of the Nekovář–Venerucci height pairing, generalising
  conjectures of Bertolini–Darmon; Remark 7.3.4 gives a new proof of the theorem of Greenberg–Stevens.

The technical heart is **Appendix A**, which the author calls the main technical novelty: semilocal
operators `w_a^{ord}` and `γ^{ord}_{H'}` at `p∞` intertwining the ordinary, anti-ordinary and toric
parts of a locally algebraic admissible or coadmissible representation, and the evaluation of the local
toric periods of the resulting vectors in terms of Deligne–Langlands gamma factors
(Proposition A.3.4), which is what produces the interpolation factor `e_v` and, with it, the
characterisation of exceptional representations.

## The correction in Appendix B, and why every item states it

Appendix B of v4 is a published Correction, announced on the arXiv abstract page as "to appear
separately in Invent. math.". After a correction to the companion paper *The p-adic Gross–Zagier
formula on Shimura curves, II: nonsplit primes*, the trivial-weight formula that the whole
interpolation argument starts from is proved only for representations satisfying

> (★)  for each `v ∈ S_{p,ns}`, `v` is inert in `E` and `χ_v` is unramified,

where `S_{p,ns}` is the set of p-adic places of `F` nonsplit in `E`. Consequently:

| result | effect |
| --- | --- |
| Theorem A | holds under the extra hypothesis (★) |
| Theorems B and B^ord | hold under the extra hypothesis (★) |
| Theorem C | not affected |
| Theorems D and E | hold for **Hida\*** families (assuming no p-adic place of `F` is ramified in `E`) |
| Theorem F | not affected |
| Theorem G, and the Greenberg–Stevens proof of Remark 7.3.4 | not affected |

A Hida\* family is an irreducible component of `𝓔^{ord,*}_{K^p}`, built from the completed homology
`M^*_{K^p}` whose limit is taken only over `K_p ⊇ N_{G,0} × ∏_{v ∈ S_{p,ns}} O^×_{E,v}`; equivalently it
is the closure of the classical points satisfying (★). The original proofs still apply, with Lemma 7.1.4
replaced by the statement that in a Hida\* family the classical points of trivial weight satisfying
(p-crys) are dense; condition (ram) is no longer relevant.

The body of v4 is unchanged, so the printed statements of Theorems A, B, B^ord, D, E and Lemma 7.1.4 do
not carry these hypotheses. **Items 106–108, 110, 111, 114, 117, 118 of this extraction state the
corrected forms**, and items 106 and 107 record (★) and the Hida\* construction as objects in their own
right. The discrepancy itself is recorded as source issue E1.

Two consistency checks were made rather than assumed. Theorem F assumes that every `v | p` splits in
`E`, so `S_{p,ns} = ∅` and (★) is vacuous — which is why the Correction can say it is unaffected. The
proof of Theorem G uses Theorem C and Bertolini–Darmon but never Theorem D, and the Greenberg–Stevens
application has `F = Q`, `p` inert in `E` and `χ = 1` unramified, so (★) holds there.

## Routing

All 130 missing items are routed exactly once.

1. **Part II of `GrossZagierAndArithmeticHeights`: `UniversalPadicGrossZagierFormula`** — 90 items.
   GZ.8 plans the complex Gross–Zagier pairing and GZ.9 the *split ordinary p-adic logarithm/toric
   formula*, whose own description forbids identifying it with a p-adic height derivative formula and
   excludes the exceptional-zero case. The p-adic height side, its extension to arbitrary cohomological
   weight and to CM extensions of a totally real field, its interpolation over a Hida family, and the
   Bertolini–Darmon exceptional-zero branch are therefore new layers in that roadmap's direction. This
   route carries the incoherent-group framework, the Heegner cycles with coefficients, the sheaves over
   the Hida family, the dualities of §4.1, the interpolation of the toric pairings, §6 in full, the
   lettered theorems, Conjecture Pf, and all of Appendix A.
2. **Part II of `SelmerIwasawaCohomology`: `SelmerComplexesAndPadicHeights`** — 12 items. This *reuses
   the candidate id, title and area proposed by PAPER-DISEGNI-LIU-24*, which plans Nekovář's height
   pairing and the bi-extensions of cycles from Appendices A–B of Disegni–Liu. §5 of the present paper
   is the family version of the same theory: continuous cohomology of ind-admissible sheaves on the
   category of open subschemes of `Spec R°`, base change and specialisation, Greenberg data and Selmer
   complexes over a base with their perfectness, and Venerucci's conormal-valued height pairing with its
   symmetry criterion. SelmerIwasawaCohomology L2 plans the Selmer complex as a mapping fibre for a
   single lattice `T` over a p-adic ring, not for a sheaf over a base, so this is an addition, not a
   duplicate. **Do not propose a second p-adic-height roadmap.**
3. **Source of `PadicFamilies` L0, L4, L5** — 13 items: the weight spaces of all five groups with the
   Leopoldt defect; the ordinary completed homology of the quaternionic tower and the Künneth-plus-
   quotient step for `(G×H)'`; the ordinary eigenvariety, the étaleness of `κ` at classical points, the
   fibres of `𝓜`, the abelian eigenvariety for `H`; conductor constancy and descent to the new level;
   Schur's lemma; and, most importantly, the construction of the ordinary filtration
   `0 → 𝓥⁺_v → 𝓥_v → 𝓥⁻_v → 0` **with no hypothesis on the residual representation**, which the paper
   itself flags as the one point beyond Hida and Wiles.
4. **Source of `AutomorphicGaloisRepresentations` R19.6** — 2 items: pseudocharacters over an integral
   scheme, Rouquier's Azumaya theorem, and uniqueness of a representation with a given irreducible
   pseudocharacter up to a Galois-trivial line bundle. Tau Ceti's Skolem–Noether theorem is the field
   case only and does not supply the Azumaya-over-a-scheme statement.
5. **Source of `GL2AutomorphicRepresentationsAndTransfer` R16.2, R16.3** — 2 items: the local Langlands
   correspondence in *analytic* families of Disegni's J. LMS paper, which is a different theorem from
   Helm's integral `ℓ ≠ p` families planned at SmoothRepresentationsOfLocalGroups SR.5, together with
   its application giving a uniform level at `Σ` along a Hida family.
6. **Source of `AutomorphicPadicLFunctions` L0, L1, L5** — 6 items: the two-variable p-adic L-function
   `𝓛_p(𝓥^♯)` with its full interpolation formula and its polar locus, the cyclotomic space `Γ_F`, the
   interpolation factors `e_v`, `e_∞`, `e_{p∞}`, the restriction defining `𝓛_p(V_{(π₀,χ)},s)` and its
   derivative, the comparison with the one-variable L-function of a modular abelian variety, and the
   non-vanishing of the *normal derivative* of Katz's L-function.
7. **Source of `HeegnerPointEulerSystems` HE.8** — 1 item: Fouquet's dihedral Iwasawa theory of nearly
   ordinary quaternionic automorphic forms over a totally real field, whose Theorem B(i) and B(iii) are
   the Euler-system inputs of Theorem A(2) and Theorem E. HE.8 currently plans only the case over `Q`.
8. **Source of `ModularIwasawaMainConjectures` L6** — 1 item: the anticyclotomic main conjecture for
   self-dual Hecke characters of a CM field in Hida's form, with the Burungale–Disegni sign-change
   lemma, which is the branch Theorem F consumes and which L6's table does not list.
9. **Source of `GrossZagierAndArithmeticHeights` GZ.4, GZ.5** — 3 items: the normalising local L-value
   `𝓛(V_{(π,χ),v},0)`, the identification of the toric integral with a product of GL₂ × GL₁ zeta
   integrals when `E_v = F_v ⊕ F_v`, and its value on the line of `H'`-invariants when `B_v` is
   nonsplit. These are local statements about the object GZ.4 already owns.

## Library and planned items

Exactly one item is **library**: item 38, the openness of the locus where a square map of free modules
specialises to an isomorphism, which is `D(det T) ⊂ Spec R` — `mathlib:PrimeSpectrum.isOpen_basicOpen`
with `mathlib:Matrix.isUnit_iff_isUnit_det` and `mathlib:LinearMap.isUnit_iff_isUnit_det` at the pinned
commit. Nothing else in this paper is in the pinned libraries. In particular Tau Ceti's
`TauCeti.ContCohomology` provides continuous cohomology of *discrete* modules in degrees ≤ 2 and does
not supply §5's theory; `IsAzumaya` is present in Mathlib but the automorphism theorem of
Knus–Ojanguren is not; and there is no Pfaffian.

The 22 **planned** items and their layers: the Shimura towers and their local systems
(ShimuraData D4, ShimuraVarieties V1/V8, HilbertModularVarietiesAndShimuraCurves H3, R18.1, R18.4); the
Galois representations of Hilbert modular forms and Carayol's decomposition (AutomorphicGaloisRepresen-
tations R19.2, R19.4, R19.5, R19.6); Hida control for `G` and `H`, the finite flatness of the ordinary
Hecke algebra, the residual representation, the Hida–Wiles family representation and the ordinary
projector (PadicFamilies L0, L0a, L4, L5); the condition (F) and Greenberg local conditions
(ArithmeticGaloisDuality R02.3, SelmerIwasawaCohomology L0, L2); the normalised toric integrals,
Saito–Tunnell multiplicity one and Waldspurger's unramified value
(GrossZagierAndArithmeticHeights GZ.4); the étale Abel–Jacobi map (GeneralizedHeegnerCycles GH.1);
Nekovář's Kolyvagin method (GeneralizedHeegnerCycles GH.5, HeegnerPointEulerSystems HE.6);
Cornut–Vatsal (HE.8, HE.8c); Katz's and Hsieh's L-functions (AutomorphicPadicLFunctions L3, L3h);
Jacquet–Langlands (GL2AutomorphicRepresentationsAndTransfer R17.1, R17.3); and Tate's gamma factor
(AutomorphicLFunctionsAndLocalFactors AL.1). Each such item carries a note saying exactly what the
named layer plans and, where the paper goes beyond it, which separate missing item carries the excess.

## Source issues

Six findings are recorded under `sourceIssues`; three of them are new.

* **E1** (gap, affects a stated result) — the printed Theorems A, B, B^ord, D, E and Lemma 7.1.4 do not
  carry the hypotheses that Appendix B imposes. `known` points at the published Correction. This is the
  finding that forces every theorem item to be restated.
* **E2** (misprint, affects nothing, **new**) — §7.3.6, first line of the proof of Theorem G: "`p` is
  inert in `A`" must read "`p` is inert in `E`". `A` is an elliptic curve; `E` is the imaginary
  quadratic field being chosen, and the rest of the proof needs exactly that `p` be inert in `E`.
* **E3** (misprint, affects nothing, **new**) — the proof of Lemma 6.4.4 cites "Proposition 5.2.2"; 5.2.2
  is a Lemma. Found by the cross-reference-type audit, which produced no other mismatch.
* **E4** (misprint, affects nothing) — footnote 12's citation to Nekovář should point to Proposition
  II.2.4(2), not §I.2; recorded in the Errata of Appendix B, and still uncorrected in the body of v4.
* **E5** (misprint, affects the proof) — the third-last line of the proof of Lemma 4.1.1 prints `≅`
  where only `↪` is true, since an ordinary `π_v` is the unique irreducible *subrepresentation* of the
  un-normalised induction; recorded in the Errata of Appendix B, and still uncorrected in the body.
  Item 44 states the corrected form.
* **E6** (gap, affects nothing, **new**) — Appendix B enumerates the effect of the correction on
  Theorems A, B, B^ord, C, D, E, F and G, and stops; Theorem H, the universal Waldspurger formula of
  §7.2, is the eighth lettered theorem and is not mentioned. It is in fact unaffected: §7.2 deduces it
  from its specialisations at all classical points satisfying (wt), which are dense by Lemma 3.1.4 —
  not by Lemma 7.1.4, the statement the Correction has to replace — and its input is Waldspurger's
  classical formula, not the paper on nonsplit primes. The omission is in the enumeration, not in the
  mathematics.

One further slip was noticed and deliberately **not** recorded, because it is pure notation and changes
nothing: Theorem A is stated for a Hilbert modular form `π₀` but writes `𝓛'_p(V_{(π,χ)},0)`, and the
definition (1.1.1) does the same; throughout the rest of the paper `π` is the quaternionic form whose
Jacquet–Langlands transfer is `π₀`.

## Notes for the reviewer and for later blueprint work

* **Do not re-plan `SelmerComplexesAndPadicHeights`.** Its id, title and area are those proposed by
  PAPER-DISEGNI-LIU-24; this extraction adds the family half of the same theory and nothing else.
* Corollary 6.4.5 asserts `H̃¹_f(E,𝓜) = H¹_f(E,𝓜)` over `X^{(3,f)}` on the strength of the four-term
  sequence (5.3.3). The argument is terse: the equality needs `H⁰(E_w,𝓜⁻_w) = 0` as a sheaf, which
  holds because `𝓜⁻_w` is torsion-free and `μ⁻_w ≠ 1` generically, and the latter holds because
  `X ⊄ X^{exc}` — every classical point of an exceptional family would have trivial weight at `v` by
  Lemma 6.4.6(1), contradicting the étaleness of `κ` at classical points. A blueprint should record
  that step explicitly rather than copy the one-line proof.
* The proof of Lemma 6.4.6(1) derives `w_σ = 2` at `v` from weight–monodromy and ordinariness but does
  not separately argue `l_σ = 0`; that follows from the vanishing of the Hodge–Tate weights of `V⁻_w`
  and should be written out.
* Appendix A is local at `p∞` and could later be split out of the Part II as its own layer; this
  extraction keeps it there because GZ.4 is the layer that owns local toric theory and the Part II is
  the first consumer of the ordinary/anti-ordinary/toric formalism.
* `[dd-pLf]`, `[nonsplit]` and `[fouquet]` are quoted, not proved, and each is a substantial paper.
  Theorem D is only as strong as the corrected `[nonsplit, Theorem B]`; see prerequisite 1.
* The Fornea–Gehrmann comparison of §7.3.5 is an *equivalence conditional on* the conjectures of
  Fornea–Guitart–Masdeu, not a proof of any case of Conjecture Pf. Item 125 says so.

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-DISEGNI-22.result.json` reports `ok`,
and `python3 research/blueprint/intake.py check-files` reports no problems on the two deliverables. The
structural checks accompanying this submission — every missing item routed exactly once, every planned
item naming layers that exist in the atlas, every library item citing declarations at the pinned
commits, source routes naming layers owned by the roadmap they name, the Part II titles matching their
parents and the Part II areas being galaxy ids — were run as part of generating the result. They do not
certify the mathematics. No Lean file is authorised or compiled for this job.
