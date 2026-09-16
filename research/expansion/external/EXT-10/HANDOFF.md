# EXT-10 — Modular, Shimura and Galois theory — handoff

Job **EXT-10** in `research/expansion/EXTERNAL_AGENTS.md`. Nine roadmaps, 77 stages.
Packets follow `research/expansion/PROTOCOL.md`. Every node carries
`implementationStatus: "unchecked"`; no Lean work was done, no sorry introduced and no
execution ticket is implied. Every packet `status` is `partial`.

## Files written

| file | nodes | links | gaps | stage coverage |
|---|---|---|---|---|
| `AlgebraicModularFormsAndSerreWeights.json` | 24 | 17 | 6 | 6 partial |
| `ClassicalSerreModularity.json` | 21 | 16 | 8 | 14 partial, 4 not_read (R26.2, R26.4, R26.5, R33.6) |
| `ArithmeticGaloisRepresentations.json` | 9 | 6 | 5 | 7 partial |
| `AutomorphicGaloisRepresentations.json` | 8 | 7 | 5 | 6 partial |
| `CompletedCohomologyPartII.json` | 8 | 6 | 6 | 7 partial, 2 not_read (CC.1, CC.4) |
| `AutomorphicGaloisRepresentationsPartII.json` | 7 | 6 | 5 | 6 partial, 4 not_read (AG2.1, AG2.1b, AG2.2, AG2.3) |
| `EllipticCurveModularity.json` | 6 | 7 | 4 | 5 partial, 1 not_read (R29.5) |
| `CompletedCohomologyAndLocalGlobalCompatibility.json` | 5 | 5 | 5 | 4 partial, 2 not_read (R31.2, R31.5) |
| `AutomorphicBundles.json` | 3 | 3 | 4 | 3 partial, 6 not_read (B0, B1, B1.general, B2.general, B3.general, B5) |
| **total** | **91** | **73** | **48** | **58 partial, 19 not_read** (= all 77 stages) |

Validated with `python3`: all files parse; every `parentStageId` and link endpoint
resolves against `data/atlas.json`; node ids are unique and prefixed by their parent
stage; every citation resolves to a declared source; coverage lists exactly the owner's
stages. The union of the atlas `stageEdges` with the 54 cross-stage edges these packets
imply (27 of them new) is **acyclic**; so is the node-level graph. Three cycles that an
earlier draft would have introduced were found and removed — see *Corrections* 10–12.

## Sources actually read

"Read" means the numbered statement, and where claimed its proof, was opened and
inspected in the file named. Locators in the packets give printed page numbers. All
reading was done outside the repository; no PDF, DVI or extracted text was copied in.

**Read with proofs**

- **Serre, *Sur les représentations modulaires de degré 2 de Gal(Q̄/Q)*, Duke 54 (1987)** —
  `papers/ADD_SERRE87.pdf`, `8048919d…`. §§1.1–1.3, 2.1–2.9, 3.1–3.4, 4.6–4.7.
- **Katz, *p-adic properties of modular schemes and modular forms*, LNM 350 (1973)** —
  `papers/ADD_KATZ73.pdf`, `f9c14dc0…`. §§1.5–1.9, 1.11–1.12, 2.0–2.1.
- **Edixhoven, *The weight in Serre's conjectures on modular forms*** —
  `papers/ADD_EDIXHOVEN92.dvi`, `ff106eeb…`. §§1, 2.4–2.9, 3, 4, 8.
- **Deligne–Serre, *Formes modulaires de poids 1*, Ann. ENS 7 (1974)** —
  `papers/SS_DeligneSerre.pdf`, `65b390f6…`. §4.1–4.5, §6.1–6.13.
- **Raynaud, *Schémas en groupes de type (p,…,p)*, Bull. SMF 102 (1974)** —
  `papers/R02_SS_Raynaud1974.pdf`, `05cad2f5…`. §§3.3–3.4.
- **Khare–Wintenberger, *Serre's modularity conjecture (I)*** — `papers/SS_KW1.pdf`,
  `3c389dc3…`. §§1–10 in full (everything proved there).
- **Böckle, *Appendix 1: On the isomorphism R_∅ → T_∅*** —
  `papers/R02_SS_BockleAppendix2003.pdf`, `67de08f6…`. In full.
- **Dieulefait–Pacetti, *A simplified proof of Serre's conjecture*** —
  `papers/SS_DieulefaitPacetti.pdf`, `0c6850da…`. In full.
- **Deligne, *Formes modulaires et représentations ℓ-adiques*, Bourbaki 355** —
  `papers/ADD_DELIGNE69.pdf`, `19509c19…`. §1, Prop. 3.15, Thm 4.9, §5.
- **ACC+, *Potential automorphy over CM fields*, Annals 197 (2023)** —
  `papers/accplus-potential-automorphy.pdf`, `c5429e4f…`. Def. 4.3.1 + Lem. 4.3.2;
  Def. 6.2.29 + Lem. 6.2.30 + Rem. 6.2.31.
- **Faltings, *Endlichkeitssätze …*, Invent. Math. 73 (1983)** — `papers/ADD_FALTINGS83.pdf`,
  `0b7fb3e5…`. §1, Sätze 3–4, Korollare 1–3.
- **Scholze, *On torsion in the cohomology of locally symmetric varieties*** —
  `papers/scholze-torsion.pdf`, `ebac854f…`. §4.2 (Thm 4.2.1 statement; Cors 4.2.2, 4.2.3
  with proofs).

**Read for statements only (no proof inspected)**

- Khare, arXiv:math/0504080v1 (`ADD_KHARE06.pdf`, `3012a517…`) §1, §2.
- Khare–Wintenberger, Annals 169 (2009) (`R02_SS_KWAnnals2009.pdf`, `154c0c2a…`) §6.2 with proof.
- Carayol, Ann. ENS 19 (1986) (`SS_Carayol.pdf`, `d4a5fb6b…`) §0 in full.
- T. Saito, arXiv:math/0612077v2 (`ADD_T_SAITO.pdf`, `fb5b69b7…`) Thms 0, 1, 2, Claim 1.
- Chenevier, arXiv:0809.0415v2 (`chenevier-determinants.pdf`, `f3c0e0d8…`) Thms A, B.
- Deligne, LNM 349 (1973) (`ADD_DELIGNE73.pdf`, `b03f483c…`) §8.2, §8.4.
- Calegari–Emerton, *Completed cohomology — a survey* (`R02_SS_CompletedCohomologySurvey.pdf`,
  `926a5de4…`) §§1.1–1.5 in full.
- Emerton, *Local-global compatibility …* draft 23 Mar 2011 (`ADD_EMERTON11.pdf`,
  `bf4f8556…`) §§1.1–1.2 only.
- HLTT (`SS_HLTT.pdf`, `abecfd04…`), Chenevier–Harris (`SS_ChenevierHarris.pdf`,
  `9b5e7679…`), Varma (`SS_VarmaLocalGlobal.pdf`, `24076dfc…`), Caraiani ×2
  (`SS_CaraianiMonodromyAway.pdf`, `769e68e2…`; `SS_CaraianiMonodromyAtP.pdf`,
  `6ec69841…`) — introductions only.
- Lan, *An Example-Based Introduction to Shimura Varieties* (`SS_LanIntroduction.pdf`,
  `d9a3e755…`) §§4.2.5–4.2.7, 5.1.4–5.1.5.
- KW II (`SS_KW2.pdf`, `53f45f8b…`) — **title page, abstract and contents only.**

## Corrections to existing statements

1. **Serre 1987 cites a nonexistent Raynaud result.** In the proof of Prop. 4 (p. 190)
   Serre writes "Ce cas est traité dans Raynaud [35], th. 2.4.3." Raynaud, Bull. SMF 102
   (1974) has no result numbered 2.4.3 (§2's numbered results are 2.2.2, 2.2.3, 2.3.1).
   The theorem that treats that case is **Thm 3.4.3**, p. 270. Two independent
   extractions of the Serre PDF give the same string, so this is not an artefact.
2. **Why Serre's Prop. 4 is proved only for p ≠ 2.** His step "d'après [35], prop. 3.3.2,
   ce schéma est unique" needs Raynaud's uniqueness of the finite flat prolongation, valid
   under `e < p−1`. Over Z_p, e = 1, so this is p ≥ 3. At p = 2 one is in Raynaud's
   `e = p−1` case (Prop. 3.3.2 part 3) where a simple group scheme can have **two**
   prolongations, one étale and one multiplicative. `AlgebraicModularFormsAndSerreWeights:R15.4`
   demands the p = 2 dichotomy; it must not be treated as available until this is closed.
3. **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1` checks out against Raynaud** —
   its description of Cor. 3.3.6 and of Thms 3.4.1/3.4.3 is accurate. No change needed.
   *Request:* R07.1 should also state Prop. 3.3.2 in the `e = p−1` branch, because the
   p = 2 Serre-weight dichotomy R07.5 promises to feed R15 sits in that branch.
4. **Katz's weight-one base change is open above level 12** (Remark after Thm 1.7.1).
   Any weight-one use of "base-change statements for spaces of forms" in R15.2 must carry it.
5. **The atlas cites KW's killing-ramification argument at the wrong section.**
   `ClassicalSerreModularity:R26.1` says "Annals 169 (2009), 229–253, especially §5.2's
   killing-ramification argument". In the **published** Annals paper that is **§6.2**,
   printed pp. 250–251; §5 there is "Low levels and weights". 5.2 is the preprint numbering.
6. **`ClassicalSerreModularity:R26.1`'s claim about the Böckle appendix is correct** —
   `R02_SS_KhareBockle2003.txt` is arXiv:math/0211005v1 and refers to "the appendix by
   Gebhard Böckle [B] to this paper" without containing it.
7. **KW I corrects Khare's Corollary 1.2 and removes its `p > 2` hypothesis** (§8.3:
   "the reference to 3 of Theorem 5.1 of [24] is not enough as p may not divide q − 1";
   "Note that p = 2 is included"). Any transcription of "the exact hypotheses of Khare's
   Corollary 1.2" must carry this.
8. **Dieulefait–Pacetti report that KW I Lemma 6.2(ii) "lacks some details"** and supply a
   replacement (their Lemma 1.14) distinguishing niveau 1 (p = 2k−1) from niveau 2
   (p = 2k−3). Use their version.
9. **KW I withdrew an earlier form of Lemma 8.2**: the published Remark records that
   Dieulefait and Wiese pointed out that a rationality hypothesis may be necessary; the
   lemma is stated for `GL₂(F_p)`, **not** `GL₂(F̄_p)`.
10. **Lan's printed cocycle condition for an automorphy factor is wrong.** *An Example-Based
    Introduction to Shimura Varieties* §4.2.7 (p. 49) displays
    `j(γ'γ,Z) = j(γ',Z)j(γ,Z)` alongside the automorphy condition `f(γZ)=j(γ,Z)f(Z)`.
    Composing the latter forces `j(γ'γ,Z) = j(γ',γZ)j(γ,Z)`. Checked twice (whole-document
    and per-page `pdftotext -raw`); Greek letters extract correctly elsewhere in the same
    display, so it is a typo in the source. **The atlas text for `AutomorphicBundles:B4`
    has the correct identity** — no atlas change needed.
11. **`CompletedCohomologyPartII` CC.3 → CC.5 is not readable off the source.** Parts (1)
    (finite generation + canonical topology) and (3) (duality) are two clauses of the single
    Theorem 1.1 of the Calegari–Emerton survey, whose proof is deferred to a paper absent
    from the library. Part (3)'s continuity condition presupposes part (1)'s topology. This
    packet therefore asserts **no** edge between CC.3 and CC.5 and records the question.
12. **Emerton's Cor. 1.2.2 / Thms 1.2.3, 1.2.4 sit downstream of R31.4, not under R31.2.**
    Assigning them to R31.2 would close a cycle R31.2 → R31.3 → R31.4 → R31.2. They are
    placed under R31.6 (where the globalisation audit lives). R31.2 is marked `not_read`.
13. **`ArithmeticGaloisRepresentations:R01.2`'s Weil–Deligne normalisation is unverified,
    not wrong.** Deligne LNM 349 §8.2 as extracted reads `ρ(w)Nρ(w)⁻¹ = q^{v(w)}N`, and
    the displayed identity (8.4.1.1) of Def. 8.4.1 **did not survive text extraction at
    all**; §8.4.2 chooses a *geometric* Frobenius. The stage's assertion
    "with arithmetic Frobenius the relation is `r(F)Nr(F)⁻¹=qN`" is *consistent* with what
    was read but is **not established** by it.
14. **`ArithmeticGaloisRepresentations:G7` and `AutomorphicGaloisRepresentationsPartII:AG2.7`
    check out verbatim against ACC+.** Definition 6.2.29 (enormous), its `p | n`
    impossibility, Lemma 6.2.30, and Definition 4.3.1 (decomposed generic,
    `αᵢ/αⱼ ≠ |O_L/m_L|`, l splitting completely, genericity at every `v|l`) all match the
    stage texts. The only presentational difference: ACC+ bundles unramifiedness into
    "generic"; the atlas states it separately. Same content.

## Shared-supplier requests

- **`SerreWeightAndLevelOptimisation:R20.1` (EXT-13).** Node-level edge offered from
  `R15.4/edixhoven-weight-k-rho-and-its-comparison-with-serre-k`. Output: Edixhoven Thm 4.5 —
  given ρ modular of some type (N,k,ε) with p∤N, an eigenform of type (N,k_ρ,ε) with the
  same T_ℓ eigenvalues for ℓ≠p, and of type (N,k(ρ),ε) when ρ is not exceptional, plus
  minimality of k(ρ). Confirm R20's scope wants this *conditional* optimisation.
- **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1` / `R07.5` (EXT-07).** See
  correction 3. R07.1 is asked to state Raynaud Prop. 3.3.2 in **both** branches.
- **`ModularCurvesPartII:R14.5` (EXT-12).** `EllipticCurveModularity:R29.5` needs the
  weight-two trivial-nebentypus quotient theorem and the normalised Abel–Jacobi map.
  Serre's Thm 4 only gives "E is isomorphic to a quotient of J₀(N)"; the nonconstant
  morphism X₀(N) → E is in no source read here.
- **`WeightsInEtaleCohomology:R34.5` (EXT-03).**
  `AutomorphicGaloisRepresentations:R19.1` currently rests on Deligne Bourbaki 355
  Thm 5.1, which is **conditional on the Weil conjectures** (1969). R34 is asked for the
  unconditional purity statement (Weil I) that replaces it.
- **`HilbertModularVarietiesAndShimuraCurves:R18.4` (EXT-11).** Carayol's Thm (B) depends
  crucially on his companion bad-reduction paper (`R02_SS_CarayolBadReduction.pdf`, in the
  library, unread here). Check R18.4's statement against it before relying on R18.4 → R19.2.
- **`EndoscopicTransferAndUnitaryTraceComparison` ET.4–ET.7 (EXT-11).**
  `AutomorphicGaloisRepresentationsPartII` AG2.1b and AG2.2 are `not_read` here precisely
  because their content is stable base change and endoscopic character identities. This
  job should not duplicate them.
- **`PadicLocalLanglandsForGL2Qp:R30` (EXT-12).** Everything in
  `CompletedCohomologyAndLocalGlobalCompatibility` rests on the Colmez–Kisin p-adic local
  Langlands correspondence, which is **not in the supplied library**. R30 should own it.

## Unresolved cross-job dependencies

- `AutomorphicGaloisRepresentations:R19.1` (this job) must supply Deligne's theorem
  attaching ρ_f to a mod p eigenform; `R15.6` consumes it and does not reprove it.
- `ModularCurvesPartII:R12.6 / R13.4 / R14.3` (EXT-12) supply the compactified curves,
  their cusps and the analytic comparison that `R15.1` consumes. The GAGA comparison was
  not read and is a recorded gap.
- `PotentialAutomorphyInfrastructure:PA.0` (EXT-12) is the declared consumer of
  `AG2.7`'s four export packages; three of its four upstream stages are `not_read` here.

## Sources needed that are absent from the supplied library

Checked against `CATALOGUE.json`, `papers/`, `text/` and `extracted/`:

- Katz, *A result on modular forms in characteristic p*, LNM 601, 53–61 — the construction
  of θ and the identification of ker(q-expansion) with (A−1) are currently unread imports.
- Serre, *Propriétés galoisiennes des points d'ordre fini des courbes elliptiques*,
  Invent. Math. 15 (1972) — the source of the tame-character facts and the Tate-curve theory.
- Mazur, *Rational isogenies of prime degree*, Invent. Math. 44 (1978).
- Ribet, *Images of semistable Galois representations*, Pacific J. Math. (1997). Note also
  that `ADD_RIBET90.pdf` is a scan whose text layer contains only bibliographic metadata.
- Taylor–Yoshida, and Harris–Taylor (the latter is a catalogue entry with no file).
- Calegari–Emerton, *Completed cohomology of arithmetic groups* — catalogue status
  `source_survey_lists_in_preparation_not_counted_acquired`, no file. This is where
  Theorem 1.1 of the survey is proved.
- Colmez's and Kisin's p-adic local Langlands papers.
- Milne, *Canonical models of (mixed) Shimura varieties and automorphic vector bundles* (1990).
- Chenevier's paper defining the partial order `≺` on Weil–Deligne representations
  (cited as "[Ch] §3.1"; the Chenevier file present is the determinants paper, which has
  no such section).
- Shimura, *Introduction to the Arithmetic Theory of Automorphic Functions* — catalogue
  entry with no file (source of the dimension comparison Serre quotes at 3.1.3).
- **`SS_DeligneVarietes.pdf` is present but carries no text layer** (its extracted text file
  is 43 bytes); it needs OCR before `AutomorphicBundles:B1` can proceed.

## Next actions, in order of leverage

1. **Read KW II** (`SS_KW2.pdf`, in the library with extracted text) for Theorems 4.1 and
   5.1. This is the single largest unread boundary in the job and sits under every stage of
   the R27 strand.
2. **Close the p = 2 branch of Serre Prop. 4** using Edixhoven Prop. 8.2 (stated for all p)
   plus Raynaud Rem. 3.3.5 (the biconnected component is prolongation-independent even when
   e = p−1).
3. **Read Emerton §§5–6** (`ADD_EMERTON11.pdf`, in the library) for Theorem 6.2.13 — the
   Banach-space statement that `R31.4`/`R31.5` actually need.
4. **Read Calegari–Geraghty §2** (`calegari-geraghty.pdf`, in the library): it proves the
   finite-generation statement in the form needed downstream and will settle the CC.3/CC.5
   ordering question of correction 11, and supplies the chain-level model CC.4 requires.
5. **Read Lan's thesis** (`R02_Lan_PELCompactifications.pdf`, in the library) for the actual
   construction of canonical/subcanonical extensions and for Hecke actions on the
   compactifications — `AutomorphicBundles` B3 and B5.
6. Convert `SS_Kisin2.dvi` with `dvi2tty` and check its hypotheses against KW I's
   Hypothesis (H).
7. Read `Shin_GaloisCompact.pdf` (in the library) for `AG2.1b`.
8. Re-check Deligne LNM 349 (8.4.1.1) on a printed or image copy to settle correction 13.
