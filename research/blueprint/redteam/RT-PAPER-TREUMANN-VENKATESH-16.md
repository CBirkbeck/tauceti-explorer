# Red team: PAPER-TREUMANN-VENKATESH-16 (Treumann–Venkatesh, *Functoriality, Smith theory, and the Brauer homomorphism*)

Job `RT-PAPER-TREUMANN-VENKATESH-16` (issue #4120), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-TREUMANN-VENKATESH-16.result.json`, in the format of PROTOCOL section 17.

**Result:** 13 findings: 8 medium and 5 low.

- The extraction is detailed, and the review corrected it carefully against the Annals text.
- Theorems 4.4, 5.8, 6.5 and 8.10 stand.
- All 53 recorded source issues stand.
- Most findings concern ownership and statuses: work planned twice, or statuses the review said were wrong but never changed.
- There is one new mathematical slip in the paper: the canonical pseudoroot (b) of §9.3 is inverted. No other issue records it, and E32's correction does not reach it.

## Independence

- **Who did the work.**
  - The extraction is by Claude Code `cc-7b31c4` (issue #1176, 22 September, with correction #1973).
  - The review is by Claude Code `cc-39fac3` (issue #1178, 23 September).
  - There is no separate errata file.
  - `cc-f805bf` appears in none of these files, nor in the register entries.
- **Disclosure.** This session wrote FIX-RT-AREA-automorphic-1, which proposes edits to AA.4, SR.4, ALS.0 and AF.2, among others.
  - Finding 5 cites the current texts of AA.0, AA.1, AA.3, AA.4, ALS.3 and SR.4.
  - None of that report's edits plans the statements at issue, and no finding asks for a change to this session's files.
  - This session also red-teamed BHKT-19 (PR #4725). No finding touches it.

## What was read

- **The Annals text, the version of record.** Ann. of Math. 183 (2016), 177–228, fetched 30 September 2026 from the Annals site.
  - It has 52 pages, and its SHA-256 is `15513cab…3355`, the same as the review's.
  - I read all of it, §§1–9 and the references.
  - The PDF extracts with pdftotext without trouble.
- **arXiv:1407.2346v1**, the only version.
  - The PDF has SHA-256 `34e2416f…9ee8`. The source archive has `28e20b81…2c11`, the same as the extraction's.
  - I collated it against print wherever an item or a finding depends on it: §§2.12–2.13, §7.5, §7.8, §§9–12, the bibliography and the Steinberg citations.
- **The rest of the repository.**
  - All 121 items, the 3 routes with their briefs, the 8 prerequisites and the 53 source issues.
  - The cited layers:
    - AA.0–AA.5, ALS.0–ALS.6, SR.0–SR.6, and RG2.1, RG2.3, RG2.4 and RG2.5;
    - the Tau Ceti ReductiveGroups README (Layers 7 and 9);
    - the Tau Ceti EllipticCurves README (Layers 5 and 7).
  - The overlapping extractions, with their reviews and dates: Feng 24, Venkatesh 19, Scholze 15, Caraiani–Scholze 17, Gan–Harris–Sawin et al. 24, Lipnowski–Tsimerman 18, Fakhruddin–Khare–Patrikis 22 and Paškūnas–Quast 26.
  - The queue: no DESIGN job exists yet for either Part II.
- **The pinned libraries,** Mathlib `082e2d3` and Tau Ceti `f790474`. I opened every cited declaration, and searched `declarations.tsv` for each "missing" item that a library might plausibly have.

## What holds up

- **Recomputed and confirmed:**
  - E32: for PGL_2, S*(T) = qa + a^{-1}, which is invariant under a ↦ 1/(qa) and not under q/a.
  - E19's GL_1×GL_1 counterexample, and the norm-product formula for br.
  - E7 (SO(3,1)), E9 (PGL_2), E10 and E11, E13's three chains, E38, and E42 (squared length 7264 against 78 in the E_7 form), E50 (SL_3 ⊃ GL_2) and E51.
  - §9.7's G_2 root geometry, the admissible tuples of §§9.5–9.6, and Lemma 8.8.
- **Library claims.** Every cited declaration exists as cited. The one over-claim is item 16 (finding 4).
- **Routes.**
  - Every missing item is routed exactly once.
  - The two Part IIs and the SR source route are well placed.
  - There is no stage-level cycle.
  - No route goes into a finished blueprint: AA, ALS, SR and RG2 have no packets.
  - Feng 24's route 3 correctly imports plain subgroups, Br, linkage and the conjecture from route 1.

## Findings

| # | Severity | Kind | Where | What |
|---|---|---|---|---|
| 1 | medium | duplicate | route 1, items 2 and 26 | REV-PAPER-FENG-24 (28 Sep) gave the general §3.4 (Tate diagonal, unique extension of characters) and the Frobenius twist of algebras to SheafTheoreticSmithTheory, and said this Part II imports them. Route 1 still plans both, in its items and in its brief. |
| 2 | medium | duplicate | item 3 | Nonabelian H^1(σ; M) is the finite-group case of the continuous nonabelian H¹ that Tau Ceti EllipticCurves Layer 5 plans. Items 4 and 5 stay missing. |
| 3 | medium | missing | Props 5.6, 8.3 | Three theorems used in these proofs have no item: Lang–Steinberg (now planned at RG2.3 via Lipnowski–Tsimerman 18), Steinberg's σ-stable Borel pairs ([35, §8.9]), and the closedness of the class of σ in characteristic 0 (Joyner). |
| 4 | medium | library-claim | item 16 | The item is "library" but states the modules V^K and k[X/K], which neither library has. Tau Ceti has only X = G (`LeftCosetModule.instModuleMulOpposite`, uncited). The review's instruction to split the item was never carried out. |
| 5 | medium | error | items 37, 43 (38, 18) | Nothing plans the restricted tensor product of Hecke algebras (AA.0/AA.4) or the properness of H(F)\H(A) → G(F)\G(A) (AA.3), as the review noted without changing the statuses. Item 38 should cite AA.1 with Lang, and item 18 needs the chain/correspondence comparison. |
| 6 | medium | error | route 1 brief | The brief states Theorem 5.8 for semisimple G. The paper proves it for connected reductive G (§5.5), and the §9.4 and §9.5 examples (Res_{E/F} H, GL_n) need that. |
| 7 | medium | error (new E54) | item 59; §9.3(b) | The canonical pseudoroot comes from the Hecke character 𝔭 ↦ N𝔭 and squares to δ^{-1}, not δ. For p ≥ 7 it is not a pseudoroot: with SL_2, p = 7 and q_v = 3, δ ≡ 4 but χ0² ≡ 2. The fix is 𝔭 ↦ N𝔭^{-1} with Frob_v arithmetic. E32 does not reach this. |
| 8 | medium | error | review-added §9 items | rev-exotic-mod-2-transfer-from says n ≥ 1, but for n = 1, σ = J(g^T)^{-1}J^{-1} is the identity on SL_2. Three pairs of review items restate each other instead of citing. |
| 9 | low | error (new E55) | item 39; Prop 5.4 | The proof uses the group K/K′ and Hochschild–Serre, so it needs K′ normal in K. The statement omits this. |
| 10 | low | error (new E56) | §7.1; preprint §11.3 | "[34, p. 173]" (and preprint "[31, p. 177]") point outside Steinberg's *Regular elements*, pp. 49–80. The Yale *Lectures on Chevalley Groups* §11 is presumably meant. |
| 11 | low | duplicate | items 7, 63, 14 | No single owner is named for the canonical torus (also FKP 22 → LGDR L7), the C-group (also Paškūnas–Quast 26's LGDR Part II) or the Langlands correspondence for tori (unramified case at SR.4, general case in PQ 26). |
| 12 | low | other | readSections, E1–E4, sourceVersions | "The published text could not be read" survives in two records and in the register. There is no sourceVersions, although E32, E48 and E50 affect stated results (§18). |
| 13 | low | missing | prerequisites | Henniart–Vignéras 2015 (the published proof of (7.2.6)), Rohlfs–Speh 1993 (§5.7) and Steinberg 1968 (Prop. 8.3) are missing. |

## Notes on the main findings

**Finding 1.**
- Feng's review is explicit: "ShtukaTateCohomologyAndGlobalBaseChange and SmithTheoryAndModPFunctoriality import them."
- Its item notes name TV items 2 and 26 as the special cases.
- The TV Part II has no design job yet, so the fix is only to its route file: rewrite the brief's Cover and Import lists.
- The topological Smith theory of Theorem 4.4 stays here. SheafTheoreticSmithTheory plans the étale-sheaf version.

**Finding 7.**
- §7.4(b) defines a pseudoroot as δ^{1/2} with (δ^{1/2})² = δ = |Σ_G|_v.
- §9.3(b) pulls back, along Σ_G/2, the idele class character corresponding to 𝔭 ↦ N𝔭. At v that character is x ↦ q_v^{v(x)} = |x|_v^{-1}, so the pullback squares to δ^{-1}.
- Since ⟨Σ_G, α^∨⟩ = 2 on a simple coroot, the two agree only when q_v⁴ ≡ 1 mod p. That holds for p ≤ 5, which covers every example in the paper (p = 2, 3), and fails at a positive-density set of places once p ≥ 7.
- (9.3.1), ρ^-_G(Frob_v) = Σ*_G/2(cyclo(Frob_v)), is consistent with the corrected §7.4 only for the inverse character, with Frob_v arithmetic. So the parenthetical is what must change.

**Finding 8.**
- For J = (0 1; −1 0) and g ∈ SL_2, J g J^{-1} = (g^T)^{-1}, so σ(g) = J²gJ^{-2} = g.
- The companion item rev-exotic-transfer-from-sp-2n already says n ≥ 2.

## What I did not find

- No wrong library citation, apart from item 16's scope.
- No wrong recorded issue: every one of E1–E53 is confirmed.
- No route into a finished blueprint, and no cycle.
- One mutual roadmap-level dependency, which is harmless: item 65 (c-group Satake, SR.4) uses the c-group of item 63 (route 2), and route 2 imports SR.4's Satake isomorphism. It needs only that the c-group be an early layer of route 2.
