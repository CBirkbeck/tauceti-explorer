# PAPER-FENG-24 — Smith theory and cyclic base change functoriality

Claude Code — session `cc-7b31c4`; issue #1354; read on 22 September 2026.

Tony Feng, with an appendix by Tony Feng and Gus Lonergan, *Smith theory and cyclic base change
functoriality*, Forum of Mathematics, Pi **12** (2024), published online 15 January 2024, doi
[10.1017/fmp.2023.32](https://doi.org/10.1017/fmp.2023.32).

**Which version was read.** The paper is open access, and the **published full text** was fetched from
Cambridge Core and read in full. The LaTeX source of
[arXiv:2009.14236v6](https://arxiv.org/abs/2009.14236) (29 November 2023, the latest version;
`Smith_base_change.tex`, 3549 lines, source archive sha256 `9b813ef6…`) was read alongside it and used
for the mechanical audits. **The numbering of the two versions agrees statement by statement** —
checked across all eight sections including both appendices, from Proposition 2.1 through Remark 6.27,
Lemma A.3 and Lemma B.5 — so the locators below are valid for both and are given for the published
version. Every source issue was confirmed against the printed text.

**On numbering.** All environments share one counter per section (`\newtheorem{thm}{Theorem}[section]`,
everything else declared `[thm]`), so a number determines its statement uniquely. There are 109 numbered
statements, of which 22 are remarks and 4 examples; no duplicate labels, no undefined references.

After the accepted review, the current extraction has **142 items**: 3 `library`, 11 `planned`, and
**128 missing, each routed exactly once** — 63 Smith, 33 global, 32 local — with six items in the
source route. Codex, session `codex-rtOQ9t`, applied all four independently confirmed red-team findings
for [issue #5518](https://github.com/CBirkbeck/tauceti-explorer/issues/5518) on 2026-10-01.
See [the fixes report](../redteam/RT-PAPER-FENG-24.fixes.md). These fixes await independent fix review.
The four original route memberships, statuses and supplier assignments are retained.

## What the paper states and the qualified construction contracts

Let `k` be an algebraic closure of `F_p`. Throughout, *geometry* is over fields of characteristic `ℓ ≠ p`
while *coefficients* have characteristic `p` — the Smith-theory convention, deliberately at odds with the
usual one in arithmetic geometry. Let `F_v` be a local function field of residue characteristic `ℓ ≠ p`,
`H` connected reductive over `F_v`, `E_v/F_v` cyclic of degree `p`, `G = Res_{E_v/F_v}(H_{E_v})`, and
`φ_BC : ^LH → ^LG` the admissible homomorphism that is the diagonal on dual groups.

* **Theorem 1.1 (= Theorem 6.26).** Every irreducible `k`-representation `π` of `H(F_v)` has a base
  change to `G(F_v)`: an irreducible `Π` with `ρ_Π ≅ φ_BC ∘ ρ_π` for the Genestier–Lafforgue
  semisimplified local Langlands correspondence. This is the first general existence theorem for local
  cyclic base change for **all** reductive groups and **all** irreducible representations, and it uses no
  trace formula — which is in any case unavailable here. Remark 6.27 adds `depth(Π) ≤ depth(π)`.
* **Theorem 1.2 (= Theorem 6.21).** If `p` is an odd good prime for `Ĝ` and `Π` is `σ`-fixed, then every
  irreducible subquotient `π` of `T^0(Π)` or `T^1(Π)` as an `H(F_v)`-representation satisfies
  `φ_BC ∘ ρ_π ≅ ρ_{Π^{(p)}}`. This verifies **Conjecture 6.3 of Treumann–Venkatesh** — "Tate cohomology
  realises functoriality" — for the Genestier–Lafforgue construction. It was previously known only for
  certain depth-zero supercuspidals of `GL_n`, by Ronchetti's direct computation; here it is uniform in
  the group and the representation and involves no model of any representation.
* **Theorem 1.4 (= Corollary 6.15).** There is a **base change homomorphism of mod `p` Bernstein
  centers** `Z_TV : 𝔷(G) → 𝔷(H)`, compatible with `φ_BC` through the Genestier–Lafforgue maps. Haines
  sought such a homomorphism in characteristic zero and it was built in low depth; this is the first
  construction for general groups and arbitrary depth, and the first with a proved relation to the local
  correspondence.
* **Theorem 1.6 (= Theorem 5.13).** Global **strong** base change: if `ρ : Gal(F^s/F) → ^LH(k)` is
  automorphic in the sense of Lafforgue–Xue then so is `φ_BC ∘ ρ`. Strong means the whole `L`-parameter,
  not the unramified Hecke eigensystem; the two notions coincide for `GL_n` but not in general, since
  Lafforgue's correspondence can assign different parameters to automorphic forms generating *isomorphic*
  representations, already for `SL_n` with `n ≥ 3`.

**The method, in three layers.** *(1)* **Sheaf-theoretic Smith theory** (§3), extended from finite type
to **locally finite type** schemes, because moduli of shtukas are not of finite type. The Tate category
is a Verdier quotient `D^b_c(Y;Λ[σ])/Perf`, enlarged to `Shv(Y;T_Λ) = D^b(Y;Λ[σ])/Flat^b` — the
enlargement is forced, since `Rf_!` does not preserve `Perf` outside the finite type world (Remark 3.10).
The Smith operation is `Psm = T^* i^*`, and Proposition 3.12, that `Psm` commutes with `Rf_!`,
specialises to `T^* RΓ_c(Y;F) ≅ RΓ_c(Y^σ; Psm F)` — classical equivariant localisation.
*(2)* **Parity sheaves** (§4). In the Tate category shift-by-2 is the identity (Example 3.4), so
perverse sheaves cannot be seen there; parity sheaves, whose defining condition is a congruence mod 2,
can. Combining Juteau–Mautner–Williamson's parity sheaves with Leslie–Lonergan's Tate-parity sheaves, and
the norm functor `Nm(F) = F ⋆ {}^σF ⋆ ⋯ ⋆ {}^{σ^{p-1}}F`, gives the **base change functor** `BC` on
normalized parity sheaves. **Theorem 4.20**, proved in the appendix with Gus Lonergan by reduction to a
torus through hyperbolic localisation, identifies `BC` with restriction `Res_BC` along the diagonal
`Ĥ → Ĝ` on tilting modules — a **categorification of the normalized Brauer homomorphism** of
Treumann–Venkatesh.
*(3)* **Shtukas and excursion operators** (§5–§6). `Sht_H` is the `σ`-fixed locus of `Sht_G` on
representable truncations **for finite étale covers** (qualified Lemma 5.7); Tate cohomology of shtukas carries an excursion action (Drinfeld's
lemma for Tate cohomology, Proposition 5.6, proved in Appendix B); and Theorem 5.11 converts the
geometric identity `BC = Res_BC` into an identity of excursion operators, with the complementary
vanishing on the norm-element part. The Tate diagonal `Δ^p : A → T^0(A)` and the unique extension of
characters (Lemma 5.15) then pin down the base change parameter under the qualified comparison. Local-global compatibility
imports that comparison to `F_v`; the ramified global input remains a separate proof obligation
for both routes.

## What the atlas already has

* `GlobalShtukasAndFunctionFieldLanglands` **GS.1–GS.5**: global Hecke stacks and classical geometric
  Satake, multi-leg shtuka stacks with bounds, level, partial Frobenius and HN truncations, their
  compactly supported cohomology, Drinfeld's lemma, and excursion operators with the reconstruction of
  continuous semisimple `L`-parameters from characters of the excursion algebra.
* `ExcursionOperatorsAndSpectralAction` **ES0**: the excursion-operator construction from a leg set, an
  invariant function, creation, a Weil tuple and annihilation, with all its relations — the local
  counterpart of GS.5.
* `GeometricSatakeAndFusion` **GS1/GS2/GS4**: semi-infinite geometry, Satake objects and convolution,
  Tannakian reconstruction of the dual group with the Weil action.
* `ReductiveGroupsPartII` **RG2.2/RG2.3/RG2.4/RG2.5**: buildings, parahoric and congruence group schemes,
  the Cartan and Iwahori–Bruhat decompositions, and the integral dual group with the `L`-group.
* `SmoothRepresentationsOfLocalGroups` **SR.0/SR.1/SR.3**: the smooth abelian category over arbitrary
  coefficients with admissibility; Hecke algebras over rings, whose description already says that
  characteristic `p` is to be handled in the smooth action category by integral double-coset operators;
  and the Bernstein center, in the complex case.
* **Libraries.** Mathlib has the Tate complex, `tateCohomology`, the connecting map and the long exact
  sequence; Tau Ceti identifies degree 0 with `M^G/NM`, degree `−1` with `ker N/I_G M` and proves
  2-periodicity for a cyclic group — so `T^0` and `T^1` of a `Λ[σ]`-module are already done. Mathlib also
  has Witt vectors, monoid algebras, and flat = free over an Artinian local ring, which is exactly the
  chain of facts behind Lemma 3.2.

## What the atlas lacks

Searches of `data/atlas.json` for *Smith theory*, *parity sheaf*, *Tate category*, *tilting module*,
*Genestier*, *Bernstein center* and *Moy–Prasad* turn up nothing relevant. Nothing plans the Tate
category or the Smith operation, parity or Tate-parity sheaves, tilting modules for a dual group in
characteristic `p`, Tate cohomology of shtukas or Drinfeld's lemma for it, mod `p` Bernstein centers at
Moy–Prasad level, the Brauer homomorphism, or the Genestier–Lafforgue correspondence. The shtuka roadmap
is explicitly written for **`ℓ`-adic characteristic-zero coefficients**, whereas this paper lives
entirely in characteristic `p`.

## The routes

**1. `SheafTheoreticSmithTheory` — a new roadmap (63 missing items, area `geomlanglands`).** *Sheaf-theoretic
Smith theory, parity sheaves and the base change functor for the Satake category.* This takes §3, §4 and
Appendix A. A new roadmap rather than a Part II because there is no direction to extend:
`GeometricSatakeAndFusion` plans the Satake category but nothing about a second, exotic localisation of
it, and `EtaleDualityAndPerverseSheaves` plans the perverse t-structure, which is precisely what does
*not* survive a quotient in which shift-by-2 is the identity. The material is also not specific to base
change — Smith theory, parity sheaves and Tate-parity sheaves are general tools of modular representation
theory, used by Riche–Williamson for the linkage principle and by Leslie–Lonergan for the Frobenius
contraction functor — so those papers and this one are all sources for it.

**2. `ShtukaTateCohomologyAndGlobalBaseChange` — Part II of `GlobalShtukasAndFunctionFieldLanglands`
(33 missing items, area `functionfields`).** *…, Part II: mod p coefficients, Tate cohomology of shtukas and
cyclic base change.* §5 and Appendix B act on exactly the objects the parent owns, and add new layers in
the same direction: the mod `p` coefficient theory where Xue's extension replaces the Hecke-finite
cuspidal sector; a `Z/pZ`-action on the shtuka tower with `Sht_H` as its fixed locus for finite étale covers; Tate
cohomology of shtukas in place of cohomology; Drinfeld's lemma for Tate cohomology; and the resulting
identity of excursion operators. The excursion-algebra functoriality `φ_BC^*` and the comparison of the
algebraic and geometric `L`-groups go here too.

**3. `ModPBernsteinCentersAndLocalBaseChange` — Part II of `SmoothRepresentationsOfLocalGroups`
(32 missing items, area `langlands`).** *…, Part II: mod p Bernstein centers, the Brauer homomorphism and local
cyclic base change.* §6 is local representation theory with characteristic `p` coefficients: Hecke
algebras at Moy–Prasad level and their centers, the Bernstein center as an inverse limit, the Brauer
homomorphism, `Z_TV`, and the Genestier–Lafforgue correspondence with its local-global compatibility,
ending in Theorems 6.21 and 6.26. It is distinct from every Part II of the same parent already proposed —
types and supercuspidals (`PAPER-FINTZEN-21`), Newton cocenters (`PAPER-HE-18`), parahoric centers
(`PAPER-HE-21`, `PAPER-KISIN-PAPPAS-18`, `PAPER-ZHU-17`), general-linear newforms
(`PAPER-ATOBE-KONDO-YASUDA-22`), unitary spherical representations (`PAPER-CIUBOTARU-HARRIS-26`) — none
of which touches characteristic `p` or base change.

**Overlap with `PAPER-TREUMANN-VENKATESH-16`, stated plainly.** Feng quotes Treumann–Venkatesh for plain
subgroups, the unnormalized Brauer homomorphism `Br`, its compatibility with Tate cohomology, the unique
`σ`-action on a `σ`-fixed representation, linkage, and the conjecture itself (Lemmas 6.5, 6.6, 6.7, 6.12,
6.16, Definition 6.17, Conjecture 6.18). Those items are extracted here because coverage must be
complete, and they are routed into route 3; the same statements are routed by `PAPER-TREUMANN-VENKATESH-16`
into `SmithTheoryAndModPFunctoriality`, a Part II of `ArithmeticLocallySymmetricSpaces`. **The two design
jobs must not both plan them**: whichever runs first owns them and the other imports them. Both briefs say
so.

**4. `GlobalShtukasAndFunctionFieldLanglands` — source for GS.0, GS.1, GS.2, GS.4, GS.5 (six planned items).**
§2 and §5.1 are a careful self-contained account of what those layers plan: the excursion algebra in two
presentations with the comparison between them, Lafforgue's reconstruction of semisimple parameters in
the modular form proved by Böckle–Harris–Khare–Thorne, and the shtuka stacks with legs, level, iterated
shtukas and partial Frobenius. The paper is a good source for them even though it adds nothing new there.

## Source issues

The original extraction recorded seven misprints, all **`affects: nothing`**, and all **confirmed in the published text** (its version checks are historical). The accepted review added E8–E57. This fix adds E58–E60,
so the current JSON has **60 source issues**; the original verdicts remain as provenance.

* **E1 (§6.2.1).** "Let `E_v/F_v` be a finite Galois **assumption**" — should read *extension*.
* **E2 (§6.2.3).** "`Z_F = Z_H(S_H)`" — `S_H` is never defined; the torus just introduced is `S_F`, and
  the parallel clause is `Z_E := Z_G(S_G)`, so it should read `Z_F = Z_H(S_F)`.
* **E3 (proof of Proposition 6.3, case `r = 0`).** "double cosets `U_0 \ G_v / U_0` are represented by
  `z ∈ 𝒵_F`" — should be `U_0 \ H_v / U_0`. The Cartan decomposition being applied is that of `H(F_v)`,
  the representatives lie in `Z_F(F_v) ⊂ H(F_v)`, and the rest of the paragraph concludes
  `U_0 z_1 U_0 = U_0 z_2 U_0` in `H_v`.
* **E4 (proof of Proposition 6.3, case `r > 0`, twice in one sentence).** "`Gal(E_r/F_r)`" — there are no
  fields `E_r`, `F_r`; the group is `Gal(E_v/F_v)`, and the subscript has been copied from `K_r`.
* **E5 (§6.3.3, just after (6.5)).** "It is evident from the definition that `Z(Br)` **through** the
  quotient …" — the verb *factors* is missing.
* **E6 (Definition 5.5).** "**We say will be called** automorphic if …" — the sentence has no subject;
  two phrasings have been conflated. The first paragraph of the same definition fixes the meaning.
* **E7 (Appendix B, §B.3, twice).** "Proposition B.3" — B.3 is a **Lemma**, in print as in the preprint;
  the Proposition in that appendix is B.1. Found by the cross-reference type audit, which reports this as
  the only such mismatch in the paper.

## Prerequisites proposed for a later batch

Genestier–Lafforgue, *Chtoucas restreints…* ([arXiv:1709.00978](https://arxiv.org/abs/1709.00978));
Cong Xue, *Cohomology with integral coefficients of stacks of shtukas* and its companions
([arXiv:2001.05805](https://arxiv.org/abs/2001.05805));
Juteau–Mautner–Williamson, *Parity sheaves* ([arXiv:0906.2994](https://arxiv.org/abs/0906.2994));
Leslie–Lonergan, *Parity sheaves and Smith theory*
([arXiv:1708.08174](https://arxiv.org/abs/1708.08174));
Mautner–Riche, *Exotic tilting sheaves…* ([arXiv:1501.07369](https://arxiv.org/abs/1501.07369));
Treumann, *Smith theory and geometric Hecke algebras*
([arXiv:1107.3798](https://arxiv.org/abs/1107.3798));
Riche–Williamson, *Smith–Treumann theory and the linkage principle*
([arXiv:2003.08522](https://arxiv.org/abs/2003.08522));
Dat–Helm–Kurinczuk–Moss, *Finiteness for Hecke algebras of p-adic groups*
([arXiv:2203.04929](https://arxiv.org/abs/2203.04929));
Kaletha–Prasad, *Bruhat–Tits theory: a new approach* (CUP, 2023).
V. Lafforgue and Böckle–Harris–Khare–Thorne are already queued (`PAPER-LAFFORGUE-18`,
`PAPER-BOCKLE-HARRIS-KHARE-ETAL-19`) and Zhu's mixed-characteristic geometric Satake is already extracted
(`PAPER-ZHU-17`), so none of those is listed again.

## Checks run

* `python3 scripts/check_paper.py research/blueprint/papers/PAPER-FENG-24.result.json` — ok.
* `python3 research/blueprint/intake.py check-files` on both deliverables — ok.
* Source audits on the LaTeX: duplicate `\label` (none), undefined `\ref` (none), and a cross-reference
  **type** audit comparing the word before each `\ref` with the environment carrying that label (found
  E7).
* A statement-by-statement comparison of the published numbering with the preprint numbering across all
  eight sections, and confirmation of each source issue against the published text.
* No Lean file is part of this job.

## Review (REV-PAPER-FENG-24, 28 September 2026)

The review, by Claude Code (session cc-39fac3), accepted the extraction and its four routes after corrections made in place. The full record is `research/blueprint/reviews/REV-PAPER-FENG-24.md`.

- **Statements and locators:** 55 statements corrected, mostly to add omitted standing hypotheses, and 15 locators.
- **Statuses:** 15 changes.
  - Seven planned items move to route 2, because the cited layers are written for characteristic-zero coefficients: the geometric L-group, both presentations of the excursion algebra, the modular reconstruction theorem, homomorphisms of L-groups, the k-coefficient Satake functor on shtukas and Lemma B.5.
  - Items 96 and 107 are missing, to route 1.
  - Item 93 is planned by SmoothRepresentationsOfLocalGroups:SR.6.
  - The Tate diagonal and the Frobenius twist of algebras move to route 1.
- **New items:** 35 (31 missing, 3 planned, 1 library). Every brief, and the source route's reason, has a corrections paragraph.
- **Ownership:** route 3 imports the Brauer homomorphism, plain subgroups, linkage and the Treumann–Venkatesh conjecture from SmithTheoryAndModPFunctoriality.
- **Source issues:** E1–E7 are confirmed. E8–E57 are new. Beyond 33 misprints, the new issues are:
  - Theorem 1.1 needs p odd and good.
  - Lemma 2.7 is false for general φ, and the main theorems need φ_BC∘ρ semisimple (true, but not proved in the paper).
  - Lemma 3.8 needs bounded dimension.
  - Lemmas 4.16 and 4.24 are false as printed.
  - Theorem 4.20 is proved objectwise, but not as a natural isomorphism over Ĥ.
  - The proof of Theorem 5.13 misses the α-components.
  - Proposition 6.3 and Corollary 6.4 are false at r = 0, and the Galois-fixed special vertex need not exist. Both are repaired at r > 0 at any point of B(H/F_v).
  - Theorem 6.26 at r = 0 is unproved.

## Corrected contracts from the confirmed red-team findings

**Ramified descent (finding 1; E58).** Item /60 is now a finite-étale-cover
statement. For a finite étale $C_p$-torsor, the relation
$X'\times_X X'=C_p\times X'$ makes the unique equivariance cocycle an actual
fppf descent datum. Effective descent supplies the torsors, Frobenius,
modifications and level; the separately routed HN comparison supplies the
truncation. Items /62–/64 use this same hypothesis. Smith localization itself
still uses the whole fixed scheme; it does not replace that scheme by a
smaller descended locus for a ramified cover.

The counterexample is $t=u^3$ over $\mathbf F_7$, with $\sigma(u)=2u$ and the
trivial line bundle framed by $u$ modulo $(u^3-1)^n$ at $t=1$. It is fixed
via multiplication by $4$, has no framed automorphisms, but has nontrivial
inertia at $u=0$ and is not descended, for **every** $n\ge1$. Deep auxiliary
level therefore does not repair the asserted identification. E41's active
component repair is now conditional: its $\beta=\phi_*(\alpha)$-sector must
have a valid, excursion-compatible fixed-locus/summand comparison.

The unrestricted global and local main theorems remain **published targets**,
with explicit ramified proof obligations in their existing routes; this
counterexample does not disprove them. Route 2 must build the ramified
descent/localization comparison and its naturality. Any branch-level repair
must specify sufficient level at every branch place and prove descent,
change-of-level compatibility and the claimed level control. No sufficient
branch-level theorem is asserted here. Route 3 imports that repair.
Items /85–/87,/91,/94,/95 state working comparisons conditional on a
compatible finite étale globalization and faithful local-global input;
such a cover has unramified completion at $v$, so it supplies no ramified
local result. Their unrestricted formulas are retained in `sourceTarget`.
The positive-depth double-coset repair alone does not complete these proofs.

**Excursion actions (findings 2–3; E59–E60).** Item /56 uses a central
$k$-algebra $A$, additive $k$-linear geometric functors
$F_I:\operatorname{Rep}_k(\widehat G^I)\to\operatorname{Mod}_A$, natural
coherent fusion, unit normalization and explicit transport in unused legs.
For a full-L-group representation $W$, put $V=W|_{\widehat G^I}$.
Its descent maps $r_\gamma:T_\gamma V\to V$ combine with geometric transport
$a_\gamma$ to give $D^W_\gamma=F_I(r_\gamma)a_\gamma$.
Creation and annihilation are evaluated on the geometric functors before
requiring arithmetic equivariance. All six relations, with their actual
hypotheses, are proved in the fixes report and passed to route 2's design
contract, including the ordinary-cohomology and Tate instances.

Item /13 still permits only diagonal-$\widehat G$ invariance for $x,\xi$.
For $p=3$ and a quadratic $\Gamma$-character $\chi$, $W=k(\chi)$ with trivial
dual-group action allows $x=\xi=1$, although neither is an L-group morphism.
The corrected construction gives $S=\chi(\gamma)\operatorname{id}$ by
inflation. The constant ordinary functor sending every arrow to the identity
is excluded by linearity: creation by zero must give zero. E35's index repair
remains separate from these two defects.

**Finite tor-amplitude (finding 4).** Review-added /rev-6 now distinguishes
$Rf_!$ from $Rj_*$. For the stated torsion coefficients, fibre-dimension
bound $d$ and projection-formula hypotheses, compact-support pushforward
has the bound $[a,b+2d]$. Open direct image retains finite-amplitude
preservation, with an ambient cohomological-dimension bound. It has no bound
by twice the open immersion's relative dimension. The adic $W(k)$ passage
requires a compatible torsion system with a uniform bound and its limit
justification. The missing group-ring preservation result keeps its Smith
owner and imports the six-operations foundation.

For $j:\mathbf G_m\hookrightarrow\mathbf A^1$ over $\overline{\mathbf F}_7$
and $A=\overline{\mathbf F}_3[C_3]$, the constant free $A$-sheaf has amplitude
$[0,0]$, yet $(R^1j_*A)_0\ne0$: the punctured-trait cover $z^3=t$ is a
nontrivial Kummer torsor. Relative dimension is zero. The false numerical
bound belongs to the extraction review's /rev-6, not to Feng or Stacks.

## Fix reading and validation

On 2026-10-01 downloaded the actual 66-page Cambridge published PDF and reread
pp.10–13,15–17,32–45,50–56, checking page images 33 and 37. This is a bounded
fix reading; the earlier red-team report records the complete article reading.
The new PDF hash is
`0e6d8a7577bd20408f2c9b0d42f8f1f96e089701ee581373293a4714011ea666`;
Cambridge embeds a per-download timestamp, so this copy differs in hash from
the earlier red-team download. The JSON records the actual source version.
Correction/version checks and their limits are recorded in the fixes report.

The paper checker, intake path/JSON checks, source-issue/version checks,
structural-preservation checks, exact counterexample/component calculations
and `git diff --check` passed. No Lean artifact is required or compiled.
The unrestricted ramified theorems are source targets with explicit routed
proof obligations, not newly established results.
