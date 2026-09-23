# PAPER-XU-ZHU-22: Bessel F-isocrystals for reductive groups

Daxin Xu and Xinwen Zhu, *Bessel F-isocrystals for reductive groups*, [Inventiones mathematicae 227 (2022), 997–1092](https://doi.org/10.1007/s00222-021-01079-5); arXiv [1910.13391](https://arxiv.org/abs/1910.13391).

Extraction by Claude Code, session `cc-39fac3`, 22 September 2026 (issue #1284). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-XU-ZHU-22.result.json](PAPER-XU-ZHU-22.result.json). It has:
- 69 items: 3 planned, 66 missing;
- 5 routes: 1 source route (four RD stages), 1 new Part II, 1 new roadmap, and 2 routes that coalesce with pending candidates;
- 21 prerequisite entries;
- 30 recorded source issues.

## Sources read

- **arXiv v2** (19 December 2019, the last version), read in full from its TeX source and PDF. Numbers and pages below are those of the arXiv PDF (71 pages).
- **The journal version is not open access.** Crossref lists only Springer's text-and-data-mining licence, the Springer PDF link redirects to the paywalled article page, and the Caltech Authors record holds only the arXiv preprint. The published text may differ from v2; `searched` in every source issue says so.
- **Errata:** Crossref records no correction or update, and a Crossref search for a correction found none.
- Background agents read §2 and §3 line by line. I checked every finding recorded from them against the TeX, and dropped those I could not confirm (for example a claim about the simple connectivity of Gr_μ in characteristic p).

## What the paper proves

**Main theorem (Theorem 4.4.4, Theorem 1.2.4(i)).** Let Ǧ be split reductive, K = Q_p(μ_p), λ = −π with π^{p−1} = −p, and Be_Ǧ = d + (N + λ^h xE)dx/x the Frenkel–Gross connection on G_m. There is a unique φ ∈ Ǧ(A^†) with x φ′φ^{−1} + Ad_φ(N + λ^h xE) = q(N + λ^h x^q E) whose traces at closed points are those of the ℓ-adic Kloosterman sheaf Kl_Ǧ of Heinloth–Ngô–Yun. So Be^†_Ǧ is a Ǧ-valued overconvergent F-isocrystal, the p-adic companion of Kl_Ǧ, generalising Dwork's Be_n^† (Theorem 1.1.4).

**The method.**
- **§2.** Complements to the six operations for holonomic arithmetic D-modules (Berthelot, Caro, Abe, Abe–Caro):
  - specialisation between de Rham and rigid cohomology (Proposition 2.2.5);
  - top-degree cohomology and a p-adic BBD 4.2.5 (Corollary 2.4.3, Proposition 2.4.4);
  - equivariant modules on schemes and ind-schemes (§2.5);
  - weights (§2.6) and nearby cycles (§2.7);
  - universal local acyclicity (§2.8);
  - local monodromy (§2.9);
  - Braden's hyperbolic localisation (§2.10).
- **§3.** Geometric Satake for arithmetic D-modules: Sat_G is semisimple, fusion makes it symmetric monoidal, H^* is a fibre functor, and the Tannakian group is Ǧ (Theorems 3.5.1, 3.5.3). With Frobenius structures, F-Sat_G ≅ Rep°_{L,σ}(Ǧ(L) ⋊ Z) (Theorem 3.6.7), and a Weil-normalised Sat : Rep(Ǧ) ≅ S.
- **§4.1.** Heinloth–Ngô–Yun's construction run with arithmetic D-modules gives Kl^rig_Ǧ (Theorem 4.1.5). Its de Rham analogue is Kl^dR_Ǧ.
- **§4.2.** (Kl^dR)^† ≅ Kl^rig, by comparing twisted de Rham and rigid cohomology on minuscule and quasi-minuscule Schubert cells (Theorem 4.2.1).
- **§4.3.** Kl^dR_Ǧ(λφ) ≅ Be_Ǧ(ξ̌) for matching parameters, by quantising a classical duality through opers (Theorem 4.3.3, strengthening Zhu 2017).
- **§4.4.** The Frobenius structure, its uniqueness, and φ_0 = 2ρ(√q) (Proposition 4.4.5).

**Applications.**
- Monodromy groups of Be^†_Ǧ (Theorem 4.5.2). G_geo = G_alg except for A_{2n} at p = 2, where G_geo is SO_{2n+1} (or G_2 for n = 3). G_geo = G_arith always. Via companions (Corollary 4.5.6), this reproves Katz and Heinloth–Ngô–Yun without restrictions on p.
- Local monodromy at ∞ is a simple wild parameter in the sense of Gross–Reeder (Corollary 4.5.7).
- Heinloth–Ngô–Yun's functoriality conjecture 7.3 (Theorem 5.1.4), and the push-out SO_{2n+1} → SL_{2n+1} at p = 2 (Corollary 5.3.10).
- Classical groups via Katz's and Miyatani's hypergeometric objects and the Lam–Templier Landau–Ginzburg model (§5.3), with identities between exponential sums (Corollary 5.3.11, §1.2.9).
- Frobenius slopes are ordinary everywhere for classical groups and G_2, and generically otherwise (Theorem 5.4.2).
- A 2-adic proof of Carlitz's identity Kl(3; a) = Kl(2; a)² − 1 and its generalisation Be^†_{2n+1} ≅ Be^†_{SO_{2n+1},Std} (Appendix A). It uses a 2-adic refinement of Dwork's congruences and Tsuzuki's minimal-slope theorem.

## What the atlas already has

**Planned (3 items).**
- Frames, overconvergent (F-)isocrystals and rigid cohomology (§2.1): PadicDifferentialEquationsAndRigidCohomology RD.3–RD.4.
- The affine Grassmannian, Schubert varieties, convolution and Beilinson–Drinfeld Grassmannians (§§3.1–3.2): GlobalShtukasAndFunctionFieldLanglands GS.1, which plans classical geometric Satake.
- Mirković–Vilonen's semi-infinite orbits (Proposition 3.4.2, with its statement corrected): also GS.1.

**Library.** Gauss sums are in Mathlib (`gaussSum`), but the items that use them are about sheaves built from them, which are missing.

**Nothing else.** The atlas has no arithmetic D-modules, no Kloosterman sheaves for reductive groups, no Frenkel–Gross connection and no opers.
- "holonomic" occurs nowhere.
- "nearby cycle" occurs only in ℓ-adic layers.
- "Kloosterman" occurs only in a partition-asymptotics layer.
- "Heinloth", "Frenkel–Gross" and "oper" occur nowhere.

## Routes

1. **Source: PadicDifferentialEquationsAndRigidCohomology RD.1, RD.2, RD.4, RD.6 (4 items).** These are p-adic foundations the paper recalls with extra precision:
   - Katz's slope filtration of convergent F-isocrystals (RD.1). PAPER-TSUZUKI-23 routed the same statement to these stages.
   - André's Tannakian description of MC and MCF, and irregularity = Swan (RD.2).
   - Specialisation and cospecialisation between algebraic de Rham and rigid cohomology, with the new Proposition 2.2.5 (RD.4).
   - The Dwork and Kummer F-isocrystals with their sign conventions fixed (RD.6, whose acceptance test already uses an additive-character coefficient).

2. **New Part II: PadicDifferentialEquationsPartIIArithmeticDModules (18 items).** "P-adic differential equations, rigid cohomology and p-adic weights, Part II: arithmetic D-modules, the six operations and geometric Satake" (area `padic`).
   - It extends the parent from overconvergent F-isocrystals to the full six-operation formalism: Berthelot's D^†, Caro–Tsuzuki overholonomicity, Abe's D^b_hol, weights, nearby cycles, ULA and Braden's theorem.
   - It ends with the geometric Satake equivalence for arithmetic D-modules, the p-adic coefficient branch of GS.1's classical Satake. It imports the affine-Grassmannian geometry from GS.1 rather than planning it again.
   - Its brief asks for fixes where the paper's arguments fail: hyperbolic localisation without normality, the degree-0 base change behind Proposition 2.4.4, and the corrected descent lemma.
   - It records that the queued PAPER-ABE-18 is the main source for its middle stages. It also records that the two pending Part IIs of the same parent (rigid companions from PAPER-ESNAULT-GROECHENIG-20, minimal slopes from PAPER-TSUZUKI-23) should import the D-module formalism from it.

3. **New roadmap: KloostermanSheavesAndBesselIsocrystals (40 items).** "Kloosterman sheaves and Bessel F-isocrystals for reductive groups" (area `geomlanglands`). This carries the paper's own mathematics:
   - Heinloth–Ngô–Yun's automorphic data in three sheaf theories;
   - the Frenkel–Gross connection and Zhu's comparison;
   - the de Rham–rigid comparison and the Frobenius structure;
   - monodromy groups, local monodromy and functoriality;
   - the classical-group computations, with corrected identities;
   - slopes, via V. Lafforgue's bound, Adolphson–Sperber and Wan;
   - the 2-adic appendix.

   It is a new roadmap because no existing direction has these endpoints. It imports Kl_n and Katz's monodromy from route 4 and the D-module machinery from route 2.

4. **Coalesced: KloostermanMomentsAndPotentialAutomorphy (3 items).** This keeps the id, title and area of the candidate proposed by PAPER-FRESAN-SABBAH-YU-22, whose brief already plans the following, which these items join:
   - Deligne's Kloosterman sheaf;
   - the Kloosterman connection;
   - Katz's monodromy groups.

   The brief adds the general-n normalisations Xu–Zhu use.

5. **Coalesced: PadicDifferentialEquationsPartIIMinimalSlope (1 item).** Tsuzuki's theorem (Theorem A.3) is the curve target of the candidate proposed by PAPER-TSUZUKI-23, so the route keeps that candidate's id, title and area.

## Source issues (`sourceIssues` E1–E30)

**Exponential sums, all confirmed by exhaustive summation over small F_q (errors in stated results).**
- **E1.** The p = 2 line of (1.2.9.1) has a spurious factor −1/√q. S_2(a)² − q = S_3(a) holds exactly for q = 2, 4, 8, 16, 32 and every a. That is Carlitz's identity, which the appendix itself states.
- **E2.** The right side of (1.2.9.2) should be T − q, not −(1/√q)(T − q^{n−1}). The printed version is what E3 and E4 give together.
- **E3.** The convolution formula (5.3.9.1) and (5.3.11.1) miss a half Tate twist, that is a factor −1/√q on traces. The ratio is exactly −1/√q at q = 3, 5, 7, against H̃_ψ(5; ρ)(4a), and at q = 4, 8, against Kl(5; a).
- **E4.** In Proposition 5.3.5(ii) the constant should be q^{n−1} − q, not (q − 1)q^{n−2}. They differ for n ≥ 4.
  - The case division in the proof misses the points with p_n ≠ 0 and some later p_{n+j} = 0, which contribute q^{n−2} − q.
  - I checked this against the Landau–Ginzburg sum for n = 4 (q = 3, 5) and n = 5 (q = 3), including the contribution of each stratum.

**Geometry and sheaf theory.**
- **E12 (error).** Proposition 3.4.2 gives dimension ρ(λ + μ) for T_λ ∩ Gr_μ. Mirković–Vilonen give ρ(μ − λ). With the printed value, S_μ ∩ Gr_μ and T_μ ∩ Gr_μ would both be dense in Gr_μ.
- **E13 (error).** "Equivalently there exists w with wλ ≤ μ" should read "for all w". Counterexample: SL_2 with μ = 0 and λ = −α^∨.
- **E14 (gap, the proof).** Braden's theorem is stated for normal X (2.10.1). §3.4.5 asserts that Gr_{≤μ} and the global Schubert varieties are normal for every p. When p divides |π_1(G_der)|, most Schubert varieties are not normal (Haines–Lourenço–Richarz).
- **E15 (error).** Corollary 2.4.3 and 2.4.1(iii) are false as stated. Counterexamples: A¹ ⊔ pt, and Spec F_{q²} over F_q. So the Frobenius eigenvalue in Proposition 3.4.3(ii) needs the MV cycles to be defined over k, which the paper does not address.
- **E22 (error).** With ∇ = d + π dt, θ_π is not horizontal: the Dwork isocrystal's Frobenius is θ_π^{−1}, with trace ψ^{−1}.
  - The introduction's E_λ = (O, d − λ dx) and §4.1.13's E_λ = K⟨x, ∂⟩/(∂ − λ) have opposite signs.
  - The consistent choice, that of §4.1.13 with ∇ = d − π dt, makes E^†_{−π} = A_ψ, as Theorem 4.2.1 needs, and matches Dwork's theorem.
- **E23 (misprint).** The Kummer isocrystal needs the lift x ↦ x^q and Frobenius x^{−(q−1)a}.
- **E24 (error).** Lemma 2.5.3 fails without connected H_1. Counterexample: μ_n ⊂ G_m acting on G_m through t ↦ t^n, with the Kummer module K_{1/n}. The paper's uses are unaffected.
- **E25 (gap, the proof).** The proof of Proposition 2.4.4 reduces to a point by "smooth base change", which is not available. Example: A² ∖ 0 → A¹.
- **E26 (error).** The isomorphism claimed in the construction of ι_F (2.10.3) fails for P¹. Only a morphism exists.
- **E30 (error).** Sol(M) ≅ Coker(N)^∨, not Coker(N). Only its dimension is used.

**Misprints (E5–E11, E16–E21, E27–E29).**
- The first bullet of Theorem 4.5.2(i) puts A_2 in two bullets with different answers.
- The exponents in Lemma 4.5.5 should be {ℓ_i}, not {ℓ_i + 1}.
- The eigenvalue list {α, …, q^{2n}α} in §5.2.3 should end at q^{n−1}α.
- In §5.1 (Proposition 5.1.3(ii) and the proof of Theorem 5.1.4), φ and φ′ are swapped.
- The index slips in the proof of Theorem A.5(i′).
- The sign of the trace in the proof of Lemma 5.4.3.
- In §3:
  - an index shift of 2 in §3.4.6;
  - the parity map in §3.4.7;
  - ∏ where ⊔ is meant in §3.4.5;
  - the placement of the shift in IC^Weil_μ;
  - the Tate twist dropped in Proposition 3.2.5(ii);
  - two index slips.
- In §2:
  - "U dense" is missing from Corollary 2.6.2(ii);
  - [n] should be [−n] in Theorem 2.6.4(ii);
  - the twist in the proof of Proposition 2.8.3(i);
  - the direction of a canonical map in Theorem 2.10.2(ii).

I checked everything else I could: the exceptional isomorphisms, the Katz monodromy table, the local monodromy count, the appendix congruences, the SO_{2n+1} differential equation and its solution, the p > 2 line of (1.2.9.1), and the A_4 decompositions. All of these hold.

## Prerequisites not yet covered

Twenty-one papers, with DOIs checked on Crossref:
- Heinloth–Ngô–Yun; Frenkel–Gross; Zhu 2017;
- Abe's JAMS paper (queued as PAPER-ABE-18); Abe–Caro on weights; Caro–Tsuzuki; Berthelot's D-modules arithmétiques I; Abe on nearby cycles;
- Braden; Miyatani;
- Dwork 1974 and 1969; Adolphson–Sperber; Wan 2004;
- V. Lafforgue 2011; D'Addezio 2020; Gross–Reeder; Lam–Templier;
- Katz's three works (Gauss sums…, Exponential sums…, From Clausen to Carlitz).

Each entry says what the paper takes from it.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-XU-ZHU-22.result.json` reports no errors.
- The numerical checks are in the scratch directory: exhaustive sums over F_q in Python, and exact rational arithmetic for the 2-adic congruences.

## Independent review (cc-fb70e5, 23 September 2026)

**Accept.** All five routes accepted, coverage effectively complete, **all thirty findings confirmed
verbatim**, nothing corrected in place and nothing added. The full review is in
[`reviews/REV-PAPER-XU-ZHU-22.md`](../reviews/REV-PAPER-XU-ZHU-22.md).

Both recorded hashes match byte for byte. A practical note: this e-print is a **bare gzipped single file**,
not a tar archive — `tar xzf` fails, `gunzip -c` gives `Bessel_arXiv2.tex` (4727 lines).

Nothing about this paper's numbering can be checked until two devices are handled. `secnumber` is an
**empty-titled theorem environment sharing the theorem counter** — that is how the paper prints its 114
numbered paragraphs in the same sequence as its 79 statements, which is why "§2.1.5(i)" and "Theorem 2.10.2"
are comparable locators. And `\numberwithin{equation}{theorem}` makes equation numbers four-level, hence
(1.2.9.1) and (5.3.5.2). Simulating both gives 420 numbered objects = 193 theorem-counter objects + 227
equations, and reproduces the number *and* kind of every statement the findings cite, paragraph-versus-
statement included, plus all eleven four-level equation numbers.

Coverage: **all 69 items carry a statement- or paragraph-level locator**, 76 of 79 statements are cited
(exceptions: Remarks 1.2.5 and 2.8.4, Proposition 3.6.4), and 85 of 114 numbered paragraphs. Counting trap
for later readers: the appendix numbers two-level (A.1, A.3, A.5…), so a three-component locator regex drops
all seven appendix statements. The reference audit is clean once the paper's idiom is found — it writes bare
`\ref` or a *lowercase* word, so a capitalised-word regex sees 2 citations where there are 80: no
word/environment mismatch, none resolving to a numbered paragraph (checked, since `secnumber` invites it),
no duplicate labels, no undefined references.

The routes are the strongest part. Two Kloosterman routes in one extraction looks like a roadmap
duplicating the one it imports from, and it is not: FSY's `KloostermanMomentsAndPotentialAutomorphy` plans
**GL₂** Kloosterman sheaves and symmetric-power moments, while this paper's new
`KloostermanSheavesAndBesselIsocrystals` is about **group-valued** sheaves — and the extraction routes
exactly the three classical statements (Kloosterman sums, Deligne's sheaf, Katz's monodromy groups) to FSY's
id "rather than planning them twice". Reviewing PAPER-FRESAN-SABBAH-YU-22 the same day (issue #1317) showed
the other side: FSY is the originator and its own reason names this adoption. **Both sides describe the
split identically.** The one-item Minimal Slope route is the same discipline applied to Tsuzuki-23's proposal.

All thirty findings are confirmed. **E14** is the most consequential: the paper's Braden setup requires its
scheme to be normal (line 1743), and §3.4 then asserts normality of `Gr_{G,≤μ}` unconditionally for every
split reductive G over any finite field — but that, and reducedness of the special fibre, are theorems
needing p ∤ |π₁(G_der)| (Faltings, Pappas–Rapoport, Zhu), failing for instance for PGL₂ in characteristic 2.
**E4** is settled by arithmetic: the printed `(q−1)q^{n−2}` equals the correct `q^{n−1}−q` exactly when
n = 3, so it is right only in the statement's first case. As printed, type **A₂ satisfies both bullets** of
Theorem 4.5.2(i) (E5); one dimension formula is given for both `S_λ` and `T_λ` where Mirković–Vilonen give
two (E12); and a map into **Z/2Z** is defined by `(−1)^{2ρ(μ)}`, which lands in {±1} (E17). Three entries
are corroborated by the paper contradicting itself nearby — the strongest evidence a misprint can have:
E29 (`(2d_S)[2d_S]` five lines after a correct `(d_S)[2d_S]`), E19 (the shift outside `j_{μ,!+}` at line
2567, inside at 1857), and E10, whose appendix display carries both a summation limit missing its −1 and
`m2^{s−i}` for `m2^{s−t}`, with the next two stages of the same computation using the corrected forms.
