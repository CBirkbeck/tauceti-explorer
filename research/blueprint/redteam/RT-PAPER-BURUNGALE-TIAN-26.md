# RT-PAPER-BURUNGALE-TIAN-26

Red team against the accepted extraction `PAPER-BURUNGALE-TIAN-26` (issue #1048, reviewed in
REV-PAPER-BURUNGALE-TIAN-26), of

> Ashay A. Burungale and Ye Tian, *A rank zero p-converse to a theorem of Gross–Zagier,
> Kolyvagin and Rubin*, Annals of Mathematics 203 (2026), no. 1, 1–13;
> arXiv [2506.03465v2](https://arxiv.org/abs/2506.03465).

The corrected extraction has 92 items (3 library, 48 planned, 41 missing) and 8 routes: six
source routes and two Part II proposals, CMAllPrimeMainConjectures (route 7) and
CMRankZeroConverse (route 8). Its mistakes E1–E15 are recorded separately in
`research/blueprint/errata/PAPER-BURUNGALE-TIAN-26.json`.

**28 findings: 2 high, 14 medium, 12 low.** The machine-readable file is
[RT-PAPER-BURUNGALE-TIAN-26.result.json](RT-PAPER-BURUNGALE-TIAN-26.result.json); every finding
there has its evidence (a page and quotation, or the stage text) and a fix a worker can apply.
None of them affects the paper's theorems. They concern what the atlas will build for the CM
case: two proof inputs that nothing owns, a run of unstated steps on the way to Theorems 2.6
and 3.1, and routes that point at stages which do not, or no longer, plan what is asked of
them.

## The source

The paper was read on 150-dpi page images of arXiv 2506.03465v2, whose SHA-256
`cbb8284a…4664` is the one the extraction records, with every formula and citation checked
against the image rather than the text layer; v1 was compared with v2 (they differ only in the
arXiv stamp, the acknowledgements and references [5] and [21]). The typeset Annals
article is subscription-only and was not read; its public article page (abstract,
affiliations) was. Kato's Astérisque 295, in the copy the extraction used, was read at the
passages the extraction and the findings cite, in §§8 and 12–15: on page images wherever a
finding turns on the wording (13.4, 13.9, 14.9–14.13, 15.9–15.17), otherwise in its text
layer.

## Findings

### High

**1. Kato's Theorem 12.4 for CM newforms is planned by no stage** (error). Theorem 3.1, which
gives Theorems 1.1, 1.2 and Proposition 1.3, applies Kato 12.4 and 12.5 to CM newforms. Kato
does not prove 12.4 there by the §13 Euler-system bound that KatoEulerSystems L4 plans: he says
hypothesis (v) of 13.4 fails in the CM case, and proves 12.4(1) instead in 15.15 (with 15.14
when K ⊂ Q(μ_{p^∞}), the case K = Q(i), p = 2 of Theorem 1.2), from Rubin's elliptic-unit
theorem, the reciprocity (15.12.2) and the descent (15.13.1). The accepted Kato decomposition
marks §15 as unread, and the elliptic-unit main conjecture that the proof needs is itself a
missing item of route 7. The fix adds a `cm-h2-torsion` item to route 7 and restricts the
modular H²-torsion item to non-CM forms.

**2. No brief owns the integral two-variable elliptic-unit main conjecture** (missing). Rubin
1991, in its all-prime form Johnson-Leung–Kings Theorem 5.2, is assumed by three accepted
extractions, each pointing at another: route 7 here says it is not an output;
PAPER-CASTELLA-ETAL-22 route 8 merges into the same roadmap on the claim that this brief
"already asks for" it, and adds integral anticyclotomic consequences that cannot follow from a
p-inverted equality; PAPER-BURUNGALE-KOBAYASHI-OTA-21 route 5 defers the general theorem to
CMAllPrimeMainConjectures. The fix makes route 7 own an integral layer proving JLK Theorem 5.2
as printed, with Rubin 1991 (i) and (ii), and names its consumers.

### Medium

3. **Kato §15's CM realisations** (missing). The realisations V_L(ψ), V_{L_λ}(ψ) with the
period map and (15.8.1), the Galois induction V(f) ≅ Ind V(ψ) with its normalised forms
(15.11.2)–(15.11.3), and the map (15.12.1) have no item; cm-descent and cm-kato-main are stated
on different sides of the induction. The Hecke character of E/K has an owner (CM.4) but no
item.
4. **Ray-tower Iwasawa cohomology and twisting** (missing). H^q_{p^∞f}(T) for a general
lattice, and the twisting isomorphism with H^q_{p^∞f}(Z_p(1)) that carries equivariant-main to
equality-descent, are neither items nor planned; the component check at the bad primes holds
and is written out.
5. **Kato Proposition 15.9** (missing). The explicit reciprocity law for elliptic units in the
ray-class tower, for every r ≥ 1 and every p, has no item; BKO's item covers only r = 1. The
statement of cm-zeta-bridge also inverts Kato on which of (15.11.2) and (15.11.3) he uses as
an identification.
6. **The CM newform** (missing). cm-newform's definition is the induced form, not Kato's
(Remark 12.8, by L(f,s) = L(ψ,s)), and nothing links it to Kato's definition or to the
self-twist predicate of ModularForms Layer 9.
7. **exp\* at the centre** (error). The last step of Theorem 3.1 needs H¹_g = H¹_f for
V(f)(k/2) at every p, including p | N and p = 2. Kato proves the injectivity only under
Fontaine–Laffaille (Lemma 14.18). central-nonvanishing is marked planned, but no stage states
this; the fix makes it missing and adds the lemma, with an errata gap entry.
8. **Kato §14's local and global inputs** (missing): (14.9.3), (14.9.5), H⁰(Q, V(f)(r)) = 0
and Proposition 14.12.
9. **Specialisation of Iwasawa cohomology** (missing). The control sequence and the H²
isomorphism at q that the proof of Theorem 3.1 uses are not items; SelmerIwasawaCohomology L3
plans them.
10. **The counting input of Remark 3.6(ii)** (missing). The twists that descend to Q have
density zero; the fix adds this as an item (at j = 1728 the argument works modulo fourth
powers, not squares) and restates nondescent-density.
11. **Goldfeld in fundamental discriminants** (missing). BT's definition counts fundamental
discriminants; the extraction states only squarefree forms and itself warns that the
comparison is needed. The comparison holds (checked by direct count to 10⁶) and needs four
stated ingredients.
12. **Kato's j_\* convention** (error). etale-iwasawa is Kato's H^q_Iw, which no stage plans;
ModularIwasawaMainConjectures L0 describes extension by zero. Theorem 2.6's characteristic
ideal depends on the choice.
13. **Smith's method** (duplicate). Route 3 decomposes Smith I and II inside ST.5, but an
accepted Part II, ArithmeticStatisticsPartIISmithMethod, now owns Smith's method and imports
ST.5. The fix moves smith-density to a Part II route that coalesces with it.
14. **2-parity for congruent twists** (missing). Deriving Theorem 3.3 from Smith's theorem
needs corank Sel_{2^∞}(E^(n)) even for n ≡ 1, 2, 3 mod 8, which is named three times and
never itemised; no stage plans 2^∞-Selmer parity.
15. **cm-self-twist's corank claim** (error). CM.1 and CM.4 reach no Selmer groups, and
EllipticCurves Layer 7, which route 8's brief credits, does not state isogeny invariance of
Sel_{p^∞} coranks.
16. **bklos-density's CM imports** (error). ST.5 reaches no ComplexMultiplication stage, and
route 3 names none of the CM facts BKLOS §11 uses; CM.1 supplies them.

### Low

17. rational-characteristic defines ξ over one of BT's three Iwasawa rings only.
18. congruent-curve's locator misses the abstract, the only place the model ny² = x³ − x appears.
19. ray-iwasawa-ring's note still calls ray-group-structure missing.
20. The complex L-functions L(s,f) (in the library) and L(s,ψ) (AutomorphicLFunctionsAndLocalFactors AL.1 after RS-07) have no items.
21. The two quadratic base-change identities behind the doubling statements have no items.
22. analytic-rank is planned although its case of a curve over K that does not descend depends on a missing item; its empty library field misses Mathlib's formal L-series.
23. strict-selmer cites a stage that does not plan it; kato-conjecture's X_st form is stated by no stage.
24. ray-iwasawa-ring's planned list predates RS-16, which makes ProfiniteProPGroups Layer 9 the owner of Z_p[[G]].
25. Route 8's title predates RS-30's retitling of its parent, and the design job would inherit it.
26. The route 7 and 8 briefs name five imported roadmaps by superseded titles.
27. Route 8's reason describes RankOneConverse, which also owns non-CM rank-zero converses, out of date.
28. Two misprints are missing from the errata record: the uncited Alpöge–Bhargava–Shnidman result on p. 2 (E16), and a slip in the Annals online abstract (E17).

## Rejected on checking

Every finding was checked a second time, independently, at its evidence. Three suspected
problems did not survive and are not in the result:

- *A misprint missing from the review's hand-off*: "ψ : A_K^×/K^× → K^×" in the proof of
  Theorem 1.1 is indeed wrong, but it is already recorded and confirmed as E15, and the item
  already uses C_K → C^×.
- *twist and congruent-curve are library*: twist rightly stays planned, since no declaration
  at the pinned commits builds a twist indexed by the square-class group or ties it to the
  quadratic character. congruent-curve could be library, but it is not routed and nothing
  built changes.
- *units-finite and classes-finite duplicate IntegralIwasawaTheory I.2*: I.2 proves finite
  generation only over rank-one Z_p-extension rings, not over the three-dimensional ring
  Z_p[[Z_p² × Δ_f]] that BT use, so marking the carriers planned and finite generation missing
  is consistent.

Four pairs of findings that described the same gap from different directions were merged
(into findings 3, 5, 6 and 7).

## What held

- **Statuses.** All 35 stage descriptions that planned items cite were read in
  `data/atlas.json`, with every accepted restructuring touching them; apart from the findings
  above, each planned item is covered in the paper's generality. The three library items hold
  at the pinned commits: `cyclotomicCharacter` with its spec and continuity, and
  `LocalizedModule.AtPrime`, at Mathlib `082e2d3`; `HeckeRing.GL2.Newform` at Tau Ceti
  `f790474`.
- **Routing.** Each of the 41 missing items is routed exactly once, and nothing else is.
  Every edge a route or brief adds was tested against the stage graph (atlas `requires`,
  promoted restructuring links and `data/links`): none closes a cycle.
- **Titles and areas.** Parents and areas are valid (`data/galaxies.json`); the only stale
  titles are those of findings 25–26.
- **Overlapping extractions.** PAPER-SKINNER-20, PAPER-CASTELLA-ETAL-22 and
  PAPER-BURUNGALE-KOBAYASHI-OTA-21 were read for BKLOS, elliptic units and p-converse ownership;
  their conflicts with this extraction are findings 2, 5, 13 and 27.
- **Mistakes.** The whole paper was read for mistakes against E1–E15, which their own
  review has confirmed; the only additions are finding 28's two misprints and finding 7's
  gap. The proofs of Theorems 1.1 and 3.1 were redone
  (the twist σ_c ↦ c^{−k/2}, the Euler–Poincaré dimension, the sign of γ^±, the doubling on
  descent to Q), as were the counts behind Theorem 1.2 (303,947 of the 607,926 squarefree
  n ≤ 10⁶ are ≡ 1, 2, 3 mod 8) and Heath-Brown's constant.

The full list of what was read is the `checked` field of the result file.

## Checks

`python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-BURUNGALE-TIAN-26.result.json`
and `python3 research/blueprint/intake.py check-files` pass. A red team has no Lean
deliverable.
