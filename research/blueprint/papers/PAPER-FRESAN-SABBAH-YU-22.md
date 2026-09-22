# PAPER-FRESAN-SABBAH-YU-22 — Hodge theory of Kloosterman connections

Claude Code — session `cc-7b31c4`; issue #1316; read on 22 September 2026.

Javier Fresán, Claude Sabbah and Jeng-Daw Yu, *Hodge theory of Kloosterman connections*, Duke
Mathematical Journal **171** (2022), no. 8, 1649–1747, doi
[10.1215/00127094-2021-0036](https://doi.org/10.1215/00127094-2021-0036).

Status: **partial checkpoint**. The whole paper has been read at statement level and §§1, 2.1 and 3.1
at proof level; §§4, 5 and the appendix have not been read line by line. Four gaps record exactly what
that leaves open. Nothing is claimed formalised and no Lean file is a deliverable.

**Which version was read.** [arXiv:1810.06454v5](https://arxiv.org/abs/1810.06454v5) of 13 June 2022,
which the authors label "Final version" and which is the published text; its source archive (sha256
`1bc77111…f288d44`) contains `kloosterman-revised10_published.tex`, 3323 lines, and the compiled PDF has
sha256 `835580aa…b1f20a`. **Earlier versions are not usable**: the authors describe v3 as a substantial
revision after referee reports in which the main construction was moved into the setting of exponential
mixed Hodge structures, an appendix was removed, statements were strengthened and "a few mistakes
corrected".

**On numbering.** Every statement environment shares the equation counter and the counter is reset per
section, so statement numbers and displayed-equation numbers interleave and cannot be read off the
source by counting environments alone. The numbering was reconstructed and then **pinned against the
compiled PDF**: for each section the set of printed equation tags `(i.j)` was read off the PDF, its
complement in `1..N` gives the statement slots, and the ordered list of statement environments in the
source was assigned to them. The reconstruction is gap-free in every section and agrees with **every one
of the 43 statement cross-references the PDF prints, with no type mismatch**. There are **58 numbered
statements**: 3 in §1, 9 in §2, 5 in §3, 10 in §4, 14 in §5 and 17 in the appendix.

The paper has been extracted into **65 items**: 1 `library`, 7 `planned` by existing layers, and **57
missing, each routed exactly once** — two new roadmaps and two source routes.

## What the paper proves

Let `p` be a prime, `ψ` a non-trivial additive character of `F_p`, and for `a ∈ F_q^×` let
`Kl₂(a;q) = Σ_x ψ(tr(x + a/x))`, so that by Weil `Kl₂(a;q) = −(α_a + β_a)` with `α_aβ_a = q` and
`|α_a| = √q`. The symmetric power moments are `m₂^k(q) = Σ_a Σ_{i} α_a^i β_a^{k−i}`, and
`Z_k(p;T) = exp(Σ_n m₂^k(p^n)T^n/n)` is a polynomial with integer coefficients; `M_k(p;T)` is what is
left after removing its trivial factors, and `L_k(s)` the Euler product of the `M_k(p;p^{−s})^{−1}` over
the good primes.

**Theorem 1.2** (odd `k`): `L_k(s)` continues meromorphically and `Λ_k(s) = Λ_k(k+2−s)`.
**Theorem 1.3** (even `k`): the same, with a sign `ε_k` and an unknown local factor at 2. These are the
functional equations Broadhurst and Roberts found numerically; before this paper they were known only
for `k ≤ 8`.

**Theorem 1.8**, the result the title points at: the mixed Hodge structure `H¹(G_m, Sym^k Kl₂)` has
weights `≥ k+1` and **all its Hodge numbers are 0 or 1**, with an explicit list; and `H¹_mid` is pure of
weight `k+1` and equals `W_{k+1}`. That every Hodge number is 0 or 1 is exactly the *regularity* of the
Galois representations `r_{k,ℓ}`, which is the hypothesis that makes Patrikis and Taylor's
potential-automorphy theorem applicable — so the Hodge computation *is* the analytic continuation.

The route runs as follows. Over a finite field, `Z_k(p;T)` is the characteristic polynomial of Frobenius
on `H¹_{ét,c}(G_m, Sym^k Kl₂)` and `M_k(p;T)` the same on the middle cohomology, pure of weight `k+1` by
Weil II; the degree is the Swan conductor at infinity, computed by Fu–Wan and Yun, and the bad set `S`
is where it drops. Over a field of characteristic zero the Kloosterman connection
`Kl_{n+1} = π_*E^f` is the irreducible rank-`(n+1)` connection of the hypergeometric operator
`(z∂_z)^{n+1} − z`, regular at `0` with a single unipotent Jordan block and of pure slope `1/(n+1)` at
infinity, and — crucially — the restriction of a Fourier transform of a *regular* holonomic module. A
Thom–Sebastiani argument identifies `H¹_dR(G_m, Sym^k Kl_{n+1})` with an isotypic part of
`H^{kn+1}_dR(G_m^{kn+1}, E^{f_k})`.

A priori those are only **exponential mixed Hodge structures** in the sense of Kontsevich and Soibelman,
because the existence of square roots of `Q(−1)` prevents exponential motives from realising in mixed
Hodge structures. After pulling back along the cover `z = t^{n+1}` and the change of variables
`x = ty`, the function becomes the product `t·g`, and the appendix's criterion (Theorem A.24) shows the
resulting objects are **classical** mixed Hodge structures, with the irregular Hodge filtration equal to
the ordinary Hodge filtration (Proposition A.13). That is Theorem 3.2. The middle one is then identified
with a graded piece of the cohomology of the hypersurface `𝒦 ⊂ G_m^{kn}` cut out by `g^{⊞k}`, with its
`𝔖_k × μ_{n+1}`-action (Theorem 3.8), which makes it the Hodge realisation of a Nori motive `𝑴_k`. For
`n = 1` the Hodge numbers are computed by an explicit basis of the de Rham cohomology together with the
toric interpretation of the irregular Hodge filtration through the Newton polyhedron, after
Adolphson–Sperber and Esnault–Sabbah–Yu. Finally §5 computes the `ℓ`-adic realisations at the bad primes
(tame for odd `k`, unipotent for even `k`), compares the `p`-adic realisation with the rigid cohomology
of the Kloosterman `F`-isocrystal — which gives a Newton-above-Hodge inequality sharpening a theorem of
Haessig — reads the gamma factor off the Hodge numbers, and applies Patrikis–Taylor.

## What the atlas lacks

**Everything on the Hodge side.** Searching `data/atlas.json`: **"hodge module" returns nothing**,
**"exponential motive" returns nothing**, **"kloosterman" returns one unrelated hit** in a
partition-asymptotics layer; the seven hits for "d-module" are all about modules in other senses; the
five for "irregular" are the irregularity of a Fuchsian equation in modular-forms layers and the
`p`-adic radius theory of `PadicDifferentialEquationsAndRigidCohomology:RD.1`, which is the `p`-adic
analogue rather than this one; the hits for "vanishing cycle" are the `ℓ`-adic and topological ones.
Concretely, nothing plans algebraic D-modules and their six operations, the Fourier transform of
D-modules on the affine line, Saito's mixed Hodge modules, exponential mixed Hodge structures, the
irregular Hodge filtration, the Kloosterman sheaf or connection, or the motives of symmetric power
moments.

Among the pending proposals, `HodgeStructuresPartII` (from `PAPER-LANDESMAN-LITT-24`) extends the Tau
Ceti Hodge-structures roadmap in the direction of variations of Hodge structure, period maps and
non-abelian Hodge theory — a different extension, with no mixed Hodge modules;
`LefschetzPencilsAndVanishingCyclesPartIIGeneralBasesFourier` and the perverse-sheaf Part IIs are
`ℓ`-adic.

Seven items are **planned** and need no route: mixed Hodge structures with their weight filtration (the
Tau Ceti Hodge-structures roadmap, L0 and L2); nearby and vanishing cycles
(`LefschetzPencilsAndVanishingCycles:LPV.0`, `LPV.6`, `WeightsInEtaleCohomology:R34.3`); the perverse
intermediate extension and Poincaré duality (`EtaleDualityAndPerverseSheaves:EDC.5`, `EDC.2`); Weil II
(`DeligneWeightsAndPurity:DWP.4`, `WeightsInEtaleCohomology:R34.5`); rigid cohomology with its Frobenius
(`PadicDifferentialEquationsAndRigidCohomology:RD.4`, `RD.6`); de Rham, semistable and crystalline
representations (`PadicHodgeTheory:R06.5`); and weakly compatible systems with their Weil–Deligne
representations (`PotentialAutomorphyInfrastructure:PA.5`). One item is in Mathlib: Dirichlet
characters, the Legendre symbol, `riemannZeta` and `Complex.Gamma`.

## The routes

**Route 1 — `new` roadmap `MixedHodgeModulesAndIrregularHodgeTheory`, area `motives`, 21 items.**
The general machinery: algebraic D-modules with their six operations and the slope theory at an
irregular singularity; the Fourier transform on the affine line and its localised form; Saito's mixed
Hodge modules; the category EMHS of exponential mixed Hodge structures with its own weight filtration
and the comparison with the one of `MHM(A¹)`; the irregular Hodge filtration with the strictness and
factorisation of Proposition A.10; the identification of the two filtrations on classical objects; the
objects `H^r(U,f)`, `H^r_c(U,f)`, `H^r_mid(U,f)` with their weights and the purity criterion; the
localisation sequences; the criterion that a pair of the form `(A¹ × V, tg)` is classical; and the
Hodge-theoretic Fourier transform with the weight computation in terms of the monodromy filtration on
nearby cycles. It is kept apart from the Kloosterman computation because it is general machinery that
other papers in the queue on exponential motives and irregular Hodge theory will need.

**Route 2 — `new` roadmap `KloostermanMomentsAndPotentialAutomorphy`, area `motives`, 31 items.** The
application: Kloosterman sums and their moments; the Kloosterman sheaf and the cohomological
interpretation of `Z_k(p;T)`; the Kloosterman connection with its structure theorem and the
irreducibility of the symmetric powers; the Thom–Sebastiani description and the de Rham cohomology; the
three Hodge-theoretic theorems of §3; the explicit computation of §4 ending at Theorem 1.8; and the
arithmetic of §5 ending at Theorems 1.2 and 1.3. The remaining part of the Broadhurst–Roberts
conjecture, the values `r_k = ⌊k/6⌋` and `ε_k = (−1)^{t_k}`, is recorded as an open boundary rather than
a target, and so is the sequel's relation to Bessel moments.

**Route 3 — `source` of `ModularityAndLanglandsExtensions`, stage ML.2, 2 items.** The Patrikis–Taylor
theorem and its corollary on purity and the functional equation, which §5.7 quotes with their exact
hypotheses and then applies. ML.2 is the potential-automorphy assembly of the campaign; nothing in the
atlas plans these two statements.

**Route 4 — `source` of `PadicDifferentialEquationsAndRigidCohomology`, stages RD.6 and RD.7, 3
items.** The Kloosterman `F`-isocrystal with the rigid cohomology of its symmetric powers, the
comparison of that cohomology with the `p`-adic realisation through `B_st` and `B_crys`, and the
Newton-above-Hodge inequality with its consequence `v_p(c_n) ≥ n(n−1)`.

## Source issues

`sourceIssues` is an **empty list**: no mistake was found in the parts read at proof level — §1, §2.1
including the proofs of Proposition 2.4 and Lemma 2.5, and §3.1 including the proof of Theorem 3.2. The
parts read only at statement level have not been checked for misprints, and the gap `G-SOURCE-ISSUES`
records that a continuation must revisit this once §§4–5 and the appendix are read. The authors
themselves note that v3 corrected "a few mistakes" of the earlier versions; those are not findings about
the published text and are not recorded.

## Prerequisites proposed for a later batch

Fifteen entries are in the JSON; none is in `papers.json`. The three that block the most are **Saito**'s
two papers on pure and mixed Hodge modules, without which nothing in the appendix can be planned;
**Kontsevich–Soibelman** §5 for the category of exponential mixed Hodge structures; and
**Sabbah**'s construction of the irregular Hodge filtration with **Esnault–Sabbah–Yu** for its
degeneration and toric description. Then Adolphson–Sperber for the Newton-polyhedron filtration;
**Deligne**, SGA 4½, for the Kloosterman sheaf; Katz for slopes and Kloosterman monodromy; Fu–Wan and
Yun for the Swan conductors and the earlier construction of the Galois representations; **Patrikis–Taylor**
with Barnet-Lamb–Gee–Geraghty–Taylor for potential automorphy; Huber–Müller-Stach for Nori motives and
their weight filtration; Fresán–Jossen for exponential motives; Malgrange for the Fourier transform of
holonomic D-modules; Haessig for the earlier Newton-polygon bounds; and Broadhurst–Roberts for the
conjectures themselves.

## Checks run

* `python3 scripts/check_paper.py research/blueprint/papers/PAPER-FRESAN-SABBAH-YU-22.result.json` — ok.
* `python3 research/blueprint/intake.py check-files` on the three deliverables — ok.
* The numbering reconstruction described above, validated against all 43 cross-references the PDF
  prints, with zero type mismatches and a gap-free slot list in every section.
* Every `planned` stage id checked against `data/atlas.json`; both source routes checked for stage
  ownership and non-`tauceti` origin; both new roadmap ids checked against the atlas and against every
  other `*.result.json`; each area checked against `data/galaxies.json`; and each missing item checked
  to be taken by exactly one route.
* No Lean file is part of this job and nothing is claimed to be formalised. Status stays `partial`, with
  four named gaps.
