# EXT-03 handoff

Job: EXT-03 — PadicDifferentialEquationsAndRigidCohomology, PadicHodgeTheory,
PerfectoidQuotients, PerfectoidSpaces, TropicalAndBerkovichArithmetic,
WeightsInEtaleCohomology, WeilConjectures. Claimed internally (15 September 2026).
Working order fixed by the orchestrator: PerfectoidSpaces → PerfectoidQuotients →
PadicHodgeTheory → WeilConjectures / WeightsInEtaleCohomology → the rest.
All packets validate with `python3 json.load`; node ids are prefixed by their parent
stage id; every stage of every assigned roadmap appears in coverage; no stage-level
cycle is created by any cross-roadmap link (checked against `data/atlas.json`
`requires`); implementation status is `unchecked` everywhere. Nothing outside
`research/expansion/external/EXT-03/` was edited; nothing was committed.

## Files written (all `status: partial`)

| Packet | Nodes | Links (cross-roadmap) | Gaps | Coverage |
| --- | --- | --- | --- | --- |
| `PerfectoidSpaces.json` | 33 (P0 3, P1 11, P2 8, P3 8, P5 2, P7 1) | 47 (5) | 8 | P0/P1/P2/P3/P5/P7 partial; P4/P6/P8/P9 not_read |
| `PerfectoidQuotients.json` | 12 (Q0:integral-algebra 1, Q0:animated-application 1, Q2 6, Q3 2, Q4 2) | 24 (11) | 7 | Q1 not_read; all others partial |
| `PadicHodgeTheory.json` | 10 (R06.1 1, P8:local-rational 9) | 21 (9) | 6 | R06.1, P8, P8:local-rational partial; 7 stages not_read |
| `WeilConjectures.json` | 6 (WC.1 3, WC.2 1, WC.3 1, WC.6 1) | 8 (3) | 3 | WC.1/2/3/6 partial; WC.0, WC.4, WC.5 (+2 sub-stages), WC.7 not_read |
| `WeightsInEtaleCohomology.json` | 5 (R34.1 1, R34.5 4) | 10 (5) | 3 | R34.1, R34.5 partial; R34.2/3/4/6 not_read |
| `PadicDifferentialEquationsAndRigidCohomology.json` | 2 (RD.2) | 2 (1) | 2 | RD.2 partial (statements only); RD.0/1/3–7 not_read |
| `TropicalAndBerkovichArithmetic.json` | 4 (TB.2 3, TB.5 1) | 3 (0) | 2 | TB.2, TB.5 partial; TB.0/1/3/4/6/7 not_read |

Total: 72 nodes, 115 links, 31 gaps.

## Sources actually read (all hashes match the library catalogue unless noted)

- Scholze, *Perfectoid spaces*, arXiv:1111.4914v1 — §§3–7 in full with proofs
  (perfectoid fields, almost mathematics, tilting equivalence Thm 5.2/5.10/5.17,
  finite étale Thm 5.25 and Thm 3.7, sheaf theorem 6.3 with Lemma 6.4 and the
  approximation Lemma 6.5, Prop. 6.10–6.14, 6.17–6.18, étale topology 7.1–7.13,
  almost purity Thm 7.9, tilde-limits 7.14–7.19).
- Scholze, *Étale cohomology of diamonds* (Astérisque-volume version; library copy
  `inputs/.../EtCohDiamonds.pdf`, text extracted with pdftotext into the scratch
  directory) — §3 (3.1–3.24 with the proofs given there), §5 (5.7–5.9), §6 (6.1–6.5
  with the proofs of 6.4 and 6.5).
- Gabber–Ramero, *Almost ring theory*, arXiv:math/0201175v3 — statements only of
  every result Scholze cites (2.4.18, 2.5.36, 3.2.9, 3.2.16, 3.5.13, 3.5.28, 4.1.14,
  5.3.24/5.3.27, 5.4.21/5.4.42/5.4.54, 6.3.6, 6.6.2, 6.6.6). Numbering differs from
  the LNM 1800 book: book 5.4.53 = arXiv 5.4.54; book "2.5.36" and "6.5.13" were not
  located in the arXiv text.
- Bhatt–Scholze, *Prisms and prismatic cohomology*, arXiv:1905.08229v4 — §7 in full
  with proofs; Lemma 4.8 and Lemma 3.9 with proofs; statements of 3.5, 3.8, 3.10, 6.3,
  2.39, 2.42, 2.31, 2.34, 8.1–8.2. BMS2 (arXiv:1802.03261v2) Definitions 4.10, 4.18,
  Prop. 4.19, Def. 4.20, Remarks 4.21–4.22.
- Scholze, *p-adic Hodge theory for rigid-analytic varieties* — Lemma 3.18, §4
  (4.1–4.12; Prop. 4.8 statement only), Lemma 5.5, §6 (6.1–6.20) with proofs; the
  erratum in full (corrected covers, removed point descriptions, corrected OB_dR^+ and
  the strengthened Prop. 6.10).
- Deligne, *Weil I* — §1 (1.1)–(1.14) with the proof of (1.7)⇒(1.6). Deligne, *Weil II*
  — §1.2 in full; §3.3 (3.3.1 with proof, 3.3.2–3.3.11 with proofs); §3.4 (3.4.1,
  3.4.2–3.4.4 with proofs, proof of 3.4.1(iii)). SGA 4½ — Rapport §3 (Thms 3.1–3.2,
  Prop. 3.3 with proof, Cor. 3.4), Thm 4.10 statement; Cycle §3 (3.1–3.8).
- Kedlaya, *A p-adic local monodromy theorem*, arXiv:math/0110124v4 — §§1.1–1.4 only
  (scratch download, sha256 recorded in the packet; not in the catalogue).
- Baker–Payne–Rabinoff, *On the structure of nonarchimedean analytic curves*
  (arXiv:1404.0279v1) — §3 with proofs, Thm 4.22 statement; *Nonarchimedean geometry,
  tropicalization, and metrics on curves* (arXiv:1104.0320v3) — introduction, Thms
  1.1–1.4 statements. Scratch downloads; sha256 recorded; not in the catalogue.

Not opened: Kedlaya–Liu foundations, Fontaine *Perfectoïdes*, Hansen–Johansson,
Scholze–Weinstein Berkeley notes, Berger, Kedlaya math/0208027 and math/0210149,
Chambert-Loir, SGA 7 II, Huber 1996 (all present in the library or scratch).

## Corrections and findings affecting existing stage statements

1. **PerfectoidSpaces P3/P5 reversed dependency.** The atlas puts the Gabber–Ramero
   henselian finite-étale approximation (Sch12 Prop. 7.4 / Lemma 7.5) in P5, but the
   almost purity proof (Thm 7.9(ii), stage P3) and Prop. 7.6 use Lemma 7.5(i)–(ii).
   The node is filed under P3 (`P3/henselian-finite-etale-approximation`) and exported to
   P5/P7; the stage texts of P3 and P5 should be adjusted (gap recorded).
2. **Field-based proofs vs Tate-ring statements.** Every theorem in Sch12 is proved over
   a perfectoid base field K. ECD 3.12/3.13/3.17/3.18/3.24/6.1 assert the perfectoid-Tate-
   ring versions with "the proof works in general" / "[KL15]"; the untilt classification
   (ECD 3.17) has no written proof in either source. P1/P2/P3 nodes carry this boundary
   explicitly; KL15 §3.6 and Fontaine's Bourbaki talk are the next sources.
3. **PerfectoidQuotients Q0:integral-algebra vs PR.0 direction.** Lemma 4.8 (perfect prism
   initial over its perfectoid ring) depends on PR.0 material, so it cannot sit in
   Q0:integral-algebra (which PR.0 requires); it is filed under Q0:animated-application.
4. **Theorem 7.4's printed proof** leaves three reductions implicit (filtered colimits to
   finitely generated ideals; induction to principal ideals; base change of
   perfectoidization along André's faithfully flat extension and descent of surjectivity).
   Stage Q4's text already demands the first; the third has no source passage in §7 and
   is a recorded gap (BS22 §8 is the likely source).
5. **Remark 7.5 / ECD 5.8** needs R⁺ (open integrally closed in a perfectoid Tate ring) to
   be integral perfectoid for (R⁺/(I∩R⁺))^∧ to be semiperfectoid; this comparison is
   exactly Q0:integral-algebra's missing content. ECD's remark "S⁺ → R⁺ is almost
   surjective" is a probable misprint for R⁺ → S⁺.
6. **P8:local-rational** asks for crystalline/semistable relative period sheaves; Scholze's
   paper constructs only A_inf, B_inf, B_dR^±, OB_dR^±. A source must be chosen (Brinon or
   Tan–Tong). The connection on the *corrected* OB_dR^+ is not restated in the erratum.
7. **Weil conjectures**: the exact functional equation is not derived in any passage read
   (Deligne cites Grothendieck); the trace formula (Rapport 3.2 ← 4.10) is imported. The
   atlas supplier `UPSTREAM:CohomologicalPointCounting:TraceFormula` does not exist as a
   stage record in `data/atlas.json`.
8. **WC.6 / R34.5 vs DWP.7–8.** Weil II 3.3.1–3.3.9 and 3.4.1 are owned by DWP.7/DWP.8
   (EXT-02, no packet yet); the R34.5/WC.6 nodes record the source statements and the
   proof parts read and are marked as relocation candidates.

## Supplier requests (cross-roadmap links made, scope checked against atlas descriptions)

- `AdicEtaleGeometry:A0` → P2 fibre products (completed tensor product of Huber pairs);
  `AdicEtaleGeometry:A1` → P3 (Huber's finite étale/étale theory for tft algebras) and
  P8:local-rational (corrected pro-étale covers).
- `DiamondsAndVStacks:D0` → P2 sheaf theorem (Čech-to-sheaf comparison, not written in Sch12).
- `AdicSpacesPartII:R3` → P2 p-finite acyclicity (Tate acyclicity only; BGR boundedness
  statements 6.2.4/7.3.2 have no supplier — gap).
- `DerivedDeRhamCohomology:DD.0` → P1 cotangent-complex vanishing and Q2 derived prismatic
  cohomology; `DD.1` → Q2 initial prism; `DD.5` → Q3 quasisyntomic covers;
  `EnhancedDerivedSheaves:E5:animation` → Q2 left Kan extension.
- `PrismaticCohomology:PR.0/{rigidity-prism-ideal, perfect-prisms-perfectoid-rings,
  regular-prismatic-envelopes}` (existing draft nodes) → PerfectoidQuotients nodes;
  `PrismaticCohomology:PR.1` (stage) → Q2 (Hodge–Tate comparison; no PR.1 HT node exists).
- `AInfCohomology:AI.0:integral` → R06.1 B_dR^+ node; AI.3 has no nodes yet for Ô_X^+ /
  A_inf (two P8 nodes are relocation candidates).
- `DeligneWeightsAndPurity:DWP.0/DWP.4/DWP.7/DWP.8`, `EtaleDualityAndPerverseSheaves:EDC.2`
  → Weil packets as recorded.
- Consumer links: P8:local-rational Poincaré lemma → `CohomologyComparisons:CP.3`;
  RD.2 monodromy statement → `PadicHodgeTheory:R06.3`; `PerfectoidSpaces:P4` → Q4 Zariski
  closed node (direction chosen to respect P4 → Q4 → P8).

## Unresolved cross-job dependencies

- EXT-02 (DWP, EDC, LPV, AdicEtaleGeometry, AdicSpacesPartII, ClassicalAdicEtaleCohomology):
  packets absent; all links to their stages are to stage ids, not nodes.
- Internal drafts: PrismaticCohomology lacks PR.1 Hodge–Tate and all PR.2 nodes;
  AInfCohomology lacks AI.0/AI.3 nodes; CohomologyComparisons has no packet.
- `UPSTREAM:*` ids referenced by the atlas (ECD:ADIC, ECD:BASE, CohomologicalPointCounting:*)
  are not stage records; links to them were not made.

## Next actions

1. PerfectoidSpaces: read KL15 §3.6 (Tate-ring tilting, untilts, sheafiness), GR §5.3/§5.4
   proofs, Hub96 §§1.6–1.7/2.4, BGR 6.2.4/7.3.2/8.2.1; then P4 (ECD §5), P6 (ECD 6.4(iv),
   7.9–7.11, 4.2–4.4), P7 (torsion paper II.1–II.2), P8 (Hansen–Johansson §5).
2. PerfectoidQuotients: BS22 §8 (base change of perfectoidization, arc descent) to close the
   Theorem 7.4 gaps; BMS1 §3 for R⁺ integral perfectoid; BS22 §§4.2–6 for Q1.
3. PadicHodgeTheory: choose and read a crystalline period-sheaf source; Scholze §5 (primitive
   comparison) and §7–8 for P8's proper suffix; Fontaine/Berger for R06.1–R06.3 and P7.
4. Weil: Rapport §§4–6, Weil II 1.6–1.8 and 3.1–3.2, SGA 7 XXI §5, a source for the
   functional equation.
5. RD/TB: Kedlaya Chapters 2–6; BPR14 §4 and BPR16 §§4–5; Chambert-Loir §§2–4; register the
   scratch downloads in the catalogue.
