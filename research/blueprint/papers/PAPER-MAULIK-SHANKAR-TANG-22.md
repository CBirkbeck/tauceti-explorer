# PAPER-MAULIK-SHANKAR-TANG-22 — Picard ranks of K3 surfaces over function fields and the Hecke orbit conjecture

Claude Code — session `cc-7b31c4`; issue #1276; read on 22 September 2026.

Davesh Maulik, Ananth N. Shankar and Yunqing Tang, *Picard ranks of K3 surfaces over function fields and
the Hecke orbit conjecture*, Inventiones mathematicae **228** (2022), no. 3, 1075–1143, doi
[10.1007/s00222-022-01097-x](https://doi.org/10.1007/s00222-022-01097-x).

**Which version was read.** The published text is paywalled. The version read in full is the authors'
**accepted manuscript**, the PDF linked from Yunqing Tang's publication page,
[math.berkeley.edu/~ytang/GSpincharp.pdf](https://math.berkeley.edu/~ytang/GSpincharp.pdf), whose file
was created on **25 December 2021** (sha256 `53f4c42762f179fba71a2d344bee56f3de1fb189f4dd9aea968a4fcbfaedc494`,
45 pages) — a few weeks before publication. All eight sections were read. The LaTeX source of
[arXiv:2011.08887v1](https://arxiv.org/abs/2011.08887) (17 November 2020; source archive sha256
`d1aeacc7dbdab10a09d5e9a4fd2fb6d44fc759eabcbe4d1b9fdcaed40cabf3e8`, `main.tex`, 2178 lines) was read
alongside it and used for the symbol-level accuracy of the statements.

**The two versions differ, and it matters.** arXiv has only v1, the submitted version, more than a year
older than the accepted one. The accepted manuscript is about a quarter longer: §3.5, §5, §6 and §7.16
have substantially expanded proofs, §8 is rewritten, and §4 gains footnotes fixing the Tate-twist
convention against Ogus's. Working from v1 alone would mis-state §8 and would record two source issues
that no longer exist.

**On numbering.** All statement environments share one counter per section (`\newtheorem{theorem}{Theorem}`
with `\numberwithin{theorem}{section}`, everything else declared `[theorem]`), so a number determines its
statement. Reconstructing the numbering from the v1 source gives **75 numbered items**, 46 of them named
and 29 of them the unnamed numbered paragraphs of the `para` environment; every named number the
compiled PDF prints was checked, and the only number appearing in the text that is not one of them is a
citation to Ogus's Theorem 3.4. §§1–7 are numbered identically in the two versions. **In §8 the accepted
version inserts two statements**, Proposition 8.9 (existence of a proper curve in the Hecke closure) and
Lemma 8.11 (that it may be taken outside every special divisor), so 8.1–8.8 agree while v1's Lemma 8.9
and Remark 8.10 become Lemma 8.10 and Remark 8.12. **All locators below use the accepted version.**

The paper has been extracted into **96 items**: 3 `library`, 8 `planned` by existing layers, and **85
missing, each routed exactly once**, across three Part IIs that coalesce with proposals already on the
table, one new roadmap, and two source routes. Six misprints are recorded under `sourceIssues`.

## What the paper proves

Fix a quadratic `Z`-lattice `(L,Q)` of signature `(b,2)` with `b ≥ 3`, self-dual at a prime `p ≥ 5`, let
`𝒮` be the canonical integral model over `Z_(p)` of the associated GSpin Shimura variety at hyperspecial
level, and let `C` be an irreducible smooth proper curve with a finite map to `𝒮_{F̄_p}` whose generic
point is ordinary and whose image lies in no special divisor `Z(m)`.

**Theorem 1.2.** Infinitely many `F̄_p`-points of `C` lie in `∪_{p ∤ m} Z(m)`.

**Theorem 1.1**, its consequence through the Kuga–Satake period map: a generically ordinary,
non-isotrivial family of K3 surfaces over a proper curve in characteristic `p ≥ 5`, whose generic Picard
lattice has discriminant prime to `p`, has infinitely many fibres of larger Picard rank. Both hypotheses
are needed: a family of supersingular K3 surfaces has constant rank 22, and `K(E ×_C E_0)` with `E_0`
supersingular jumps at only finitely many points.

**Theorem 1.4.** The prime-to-`p` Hecke orbit of an ordinary point is dense in `𝒮_{F_p}`, in the
orthogonal case and in the unitary case of an imaginary quadratic field split at `p` with an
`O_K`-Hermitian lattice of signature `(n,1)` of discriminant prime to `p`. This is the Chai–Oort
conjecture for these Shimura varieties, and the first result of its kind in the orthogonal case.

**The mechanism** is a comparison of local and global intersection numbers.

*Globally*, Borcherds's modularity theorem, in the arithmetic form of Howard and Madapusi Pera, makes
`−(ω.C) + Σ_m Z(m).C` the `𝔢₀`-component of a vector-valued modular form of weight `1+b/2` for the Weil
representation `ρ_L`, with Eisenstein part `−(ω.C)E₀`. Hence `Z(m).C = |q_L(m)|(ω.C) + O(m^{(b+2)/4})`,
and by Bruinier–Kuss `|q_L(m)| ≍ m^{b/2}` (Lemma 7.5, Theorem 7.4).

*Locally*, `i_P(C.Z(m)) = Σ_{n≥1} #{v ∈ L_n : Q(v) = m}` for the nested lattices `L_n` of special
endomorphisms of the Kuga–Satake scheme mod `t^n`. Off the supersingular locus `rk L_n ≤ b`, and Eskin's
lattice-point bound with the successive minima gives `Σ_{m≤2X} i_P(C.Z(m)) = O(X^{b/2}log X)`
(Proposition 7.11). At a supersingular point `rk L_1 = b+2` and the local contribution has the *same*
order of magnitude as the global one, so the whole difficulty is to show that it is only a fixed
fraction `α′ < 1` of the expected share `g_P(m) = (h_P/(p−1))|q_L(m)|` (Theorem 7.18). Since
`Σ_P g_P(m) = |q_L(m)|(ω.C)`, because the Hasse invariant is a section of `ω^{p−1}`, that contradicts
Lemma 7.5 unless infinitely many points contribute.

*The local engine* (§§4–6) proves that the `L_n` shrink fast. At a supersingular point `P`, Ogus's
classification of supersingular K3 crystals gives `𝓛 = 𝕃^{φ=1} = 𝓛₀ ⊥ 𝓛₁` with `t_P = rk 𝓛₀` the type,
`t_P/2` the Artin invariant, and superspecial meaning `t_P = 2`; the crystals `𝕃₀` over a fixed `𝓛₀` are
classified by a cyclic vector `v`, giving an explicit Frobenius matrix `B₀`. Kisin's description of the
formal neighbourhood then gives `Frob = u ∘ (φ ⊗ σ)` on `𝐋_cris(R)` in coordinates, and the non-ordinary
locus is `y₁ = 0` at a non-superspecial supersingular point and the quadric `Q = 0` at a superspecial
one. A special endomorphism `w` lifts mod `t^s` exactly when its horizontal section `F_∞ w` is integral
over the divided-power envelope `D_s`, by de Jong's theory — Grothendieck–Messing theory is useless here,
because over `k[t]/t^a → k[t]/t^{pa}` the natural divided powers make `pα` deform whatever `α` does. The
decay lemmas (Theorems 5.2, 6.2) follow from the combinatorics of the minimal index tuples together with
the fact that the row `R̄_{n+1}` is `F_p`-anisotropic, which is where Ogus's normal form enters.
Superspecial points need the strictly stronger Theorem 6.2, with its two alternatives, exactly because
the non-ordinary locus is singular there.

*The Hecke orbit conjecture* (§8) is an induction on `b`. If the closure of a Hecke orbit meets a
0-dimensional cusp, Chai's cancellation argument on the invariant ideals of the complete local ring
applies verbatim in Madapusi Pera's integral minimal compactification. If it meets a 1-dimensional cusp,
the fibre of `π` there is, up to a finite quotient, a torsor under `ℰ ⊗ Λ` over a modular curve, and
`ℓ`-power Hecke translates fill it. Otherwise the closure contains a generically ordinary proper curve
outside every special divisor, Theorem 1.2 produces an ordinary point on some `Z(m₀)` with `p ∤ m₀`, that
`Z(m₀)` is the special fibre of a Shimura variety of signature `(b−1,2)` with prime-to-`p` discriminant,
and the inductive hypothesis finishes.

## What the atlas already has, and what is pending elsewhere

Eight items are **planned** by existing layers and need no route: Shimura data and the analytic tower
(`ShimuraData:D2`, `ShimuraVarieties:V1`, `V6`), Baily–Borel algebraicity in characteristic zero
(`ShimuraVarieties:V2`), Dieudonné theory (`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`), crystals
and F-crystals (`CrystallineCohomology:CR.1`, `CR.3`), Serre–Tate and Grothendieck–Messing
(`AbelianSchemesAndArithmeticModuli:A4`, `FiniteFlatGroups:R07.6`), the Weil representation
(`MetaplecticAutomorphicForms:MP.1`, `MP.4`), Dirichlet L-functions (`AnalyticNumberTheory:AN.1`), and
the modular curve with its universal elliptic curve (the Tau Ceti modular-curves roadmap). Three are in
the **pinned libraries**: quadratic forms with Clifford algebras and the spin group (`CliffordAlgebra`,
`spinGroup`, `QuadraticForm`), lattices with their covolume (`ZLattice.covolume`,
`ZSpan.fundamentalDomain`), and Witt vectors of a perfect field (`WittVector`, `WittVector.frobenius`).

Three **pending proposals** already cover part of the set-up, and this extraction coalesces with all
three rather than duplicating them.

* `OrthogonalIntegralModelsAndKugaSatake`, a Part II of *Complex Shimura varieties and canonical models*,
  proposed by `PAPER-CHARLES-16`, `PAPER-SHANKAR-SHANKAR-TANG-ETAL-22` and `PAPER-LI-ZHANG-22`. The
  companion paper of Shankar, Shankar, Tang and Tayou is the number-field analogue of this one, and its
  brief already lists the GSpin integral model, the Kuga–Satake scheme, the realisations, the special
  divisors, the identity `i_P(C.Z(m)) = Σ_n #{v ∈ L_n : Q(v) = m}` (its Lemma 7.2) and the supersingular
  rank statement (its Proposition 7.3).
* `GSpinSpecialDivisorHeights`, a Part II of *Gross–Zagier formulas and arithmetic heights*, proposed by
  the same two papers, which already lists `ρ_L`, `E₀`, the Bruinier–Kuss coefficients and the
  Howard–Madapusi Pera modularity theorem.
* `ShimuraCompactificationsPartIIHodgeTypeIntegralBoundary`, a Part II of *Toroidal compactifications and
  boundary geometry*, proposed by `PAPER-FARB-KISIN-WOLFSON-24` for exactly Madapusi Pera's integral
  compactifications of Hodge-type Shimura varieties, which `ShimuraCompactifications:C5` covers for PEL
  data only.

## What the atlas lacks

Everything characteristic-p in the paper. Searching `data/atlas.json`: **"hecke orbit" returns nothing**,
**"serre-tate" returns nothing**, **"k3 surface" returns nothing**; the 32 hits for "supersingular" are
about elliptic curves, Dieudonné slopes and crystalline descent, none about Ogus's classification of
supersingular K3 crystals or the Artin invariant; "special divisor" returns one unrelated curve-theory
layer. Concretely, nothing plans:

* Ogus's supersingular K3 crystals, the type and the Artin invariant, the normal form of `𝓛₀` and the
  classification of the crystals `𝕃₀` by a cyclic vector;
* Kisin's F-crystal over the formal neighbourhood of a point of an orthogonal Shimura variety in
  coordinates, or the equations of the non-ordinary locus and of the Newton strata there;
* rapid and very rapid decay of special endomorphisms and the decay lemmas, or their consequences for
  the index `|L_1/L_n|`;
* the comparison of local and global intersection numbers on `𝒮_{F_p}`, with `g_P(m)`, the truncation,
  and the theta series of the auxiliary lattices `L′_n`;
* the Chai–Oort conjecture, Chai's cancellation argument at a cusp, or the Hecke geometry of the
  boundary of an orthogonal Shimura variety.

The one pending proposal that mentions Hecke orbits, `HeckeOrbitsAndAndréPinkZannier` from
`PAPER-RICHARD-YAFAEV-25`, is a different subject: generalised Hecke orbits, Galois lower bounds through
integral Tate hypotheses and the André–Pink–Zannier conjecture in characteristic zero, not the Chai–Oort
density conjecture in characteristic `p`. `IgusaVarietiesAndTorsionConcentration:IG.0` plans Newton
strata and central leaves inside the Caraiani–Scholze programme for unitary Shimura varieties, which is
neither the orthogonal deformation theory nor the decay estimates.

## The routes

**Route 1 — `part-ii` of `ShimuraVarieties` → `OrthogonalIntegralModelsAndKugaSatake`, 12 items.** The
standing set-up: the GSpin datum and Kisin's integral model at hyperspecial level, the Kuga–Satake
abelian scheme with the cohomologies `𝐇_?`, the local systems `𝐋_?` with the quadratic form `𝐐`, special
endomorphisms of `𝒜^univ_T` and of `𝒜^univ_T[p^∞]`, the two remarks that make speciality checkable at one
point and crystallinely, positivity of `Q`, the special divisors, the tautological bundle `ω` with the
Hasse invariant as a section of `ω^{p−1}`, the local-count identity, the supersingular rank dichotomy,
and the orthogonal cusp geometry. All of this is what the number-field companion routed here, in the same
words.

**Route 2 — `part-ii` of `GrossZagierAndArithmeticHeights` → `GSpinSpecialDivisorHeights`, 3 items.**
`E₀` with `ρ_L`, the Bruinier–Kuss coefficients with `|q_L(m)| ≍ m^{b/2}`, and the modularity of the
generating series with its consequence `Z(m).C = |q_L(m)|(ω.C) + O(m^{(b+2)/4})`. These are the paper's
only global input and they are the same three objects the sibling extraction already routed here.

**Route 3 — `part-ii` of `ShimuraCompactifications` →
`ShimuraCompactificationsPartIIHodgeTypeIntegralBoundary`, 3 items.** Madapusi Pera's integral minimal
and toroidal compactifications with the extended Hecke action, the complete local ring at a
0-dimensional cusp with the action of `𝔹_ℓ`, and the canonicity of the strata over a 1-dimensional cusp.

**Route 4 — `new` roadmap `SupersingularCrystalsAndOrdinaryHeckeOrbits`, area `arithmeticgeometry`, 62
items.** Everything above that the atlas lacks: the local crystalline theory at a supersingular point,
Kisin's deformation description in coordinates, the decay lemmas with their full combinatorial
apparatus, the intersection-theoretic argument of §7, and the Hecke-orbit argument of §8, ending at
Theorems 1.1, 1.2, 1.4 and 5.15. It is a new roadmap rather than a Part II because its two endpoints
belong to two different existing directions — K3 surfaces over function fields, and the Chai–Oort
conjecture — joined only by the local engine it builds. It is the characteristic-p companion of the lane
that the Shankar–Shankar–Tang–Tayou extraction opened over number fields: the two share their set-up and
their global input, but there the local input is Arakelov-theoretic while here it is Ogus's and Kisin's
deformation theory of crystals.

**Route 5 — `source` of `GeometryOfNumbersAndQuadraticArithmetic`, stages GN.1, GN.3, GN.4, 4 items.**
Successive minima of a positive definite lattice; Eskin's lattice-point bound in terms of them, in the
form whose implied constant depends only on the rank, which is what makes it usable along the infinite
family `{L_n}`; local representation densities with `δ(ℓ,L,m) ≍ 1` for `rk L ≥ 5`; and the Siegel mass
formula for the Eisenstein part of a theta series. The sibling extraction routed the same material to
the same three layers.

**Route 6 — `source` of `AnalyticNumberTheory`, stage AN.1, 1 item.** The Kronecker-symbol characters
`χ_D` and the twisted divisor sums `σ_s(m,χ)` that appear in the coefficient formulae.

## Source issues

Six misprints, all `affects: nothing`, all **present in the accepted version of 25 December 2021** that
was read, and all also in arXiv:2011.08887v1 unless noted. No correction exists: arXiv has only v1, the
authors' own accepted file carries no erratum, Yunqing Tang's publication page lists none, the Springer
page is paywalled and offers no "Correction to this article" link, and a web search returns nothing.

* **E1 (§7, proof of Proposition 7.17, non-superspecial case).** The chain reads
  `… ≤ (h/(p−1))·2(p²−p+1)/(p(p²−1)) ≤ (11/12)(h/(p−1)) for all p ≥ 3`. The middle expression should be
  `2(p²+p−1)/(p(p²−1))`: summing the displayed series
  `(2/(1−p^{−2}))(h(p^{−1}+1)/p² + hp/p⁴ + hp²/p⁶ + ⋯)` gives the bracket
  `h((p+1)/p³ + 1/(p²(p−1))) = h(p²+p−1)/(p³(p−1))`, and multiplying by `2p²/(p²−1)` gives exactly
  `(h/(p−1))·2(p²+p−1)/(p(p²−1))`, which **at p = 3 is 22/24 = 11/12** — that is where the constant comes
  from, and it shows the bound is sharp there. With `h = 1, p = 3` the series is
  `(9/4)(4/27 + 1/18) = 0.4583… = (11/12)·(1/2)`, confirming it. The printed `2(p²−p+1)/(p(p²−1))` is
  `7/12` at `p = 3`, so as printed the first inequality of the chain is **false**, though the final bound
  `11/12`, which is what the proof uses, is correct. The same computation applied to the two superspecial
  cases of the same proof reproduces the printed constants **exactly** — `61/62` at `p = 5` in case (1)
  and `17/20` at `p = 5` in case (2) — which is what makes the method reliable.
* **E2 (§7, proof of Proposition 7.13).** `Σ_{n≥T}(2X)^{(b+2)/2}/n^{(b+2)/b} ≤ (c₃/T^{2/(b+2)})X^{(b+2)/2}`;
  the exponent of `T` is `2/b`, since `(b+2)/b = 1 + 2/b`. Proposition 7.13 itself states `T^{2/b}` and
  the proof of Theorem 7.18 uses it in that form, so only the displayed step is wrong.
* **E3 (§6, Definition 6.1 (3) and Theorem 6.2 (2)).** "the pair `(L,w)`" and "`Span_{Z_p}{L,w}`" should
  be `(Λ,w)` and `Span_{Z_p}{Λ,w}`. `L` is the ambient signature-`(b,2)` lattice of §2.1 and is not a
  submodule of `𝓛`, so `Span_{Z_p}{L,w}` does not parse; the third occurrence of the phrase, in the proof
  of Theorem 6.2, uses the pair notation correctly as `(Span_{Z_p}{e₁,f₁}, e′₁)`.
* **E4 (§7, Theorem 7.15 (2)).** The divisor sum reads `Σ_{d|f} μ(d)χ_𝒟(d)d^{−(b+1)/2}σ_{−b}(f/d)`, but
  the theorem defines only `𝒟′`; `𝒟` is defined in Theorem 7.4, for `L` rather than for `L′₁`. The
  L-value in the same display is `L((b+1)/2, χ_{𝒟′})`, and in the parallel formula of Theorem 7.4 the sum
  uses the same character as the L-value, so it should be `χ_{𝒟′}(d)`.
* **E5 (§3.5, the formal-curve construction).** `v_{i,n_{j₀+1}−1} = e_i + (Σ_{j=0}^{j₀}p^{n_j})f_j ∈ L_{p^{n_{j+1}}}`
  has two slips: the basis vectors were defined as `v_{i,n} = e_i + (a₀+a₁p+⋯+a_n p^n)f_i`, with the same
  index on `e` and `f`, so `f_j` should be `f_i`; and `j` is bound by the sum, so the level should be
  `L_{p^{n_{j₀+1}}}`, which is what the next sentence uses.
* **E6 (§8.1).** "the Bailey–Borel/minimal compactification" — the name is **Baily–Borel**, after Walter
  L. Baily, Jr., and is spelled correctly in §1.5 of the same version. v1 has the misspelling twice; one
  of the two was corrected in the accepted version.

**Two v1 mistakes that the accepted version already fixes** are recorded in `source.readSections` rather
than here, because they are not in the version read: v1's Definition 2.6 calls `𝒵(m)` a Deligne–Mumford
stack over `𝓜`, a symbol it never defines, where the accepted version has `𝒮`; and v1's proof of
Proposition 7.17 divides by `g_P(m)` where the accepted version divides by `|q_L(m)|`, which is what the
displayed computations actually bound — as printed in v1 that chain is off by a factor `h/(p−1)`.

## Prerequisites proposed for a later batch

Eighteen entries are in the JSON; none of the following is in `research/blueprint/papers/papers.json`.
The three that block the most are **Ogus, *Supersingular K3 crystals*** (Astérisque 64, 1979), without
which §4 cannot be planned at all; **Kisin, *Integral models for Shimura varieties of abelian type***
(JAMS 2010), for the integral model and, above all, for the description of the formal neighbourhood and
the horizontal section that §5 is built on; and **Madapusi Pera, *Toroidal compactifications of integral
models of Shimura varieties of Hodge type*** (Ann. ENS 2019), which is the whole of §8's geometry and is
also the reference the pending Farb–Kisin–Wolfson Part II rests on. Then: Ogus's *Singularities of the
height strata* (2001) for the Newton strata and the singularity of the non-ordinary locus at superspecial
points; Madapusi Pera's *Integral canonical models for spin Shimura varieties* (2016) and Howard–Pappas,
*Rapoport–Zink spaces for spinor groups* (2017) for §2 and the rank dichotomy; Howard–Madapusi Pera,
*Arithmetic of Borcherds products*, and Borcherds's 1999 paper for the modularity input;
Bruinier–Kuss (2001) for the Eisenstein coefficients; Chai (1995) for the cancellation argument;
de Jong (1995) for the lifting criterion; Eskin–Katznelson (1995) for the lattice counts; Hanke (2004)
for the local densities; Zemel (2020) and Bruinier–Zemel for the orthogonal cusps;
Maulik–Shankar–Tang, *Reductions of abelian surfaces over global function fields*, which is the `b ≤ 3`
case and the template for the whole argument; Kudla–Rapoport (2014) with BHKRY for the unitary case;
Sarnak (1990) for the trivial bound on cusp-form coefficients; and Oguiso (2003) with Voisin for the
characteristic-zero comparison. Andreatta–Goren–Howard–Madapusi Pera is already queued
(`PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18`), as are Kisin's *Mod p points* and Kisin–Pappas, so those are
not listed again.

## Checks run

* `python3 scripts/check_paper.py research/blueprint/papers/PAPER-MAULIK-SHANKAR-TANG-22.result.json` — ok.
* `python3 research/blueprint/intake.py check-files` on both deliverables — ok.
* Independent reconstruction of the paper's numbering from the LaTeX of v1, checked statement by
  statement against the compiled PDFs of **both** versions; the `para` environment, which shares the
  theorem counter, is the step that is easy to miss.
* Every `planned` stage id checked against `data/atlas.json`; every route checked for stage ownership and
  roadmap origin, for the Part II titles being exactly `<parent title>, Part II: <topic>` and matching
  the titles the existing proposals use, for the new roadmap id not already existing in the atlas or in
  any other `*.result.json`, and for each missing item being taken by exactly one route.
* Each of the six source issues verified in the accepted version, and E1 verified by carrying out the
  summation independently and checking the method against the two superspecial constants, which it
  reproduces exactly.
* Search for an existing erratum: the arXiv listing, the authors' accepted file, Yunqing Tang's
  publication page, the Springer article page and a web search. None exists.
* No Lean file is part of this job, and nothing is claimed to be formalised.
