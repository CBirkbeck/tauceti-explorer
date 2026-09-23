# PAPER-BOXER-CALEGARI-GEE-PILLONI-21 — Abelian surfaces over totally real fields are potentially modular

George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Abelian surfaces over totally real fields are
potentially modular*, Publications mathématiques de l'IHÉS **134** (2021), 153–501, doi
[10.1007/s10240-021-00128-2](https://doi.org/10.1007/s10240-021-00128-2). The published version is open
access at [Centre Mersenne](https://pmihes.centre-mersenne.org/articles/10.1007/s10240-021-00128-2/); the
preprint is [arXiv:1812.09269v3](https://arxiv.org/abs/1812.09269v3).

Issue #2164 · Claude Code · session `cc-7b31c4` · 2026-09-23 · **complete**.

158 items (2 library, 16 planned, 140 missing), eight routes taking all 140 missing items exactly once,
three recorded source issues, twenty-two prerequisites. No formalisation is claimed; no Lean file is part of
this job.

## The source read

The paper was read in full in **both** versions. arXiv v3 (28 November 2021) carries the comment "Final
version (fixing minor typos found in copyediting). 292 pages, to appear in Publ. Math. de l'IHES", so it is
the post-copyediting text; and the published version turned out to be open access at Centre Mersenne, so it
was obtained and read as well. Three files were used:

* the arXiv e-print archive of v3, sha256 `7f31218b2cd4416dec4edd1be493af1cb09afcd53aeeb48bf7b2dd1f4b21dabb`,
  whose two files are `abeliansurfacesmodular.tex` (18216 lines) and `abeliansurfacesmodular.bbl`;
* the compiled arXiv PDF of v3, sha256 `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed`;
* the published PDF, `https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf`, sha256
  `b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af`, read 2026-09-23, pp. 153–501.

Both PDFs were read through the text of their content streams rather than through a lossy text layer.

**Numbering and version check.** The class is `amsart`; the theorem-like environments run on the
`subsubsection` counter, so every numbered statement is `section.subsection.subsubsection` and shares that
counter with the subsubsections themselves and with the `\numequation`, `\nummultline` and `\ssinc` macros,
while `atheorem`, `alemma` and their relatives run on the `subsection` counter and `ithm` on an `\Alph`
counter. Re-deriving the numbering from the LaTeX gives **405 numbered statements**, and **every one of the
405 was located at its predicted number in the arXiv PDF and, independently, in the published PDF**. (A
word-level diff of the two PDFs is not informative: they use different fonts and hyphenate differently, so
the extracted word streams disagree almost everywhere for typographical reasons. The statement-by-statement
check, together with targeted checks of the three findings below, is the version comparison that carries
weight.) Note that the main statements are numbered 1.1.1–1.1.7, not by letters.

**Mechanical audits**, after normalising whitespace inside label names: no duplicate `\label`, no undefined
`\ref`, `\Cref` or `\eqref`, no leftover `\need`, `\mar`, `query` environment, FIXME or TODO. Exactly one
cross-reference introduces a Lemma by the word Theorem; it is recorded as E1.

## What the paper does

**Theorem 1.1.3.** Every genus two curve and every abelian surface over a totally real field is potentially
automorphic; **Theorem 1.1.2**, the Hasse–Weil conjecture for such an `X`, follows by Brauer's theorem and
base change. **Theorem 1.1.4**: every genus one curve over a quadratic extension of a totally real field is
potentially modular — new outside the totally real case (Taylor) and the CM case (the ten-author paper).
**Theorem 1.1.5**: there are infinitely many modular abelian surfaces `A/Q` up to twist with `End_C(A) = Z`,
the first infinite family, and for these the `L`-function is *holomorphic* on all of `C`, which potential
automorphy alone does not give.

The obstruction is that weight 2 Hilbert–Siegel modular forms occur only in the **coherent** cohomology of
the Hilbert–Siegel modular variety, in degrees `0` to `[F:Q]`, and in the étale cohomology of nothing:
abelian surfaces are irregular motives of weights `(0,0,1,1)`, so the Taylor–Wiles method does not apply.
The situation is closely analogous to the two-dimensional odd Artin conjecture, and the paper takes the
Calegari–Geraghty route rather than the Buzzard–Taylor one, because the Fourier expansions of Siegel forms
are not determined by the Hecke eigenvalues.

The main modularity lifting theorem is **Theorem 8.4.1**: for `p ≥ 3` splitting completely in the totally
real field `F`, a representation `ρ : G_F → GSp₄(Q̄_p)` with `ν∘ρ = ε⁻¹`, vast and tidy reduction,
`p`-distinguished weight 2 ordinary at every `v|p`, pure at every finite place, and ordinarily modular
reduction, is modular. Four bodies of work go into it.

1. **§3, the Shimura varieties.** The integral models `Y_K` of the PEL variety for `G ⊂ G₁ = Res_{F/Q}GSp₄`
   at the parahoric levels `GSp₄(O_{F_v})`, `Par(v)`, `Si(v)`, `Kli(v)`, `Iw(v)`, their descent to `G₁` by
   the totally positive units, their local models (flat, normal, lci of relative dimension `3[F:Q]`, smooth
   away from codimension two), their toroidal compactifications, and the Hecke action on the coherent
   cohomology of `ω^κ` through cohomological correspondences and the Grothendieck–Cousin complex.
2. **§4, higher Hida theory.** Following Pilloni for `F = Q`: one works over the `p`-rank `≥ 1` stratum,
   which is *not* affine but whose image in the minimal compactification has cohomological dimension one, so
   the ordinary projector cuts out a **perfect complex of amplitude `[0,#I]`** rather than a projective
   module (Theorem 4.6.1). The bookkeeping over the places above `p` is what makes the section long.
3. **§5, doubling.** The sum of the two degeneracy maps embeds two copies of the Klingen ordinary forms into
   the Iwahori ordinary forms (Theorems 5.8.4 and 5.8.6), so the Galois representation is Iwahori ordinary in
   two ways at once, with `α_w` and `β_w` as unramified subspaces, and `ᾱ_w ≠ β̄_w` forces a two-dimensional
   unramified summand. **Every previous incarnation of doubling rested on the `q`-expansion principle; this
   one is geometric**, and rests on the operator `Z_w = U_{Kli(w),1} − U_{Iw(w),1}` along the `w`-non-ordinary
   locus, on Kodaira–Spencer, and on the identification of `U_{w,2}` with the square of the partial Frobenius.
4. **§6, higher Coleman theory.** The classicality theorem in the slope range `U_{v,2} < k_v+l_v−3`,
   `U_{v,1} < l_v−3` (Theorem 6.5.8), and the local constancy of the Euler characteristic in the weight
   (Theorem 6.3.16), which is what shows the complexes are balanced.

**§7** then runs the Calegari–Geraghty patching twice, with `l₀ = 0` and, after isolating one place `v|p`,
with `l₀ = 1`. The trick that makes `l₀ ≤ 1` possible is that `p` splits completely in `F`, so only
two-term complexes occur and local–global compatibility is needed only in degree 0, where doubling supplies
it. The section also builds the GSp₄ analogue of Taylor's Ihara avoidance, through the nilpotent orbits of
GSp₄ and their centralizers — which, unlike for `GL_n`, are not connected (Remark 7.4.11) — and the big
image conditions **vast** and **tidy**. **§8** glues by analytic continuation, étale descent and the linear
relations from doubling. **§9** deduces potential modularity by a `p`–`q` trick and Moret-Bailly. **§10**
shows every `ρ̄ : G_F → GSp₄(F₃)` with inverse cyclotomic similitude character is the 3-torsion of infinitely
many abelian surfaces, by proving a twisted degree six rational cover of the Burkhardt quartic is
unirational — applied to the cover rather than to `A₂(3)` itself, because only the cover admits a
`PSp₄(F₃)`-equivariant birational map to `P³` over `Q`.

§1.4 is unusually informative and is extracted as items: the conditional status of Arthur's multiplicity
formula (§1.4.1), why genus `≥ 3` is out of reach and why Picard curves might not be (§1.4.2), and the
comparison with the ten-author paper (§1.4.4).

## Routing

| Route | Target | Items |
| --- | --- | --- |
| Part II | `HilbertSiegelModularVarieties` — *Hilbert Modular Varieties And Shimura Curves, Part II: Hilbert–Siegel modular varieties for GSp_4 and their coherent cohomology* (`arithmeticgeometry`) | 15 |
| new | `HigherHidaAndColemanTheory` — *Higher Hida and higher Coleman theory for Hilbert–Siegel modular forms* (`automorphic`) | 33 |
| new | `PotentialModularityOfAbelianSurfaces` — *Potential modularity of abelian surfaces and genus two curves* (`langlands`) | 61 |
| Part II | `GSp4LocalLanglandsAndGaloisRepresentations` — *Modularity, automorphy and Langlands endpoint extensions, Part II: GSp_4, its local Langlands correspondence and Galois representations* (`automorphic`) | 19 |
| source | `SchemeAndStackFoundations` — SF.2, SF.5 | 3 |
| source | `ModularityAndLanglandsExtensions` — ML.4 | 2 |
| source | `LocalGaloisDeformationRings` — R08.1, R08.2, L7 | 5 |
| source | `PotentialModularityAndCompatibleSystems` — R23.2, R24.5:operations | 2 |

This follows the maintainer's own worked example for this paper: *"a new roadmap (DESIGN-BCGP18) importing
Siegel and PEL moduli, toroidal compactifications, Galois deformation rings, patching, potential modularity
and Hida and Coleman families from their roadmaps; higher Coleman theory, if missing, proposed as its own
roadmap."*

**The reconnaissance.** The atlas has essentially no GSp₄: searching every layer description in
`data/atlas.json` for `GSp` returns a single hit, in `MetaplecticAutomorphicForms:MP.8`. The searches for
`higher Coleman`, `higher Hida`, `Coleman famil`, `abelian surface`, `genus two`, `paramodular`, `Q-curve`,
`partial Frobenius`, `Grothendieck duality`, `coherent duality` and `dualizing sheaf` return **nothing**.
What the atlas does have, and what is imported rather than re-planned, is substantial:
`AbelianSchemesAndArithmeticModuli` A1–A4, `ShimuraCompactifications` C4–C5, `AutomorphicBundles` B2–B3,
`HodgeTateAndCanonicalSubgroups` T2–T5, `AdicSpacesPartII` R0–R3, `LocallyAnalyticDistributions` L4 and
`PadicFamilies` L2, `GlobalGaloisDeformations` R04.1–R04.5, `LocalGaloisDeformationRings` R08.1–R08.3,
`ArithmeticGaloisDuality` R02.3–R02.6, `DeformationAndDerivedPatchingAlgebra` R03.5/P8/P9,
`GL2AutomorphicRepresentationsAndTransfer` R16.3/R17.4 and `PotentialModularityAndCompatibleSystems`
R23.1/R24.5.

**Why the Shimura varieties are a Part II and not a new roadmap.** `HilbertModularVarietiesAndShimuraCurves`
plans exactly this package for `GL₂` over a totally real field — H1 the polarization modules and
Hilbert–Blumenthal moduli, H2 integral models at arbitrary `p`, H4 finite `p`-level structures, R18.2
compactification and integral models, R18.4 cohomology and Hecke correspondences — and plans nothing for
GSp₄. The Hilbert–Siegel varieties are the same moduli of abelian schemes with real multiplication, now of
relative dimension `2[F:Q]` with a symplectic level structure. Note in particular that
`ShimuraCompactifications` C5 *explicitly* keeps the good-prime assumption on the PEL datum, so the
compactifications at Klingen, Siegel and Iwahori level are new work.

**Why one roadmap for higher Hida *and* higher Coleman theory.** They are two halves of one argument here:
§4 constructs the complexes, §6 proves their `H⁰` is classical and that they are balanced, and §5 is the
geometric input both feed. `PadicFamilies` owns Hida and Coleman families but is the `GL₂` theory over an
affine ordinary locus where the ordinary part is a projective module — the whole point here is that it is
not. `OverconvergentAutomorphicForms:O8` is an invitation to examples beyond Hilbert, but plans no complexes
and no stratification beyond the ordinary locus.

**Why the GSp₄ background is a Part II of `ModularityAndLanglandsExtensions`.** That roadmap owns the
endpoints beyond the rank two infrastructure (ML.0 the endpoint registry, ML.4 the classical-group
classification and trace sources, ML.5 the known functorial transfers); the GSp₄ package — Gan–Takeda, the
Iwahori–Hecke algebra of GSp₄, ordinary `p`-distinguished representations, and the Galois representations of
Theorems 2.7.1–2.7.3 — is a new layer in exactly that direction, and `AutomorphicGaloisRepresentationsPartII`
is the `GL_n` construction which it imports rather than duplicates.

**The four source routes** carry what belongs to existing owners: coherent Grothendieck duality with `f^!`,
fundamental classes and traces, cohomological correspondences, and Kempf's Cousin complex into
`SchemeAndStackFoundations`, which nothing else owns; Arthur's classification for GSp₄ and the record of its
conditional status into ML.4; the GSp₄ local deformation rings away from `p`, including the whole Ihara
avoidance package and the nilpotent orbit analysis, into `LocalGaloisDeformationRings`; and the
Moret-Bailly/restriction-of-scalars constructions of Propositions 9.1.11 and 9.1.12 into
`PotentialModularityAndCompatibleSystems`.

## Library and planned items

**Two items are in the libraries**, both in Tau Ceti and neither in Mathlib: abelian varieties over a field
(`TauCeti.AlgebraicGeometry.AbelianVariety` with about two hundred declarations around it), and the
symplectic group scheme `Sp_{2m}` with its coordinate Hopf algebra, its identification with the symplectic
matrices and the Chevalley commutator relations for its root subgroups
(`TauCeti.Symplectic.groupScheme` and relatives). Neither covers what the paper needs: there are no abelian
*schemes* over a base, no duals and no polarizations, and there is **no similitude group** — a search of the
pinned libraries for `similitude` returns nothing.

**Sixteen items are planned** by existing layers, each with the citation in the `note` field: abelian schemes
and the Weil pairing (A1–A3); Serre–Tate and Grothendieck–Messing deformation theory (A4); automorphic
bundles with their canonical and subcanonical extensions and the integral PEL compactifications (B2, B3, C4,
C5); canonical subgroups and the degree function (T3, T4); the Hodge–Tate map and the modified integral
lattice (T2, T5); adic spaces, formal models and finite traces (R0, R2, R3); Fredholm theory and slope
decompositions (L4, L2); Moret-Bailly's theorem (R23.1); Chebotarev and the mechanism for Taylor–Wiles
primes (R04.5); the patching construction with complexes in several degrees and the balanced-module
criterion (R03.5, P8, P9); global deformation functors and presentations (R04.1–R04.3, G7); Poitou–Tate
duality and Selmer groups (R02.3–R02.6); local deformation rings away from `p` (R08.1–R08.3); solvable base
change for `GL₂` (R17.4); local Langlands for `GL₂` (R16.2, R16.3); and compatible systems with their
operations (R19.3, R24.5, R24.5:operations).

## Source issues

Three findings, all misprints, all affecting nothing, and **all three checked in the published version as
well as in arXiv v3 and present in both**. For a paper of 349 journal pages with 405 numbered statements,
several referees and a copyediting pass, that is what one would expect.

**E1 — a Lemma cited as a Theorem.** The proof of Corollary 7.6.3 (published p. 406) begins "By Proposition
7.2.1 and **Theorem 7.6.1**, the claim holds with `g` instead equal to …", but 7.6.1 is a Lemma. The cause
is visible in the source: the statement is `\begin{lem}\label{thm:TWprimes}`, and the citation is written out
as `Theorem~\ref{...}` rather than with `\Cref`, so the automatic environment name is not used. A mechanical
check of every cross-reference against the environment carrying its target label found this to be the only
such mismatch in the paper.

**E2 — `𝓕^{κ,w}` for `𝓕^{κ,w⁻}` in Corollary 6.4.3.** The sheaf `𝓕^{κ,w⁻} = colim_{w'<w}𝓕^{κ,w'}` is defined
immediately before Proposition 6.4.2, which resolves `ω^κ(−D)` by the `𝓕^{s•κ,w⁻}`; the sentence between the
proposition and the corollary says the Hecke operators act on `𝓕^{κ,w⁻} ⊗ (det ω_𝓖)²(−D)`; and inside the
proof of Corollary 6.4.3 the differentials `θ_{s,s'}` are again written between the `𝓕^{s•κ,w⁻}`. But the
*statement* of Corollary 6.4.3 and the spectral sequence in the first line of its proof both drop the minus.
This is exactly the slip the authors themselves correct in the paper they are citing: the proof of
Proposition 6.4.2 says in parentheses that in Andreatta–Iovita–Pilloni §7.2 "one needs to replace `𝓕^{κ,w}`
with `𝓕^{κ,w⁻}` as defined above". The distinction is visible in both PDFs' content streams.

**E3 — a hypothesis omitted in Remark 5.8.5.** Remark 5.8.5 announces a strengthening of the doubling
theorem and says "In the case `p>3`, we will sketch a proof of this result in §5.9". What §5.9 proves is
Proposition 5.9.1, which assumes `p > 3` **and** `[F:Q] > 1`, and Remark 5.9.2 immediately afterwards says
in as many words "We also have a sketch of an argument for `F = Q`" — so `F = Q` is in exactly the same
position as `p = 3`, and only the latter is named. Nothing depends on it: §5.9 opens by saying the result
"partially strengthens Corollary 5.4.5 **but is not needed in this paper**", and the doubling theorem
actually used, Theorem 5.8.4, is proved for all `p ≥ 3` and all totally real `F` from Corollary 5.4.5 alone.

Nothing else was found. Every numbered statement was read against its proof; the arguments checked in detail
— the weight bookkeeping in Corollary 5.4.5 and Theorem 5.8.4 (where `l_w = 3−p ≤ 0` after twisting by
`ω_w^{1−p}`, so the hypothesis `l_w ≤ 0` is met and the argument works down to `p = 3`), the two regimes of
the identity relating `U_{Kli(w),1}`, `U_{Iw(w),1}` and `Z_w`, and the scope of the restrictions in §5.9 —
are correct as printed.

## Notes for the reviewer and for later blueprint work

* **Order of the four roadmaps.** `GSp4LocalLanglandsAndGaloisRepresentations` and
  `HilbertSiegelModularVarieties` are logically prior; `HigherHidaAndColemanTheory` builds on the second;
  `PotentialModularityOfAbelianSurfaces` builds on all three. If they are planned by different workers, the
  first two should go first, or at least fix the names `GSp₄`, `ν`, `Kli(v)`, `Iw(v)`, `ω^κ`, `T_w`,
  `T_{w,1}`, `U_{w,1}`, `U_{w,2}`, `Z_w`.
* **The whole result is conditional on Arthur.** §1.4.1 says the Gee–Taïbi proof of the multiplicity formula
  for GSp₄ is only as unconditional as Arthur's book and the stabilisation of the twisted trace formula, and
  in particular depends on cases of the twisted weighted fundamental lemma whose proofs had not appeared.
  This is routed as a source of ML.4 precisely so that it cannot be silently discharged.
* **Modular and automorphic are different here.** Potential automorphy is proved for *every* abelian
  surface; potential *modularity* only when the corresponding automorphic representation of GSp₄ is of
  general type. Definitions 9.1.1, 9.1.6 and 9.1.8 keep them apart and Remark 9.1.9 explains why.
* **`G` and `G₁` must never be blurred.** `G` has the moduli interpretation and the integral theory; `G₁` is
  the group the automorphic forms live on. Every statement must say which, and how the descent datum
  (the choice `w = 2`) was made.
* **Klingen ordinary ≠ Iwahori ordinary.** `U_{Kli(w),2} = U_{Iw(w),2}`, but `U_{Kli(w),1}` and
  `U_{Iw(w),1}` differ by `Z_w` up to a power of `p` whose sign depends on whether `l_w ≥ 2` or `l_w ≤ 2`.
  The whole doubling argument is about that difference.
* **Classical `T` and `p`-adic `U` are different operators.** They agree only after the explicit congruence
  of Lemma 4.6.16 and only in a weight range; §4.6 is that comparison and it cannot be assumed.
* **Coherent Grothendieck duality is unowned in the atlas.** The source route to `SchemeAndStackFoundations`
  is the honest place for it, but a restructure may prefer a dedicated layer: `f^!` for lci morphisms,
  fundamental classes, traces for finite flat morphisms and the Grothendieck–Cousin complex will be needed
  by every future consumer of coherent cohomology on a Shimura variety.
* **Two prerequisite papers dominate**: Pilloni's *Higher coherent cohomology and p-adic modular forms of
  singular weights* (Duke 169 (2020)), cited over thirty times and without which §§3–4 cannot be built, and
  Lan's compactification monograph and its ramified-characteristic sequel, without which Theorem 3.5.1
  cannot. A later paper job on each would be the natural way to supply them.
* **The companion papers.** Issue #2166 is the same authors' *Modularity theorems for abelian surfaces*
  (arXiv:2502.20645), which builds on this paper and on the ten-author paper; this extraction should be
  read first, and the two should share the four roadmaps proposed here.

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-BOXER-CALEGARI-GEE-PILLONI-21.result.json`
and `python3 research/blueprint/intake.py check-files` both pass. The routing was validated by a script that
checks every planned layer id against `data/atlas.json`, every source roadmap for origin and stage ownership,
each Part II title against its parent's title, the areas against `data/galaxies.json`, and that every missing
item is taken by exactly one route and every non-missing item by none. The job is complete, so no handoff
note is written; only the two named deliverables change. No Lean deliverable is part of a paper job.
