# PAPER-LAWRENCE-VENKATESH-20: Diophantine problems and p-adic period mappings

Brian Lawrence and Akshay Venkatesh, *Diophantine problems and p-adic period mappings*, [Invent. Math. 221 (2020), 893–999](https://doi.org/10.1007/s00222-020-00966-7); arXiv [1807.02721](https://arxiv.org/abs/1807.02721).

Extraction by Claude Code, session `cc-39fac3`, 29 September 2026 (issue #2162). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-LAWRENCE-VENKATESH-20.result.json](PAPER-LAWRENCE-VENKATESH-20.result.json). It has:
- 95 items: 4 library, 55 planned, 36 missing (67 items at extraction: 3 library, 41 planned, 23 missing; see "Fixes after the red team");
- 4 routes (2 at extraction);
- 12 prerequisite entries (9 at extraction);
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
- **Planned elsewhere.** At extraction, Bakker–Tsimerman's theorem (Theorem 9.1) was marked planned at LogicAndDefinabilityInNumberTheory LD.6. The red-team fix marks it missing: LD.6 only takes Ax–Schanuel theorems as independent inputs. The fix also adds items for the theorems the paper imports, each with its owner. See "Fixes after the red team".
- **Missing.** The higher-dimensional half of the paper and Lemma 2.2.

## Routes

**1. Part II, coalesced: MordellLawrenceVenkateshPartII (22 items).** Lawrence–Sawin's extraction proposes *The Mordell conjecture after Lawrence and Venkatesh, Part II* (design DESIGN-MordellLawrenceVenkateshPartII). It covers their non-density theorem (their Theorem 8.17), a p-adic Bakker–Tsimerman theorem, and Faltings finiteness for disconnected reductive targets. Those results generalize this paper's §§9–11. So the higher-dimensional items are routed to the same roadmap id:
- Lemmas 2.4–2.5 (G-semisimplification and Lemma 2.6 moved to route 2 in the red-team fix);
- Corollary 9.2 and Lemma 9.3;
- adjoint Hodge numbers, Theorem 10.1 and Lemmas 10.4–10.5 with their inputs (the Hodge torus, Katz–Messing);
- Proposition 10.6 and the §11 combinatorics;
- the hypersurface application (Proposition 10.2, Beauville's monodromy, Eulerian asymptotics and statistics, Lemma 10.3);
- Lemma 12.1.

The brief gives Theorem 10.1 and Proposition 10.2 as the first applications and Lawrence–Sawin's theorem as the general form, so the design job merges the two sources.

**2. Source: MordellLawrenceVenkatesh LV.1 (1 item at extraction, 5 after the red-team fix).** Lemma 2.2 (induction from a finite-index subgroup preserves semisimplicity in characteristic 0) belongs beside LV.1's Galois-representation inputs, which do not yet include it. The fix adds G-semisimplification, Lemma 2.6, and Richardson's theorem and finiteness of H¹(Q_p, −), which its corrected proof needs.

**3. Source: MordellLawrenceVenkatesh LV.2–LV.4 (8 items, added in the red-team fix).** The general case of §3, for H^q of any smooth proper family over a base of any dimension: Gauss–Manin transport, the monodromy group, the period maps, Lemmas 3.1 and 3.3, the crystalline transport, Proposition 3.4, and the compact dual H* of §9.

**4. Part II, coalesced: LogicAndDefinabilityPartII (1 item, added in the red-team fix).** Bakker–Tsimerman's Ax–Schanuel theorem for variations of Hodge structure. It joins the Part II that PAPER-MOK-PILA-TSIMERMAN-19 proposes for Ax–Schanuel on Shimura varieties.

## Prerequisites

These are papers the atlas does not yet cover:
- Bakker–Tsimerman 2019;
- Beauville 1986;
- Katz–Messing 1974;
- Sen 1973, Wintenberger 1984 and Pink 1998 (the Hodge torus in the Galois image);
- Mazur 1973 (Theorem 7.6, used in Lemma 9.3);
- Chatterjee–Diaconis 2017 (the central limit theorem for ascents);
- Serre's *Complète réductibilité* (G-complete reducibility);
- Faltings 1989 (the crystalline comparison theorem), Katz–Oda 1968 (the Gauss–Manin connection) and Richardson 1967 (Theorem 7.1, used in Lemma 2.6). The red-team fix added these three.

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

## Fixes after the red team

FIX-RT-PAPER-LAWRENCE-VENKATESH-20 (Claude Code, session `cc-f805bf`, 30 September 2026, issue #5015) applied the five confirmed high and medium findings of RT-PAPER-LAWRENCE-VENKATESH-20. It followed the independent verifier's version of each finding. The fixes report `redteam/RT-PAPER-LAWRENCE-VENKATESH-20.fixes.md` gives the details.

- **The §3 items were stated in a generality nothing plans (finding 1).** The paper states §3 for H^q of any smooth proper family over a base of any dimension, but LV.2–LV.4 plan it only for H¹ of abelian-by-finite families.
  - /good-model-gm, /monodromy-group, /lemma-3-1, /lemma-3-3, /crystalline-transport and /prop-3-4 are restricted to that case and stay planned there.
  - Their general forms are seven new missing items, sent by the new route 3 to LV.2–LV.4, beside Betts–Stix route 4. So is a new item for the compact dual H*.
  - The flag variety H of §3.4 is a new item, planned at AlgebraicModuliForArithmeticGeometry R09.1.
- **Bakker–Tsimerman had no owner (finding 2).** Theorem 9.1 is now missing and goes by the new route 4 to LogicAndDefinabilityPartII, the Part II proposed by PAPER-MOK-PILA-TSIMERMAN-19. Route 1's brief imports it from there.
- **Items used uncorrected statements (finding 3).** These items now carry the roadmap errata's corrections:
  - /lemma-2-8 (E3): the identity holds on the units only;
  - /lemma-2-12 (E22): i ≠ j;
  - /lemma-6-3 (E10, E25): 0 ≠ W ≠ V, A nonempty, φ a similitude;
  - /lemmas-8-2-8-3 (E13, E14): e nonseparating, M positive and sufficiently divisible.

  /lemma-2-3 (E2) and /prop-5-3 (E7) are true as stated and gain notes. The gap `roadmap-errata` now lists these items and /lemma-2-6.
- **Lemma 2.6 had two owners (finding 4).** G-semisimplification and Lemma 2.6 move to route 2, so LV.1 is their one owner. Betts–Stix's symplectic form (PAPER-BETTS-STIX-25/12–13, whose notes now say so) is the case G = GSp. /lemma-2-6 is restated with E27's domain, and its note records E28 (the printed proof is incomplete) and Lawrence–Sawin's corrected argument.
- **The imported theorems had no items (finding 5).** 19 new items record them:
  - Chebotarev (Tau Ceti Chebotarev Layer 10);
  - Weil's theorem for abelian varieties (DWP.1) and Deligne's purity (DWP.4, DWP.7, R34.5);
  - unramifiedness from smooth proper base change (SchemeAndStackFoundations SF.2; R11.5 for abelian varieties);
  - full faithfulness of D_cris (R06.2), Faltings's comparison (CP.2 with R06.2), Berthelot–Ogus (CR.2–CR.3) and the Gauss–Manin connection (ComplexComparisonPartII C5);
  - Fontaine–Laffaille theory (R07.3);
  - Strassmann's theorem (LV.3), Riemann existence and GAGA (IG.3, C2), the Weil pairing (EDC.2) and the trace formula (WeilConjectures WC.2);
  - Noetherianity of Tate algebras (Tau Ceti AdicSpaces Layer 0), which the red team and the verifier had thought unplanned;
  - Krull's intersection theorem, in Mathlib as Ideal.iInf_pow_eq_bot_of_isDomain.

  Four are missing. Richardson's theorem and finiteness of H¹(Q_p, −) go to route 2, with Lemma 2.6. The local analytic Nullstellensatz and the comparison of fibre functors in footnote 10 go to route 1. /crystalline-transport is split from Faltings's comparison. Three prerequisites are added.

Routes 3 and 4 are appended, so that the review verdicts of routes 1 and 2 stay with their routes. No route was retargeted. Routes 3 and 4, and the items added to routes 1 and 2, have no review verdict yet. The seven low findings (/6–/12) are confirmed but not applied here.
