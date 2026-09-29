# PAPER-LAWRENCE-VENKATESH-20: Diophantine problems and p-adic period mappings

Brian Lawrence and Akshay Venkatesh, *Diophantine problems and p-adic period mappings*, [Invent. Math. 221 (2020), 893–999](https://doi.org/10.1007/s00222-020-00966-7); arXiv [1807.02721](https://arxiv.org/abs/1807.02721).

Extraction by Claude Code, session `cc-39fac3`, 29 September 2026 (issue #2162). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-LAWRENCE-VENKATESH-20.result.json](PAPER-LAWRENCE-VENKATESH-20.result.json). It has:
- 67 items: 3 library, 41 planned, 23 missing;
- 2 routes;
- 9 prerequisite entries;
- 3 source issues.

## Sources read

- **arXiv v3** (25 October 2019, 76 pages), read completely. Locators are its pages. Page images were checked at every finding.
- **The published article** is not openly available (Crossref lists only the Springer TDM licence) and was not collated. The gap `published-version` records this.
- **A reading slip avoided.** In the text layer, the |i−j| = 1 term of (10.9) reads "2n−2 over 12". The page image shows 2·(n−2)/12, which is correct, so no issue is recorded there.

## What the paper proves

**Faltings's theorem (Theorem 5.4).** A curve of genus at least 2 over a number field has finitely many rational points.

The method runs as follows:
1. Faltings's finiteness lemma (Lemma 2.3) leaves finitely many Galois representations for fibres with good reduction.
2. p-adic Hodge theory turns them into filtered φ-modules (§3.5).
3. On a residue disk these vary by a p-adic period map. It has the same power series as the complex period map (Lemma 3.2), so big monodromy makes its image Zariski dense (Lemma 3.3).
4. Finiteness then follows if the Frobenius centralizer is small (Proposition 3.4).

**Two further ingredients make this work for curves.**
- *Small centralizers.* Frobenius is semilinear over large unramified extensions (Lemma 2.1). Such extensions come from an **abelian-by-finite family**, the Kodaira–Parshin family of singly ramified Aff(q)-covers (§7). Its Galois orbits are large (the size_v count of Theorem 5.4, via the Weil pairing), and its monodromy is Zariski dense (Theorem 8.1, by Dehn twists on a normal form of the covers, §8).
- *Semisimplicity.* Purity of Hodge weights at friendly places (Lemmas 2.8–2.10), with a general-position lemma for Lagrangians (Lemmas 6.3–6.4), controls the failure of semisimplicity (Lemma 6.1).

The S-unit theorem (§4) is the warm-up, via a variant of the Legendre family.

**Higher dimension (§§9–12).** With the Bakker–Tsimerman Ax–Schanuel theorem, the p-adic period map satisfies a transcendence property (Lemma 9.3). **Theorem 10.1** follows: integral points on the base of a family with large monodromy are not Zariski dense when the adjoint Hodge numbers satisfy (10.4)–(10.5). Its proof needs:
- a small Frobenius centralizer at some small prime (Lemma 10.4: Chebotarev, the Hodge torus in the Galois image, Katz–Messing);
- a codimension estimate for "bad" filtrations (Proposition 10.6), proved with reductive-group combinatorics (§11).

**Proposition 10.2** applies Theorem 10.1 to hypersurfaces in Pⁿ of large dimension and degree, through the Eulerian distribution of their Hodge numbers. §12 gives an alternative, point-counting bound for the Frobenius centralizer.

## What the atlas already has

- **Library (3).** Mathlib provides Hermite–Minkowski, Dirichlet's theorem and Grassmannians.
- **Planned in MordellLawrenceVenkatesh (40).** The draft roadmap *The Mordell conjecture after Lawrence and Venkatesh* (DESIGN-LV, reviewed) was designed from this paper. Its layers plan the curve case statement by statement, and its 132-node packet cites the same lemmas:
  - LV.0: semilinear centralizers, Aff(q), symplectic lemmas;
  - LV.1: Faltings's lemma, friendly places, purity;
  - LV.2: abelian-by-finite families and Gauss–Manin transport;
  - LV.3: period maps;
  - LV.4: the crystalline comparison and Proposition 3.4;
  - LV.5: surfaces and mapping class groups;
  - LV.6: the S-unit theorem;
  - LV.7: Proposition 5.3 and §6;
  - LV.8: Hurwitz spaces and the Kodaira–Parshin family;
  - LV.9–LV.10: the monodromy theorem;
  - LV.11: the assembly.
- **Planned elsewhere (1).** Bakker–Tsimerman's theorem (Theorem 9.1): LogicAndDefinabilityInNumberTheory LD.6 takes Ax–Schanuel theorems as independently acquired functional-transcendence inputs, as PAPER-LAWRENCE-SAWIN-25 also records.
- **Missing.** The higher-dimensional half of the paper and Lemma 2.2.

## Routes

**1. Part II, coalesced: MordellLawrenceVenkateshPartII (22 items).** Lawrence–Sawin's extraction proposes *The Mordell conjecture after Lawrence and Venkatesh, Part II* (design DESIGN-MordellLawrenceVenkateshPartII). It covers their non-density theorem (their Theorem 8.17), a p-adic Bakker–Tsimerman theorem, and Faltings finiteness for disconnected reductive targets. Those results generalize this paper's §§9–11. So the higher-dimensional items are routed to the same roadmap id:
- G-semisimplification and Lemmas 2.4–2.6;
- Corollary 9.2 and Lemma 9.3;
- adjoint Hodge numbers, Theorem 10.1 and Lemmas 10.4–10.5 with their inputs (the Hodge torus, Katz–Messing);
- Proposition 10.6 and the §11 combinatorics;
- the hypersurface application (Proposition 10.2, Beauville's monodromy, Eulerian asymptotics and statistics, Lemma 10.3);
- Lemma 12.1.

The brief gives Theorem 10.1 and Proposition 10.2 as the first applications and Lawrence–Sawin's theorem as the general form, so the design job merges the two sources.

**2. Source: MordellLawrenceVenkatesh LV.1 (1 item).** Lemma 2.2 (induction from a finite-index subgroup preserves semisimplicity in characteristic 0) belongs beside LV.1's Galois-representation inputs, which do not yet include it.

## Prerequisites

These are papers the atlas does not yet cover:
- Bakker–Tsimerman 2019;
- Beauville 1986;
- Katz–Messing 1974;
- Sen 1973, Wintenberger 1984 and Pink 1998 (the Hodge torus in the Galois image);
- Mazur 1973 (Theorem 7.6, used in Lemma 9.3);
- Chatterjee–Diaconis 2017 (the central limit theorem for ascents);
- Serre's *Complète réductibilité* (G-complete reducibility).

## Source issues

| id | kind | where | finding |
|----|------|-------|---------|
| E1 | error | §10.2, p. 57 | The parameter space of degree-d hypersurfaces in Pⁿ is given dimension (n+d choose d−1) − 1 ∼ d^{n+1}/(n+1)!. The correct value is (n+d choose d) − 1 ∼ dⁿ/n!; for n = 1 the printed formula gives d(d+1)/2 − 1 instead of d. (10.8) and everything after are unaffected. |
| E2 | error | Proof of Lemma 12.1, p. 74 | g_N = (Σ_{\|r\|≤N} e(rt))² has frequencies up to 2N, but the proof sums only \|r\| ≤ N. With the correct range the tail is q^{(n/2+1)2N}. So the bound dim Z ≤ 3b²/N holds for N the largest integer with q^{(n/2+1)·2N} < b/3; with the printed N the argument gives about 6b²/N. Lemma 12.1 is not used elsewhere. |
| E3 | misprint | §7.2, p. 35 | "Pic⁰(C₁)^{G_q}": G_q is undefined; it should be Aff(q). |

Two further points are not recorded as issues:
- The caption of Figure 4 writes the word β₁β₂β₁⁻¹β₂², while the text constructs β₁β₂β₁⁻¹β₂^{q−c₁}. The figure illustrates the case q − c₁ = 2.
- The proof of the Hodge-number asymptotics (10.6) and of Lemma 8.6 are omitted by the authors ("we will omit the proof", "left to the reader"). The corresponding items record this for the design jobs.

I also rechecked the arithmetic of the curve case against the text: the generating-tuple count and the isotropic-subgroup bound in Theorem 5.4, the counting (6.9)–(6.11), and dim H_{(y′₀,w₀)} > 4d² in Lemma 6.2. For the hypersurface case I rechecked Var = (n+1)/12, the constant c = 1/40 below the N(0, 1/6) density at 1.1 (≈ 0.0259), and the variance bound in Proposition 10.2. All of these are correct.

## Corrections by the independent review

The review `REV-PAPER-LAWRENCE-VENKATESH-20` (Claude Code, session `cc-fb70e5`, 29 September 2026) accepts the extraction.

- **Published text collated.** The published article is readable in a public journal PDF (bimsa.net/doc/publication/2578.pdf), which the roadmap errata job had already used. E1–E3 were checked there and all persist, on pp. 971, 996 and 941. `sourceVersions` and the locators now record this, and the gap `published-version` is closed.
- **E1–E3 confirmed.** For E2, the Fourier bookkeeping in Lemma 12.1 was redone: the proof supports N chosen with q^{(n/2+1)·2N} < b/3.
- **Further mistakes.** `research/blueprint/errata/MordellLawrenceVenkatesh.json` already records 28 more mistakes in §§1–8 of this paper, found by the roadmap's errata job. One is the range 1 ⩽ i ⩽ 8 in the proof of Theorem 5.4, which the review also found independently. They are not duplicated here. A new gap, `roadmap-errata`, points to them.
- **Route 1's title** differs from the one PAPER-LAWRENCE-SAWIN-25 gave the same roadmap id. The design job should settle it.

No item statement, status or route changed.
