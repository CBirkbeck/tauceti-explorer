# EXT-05 handoff — Diamonds and geometric Langlands (batch 2)

Job: `EXT-05` in `research/expansion/EXTERNAL_AGENTS.md`.
Roadmaps: `GeometricSatakeAndFusion`, `HeckeStacksAndLocalShtukas`,
`LanglandsParameterStacks`, `RelativeFarguesFontaine`,
`VStackSheavesAndLisseCategories`, `VectorBundlesAndIsocrystals`.

Status: in progress. This file is updated after each packet.

## Files written (this directory)

| File | Nodes | Links | Coverage rows | Gaps | Packet status |
| --- | --- | --- | --- | --- | --- |
| `RelativeFarguesFontaine.json` | 24 | 15 | 11 | 5 | partial |
| `VectorBundlesAndIsocrystals.json` | 23 | 23 | 10 | 5 | partial |
| `VStackSheavesAndLisseCategories.json` | 21 | 20 | 6 | 5 | partial |

All stage coverage rows are `partial`; no stage is claimed `source_decomposed`.
Every node carries `implementationStatus: "unchecked"`. No Lean work was done and
no proof tickets are claimed.

## Sources actually read

Read means: the passage was opened and the statement/proof inspected, with the
printed page recorded. PDFs and extracted text stay outside this repository.

- **Fargues–Scholze, *Geometrization of the local Langlands correspondence***,
  author-hosted 356-page PDF (MPIM Bonn), sha256
  `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
  PDF page number equals printed page number throughout the body.
  Read: Chapter II preamble pp. 45–47; II.1 pp. 47–57 (Prop. II.1.1 through
  Def./Prop. II.1.22, including the proofs of II.1.1–II.1.4, II.1.8–II.1.12);
  II.2 preamble p. 57 (Stein exhaustion, Prop. II.2.1); II.2.1 pp. 58–61
  (Prop. II.2.2–Cor. II.2.4); II.2.2 pp. 62–64 (Prop. II.2.5 and proof);
  II.2.3 pp. 64–68 (Thm. II.2.6 with its full quantitative proof, Prop. II.2.7
  GAGA with proof, Rem. II.2.8, Prop. II.2.9, Prop. II.2.10);
  III.3 pp. 97–99 (Prop. III.3.1, Lemma III.3.2, Rem. III.3.3, Lemmas III.3.4–5);
  VI.0 p. 190 (Thm. VI.0.2, Prop. VI.0.3) and VI.1 pp. 190–195
  (Def. VI.1.1 – Prop. VI.1.12, with proofs).
- **Scholze–Weinstein, *Berkeley Lectures on p-adic Geometry***, Annals of
  Mathematics Studies 207, PDF dated "March 27, 2020", sha256
  `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`.
  Printed page = PDF page − 10. Read: Thm. 5.2.8, Lemma 5.2.9 and the remark
  after it, Def. 5.3.1–Prop. 5.3.3 (pp. 38–39); Lemma 6.2.8, Def. 6.2.9,
  Lemma 6.2.10, Thm. 6.2.11, Def. 6.3.1, Ex. 6.3.2 (pp. 46–47);
  Prop. 19.1.2 with proof, Rem. 19.1.3, Lemma 19.1.4 (pp. 170–171);
  Thm. 19.5.2 with proof and Prop. 19.5.3 with proof (pp. 179–181).
- **Bhatt–Morrow–Scholze, *Integral p-adic Hodge theory***, library PDF, sha256
  `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a`.
  Read: Lemma 3.10 (i)–(ii) with proof, Lemma 3.21 (article pp. 22–24), because
  FS II.1.1 imports them for integral perfectoidness.
- **Gabber–Ramero, *Almost ring theory***, library copy is
  **arXiv:math/0201175v3, "sixth (and final) release", 22 July 2002**, sha256
  `c4ab39ad5cd3f95f12a4c2f1f100f0c9f91578c6cbe2085a1962d111df8d7dc8` — **not**
  the Springer LNM 1800 (2003) edition that Fargues–Scholze cite as `[GR03]`.
  Read: contents (PDF p. 2), Prop. 5.4.21 (PDF p. 121), Thm. 5.8.14 and
  Claims 5.8.15–5.8.16 (PDF p. 148).

Verified present in the library but **not read** (so their contents are
`unchecked`): `KedlayaLiu_RelativePadicHodgeFoundations.pdf`,
`KedlayaLiu_ImperfectPeriodRings.pdf`, `FarguesFontaine_Courbes.pdf`,
`Zhu_MixedCharacteristicSatake.pdf`, `Zhu_CoherentParameterSheaves.pdf`,
`DatHelmKurinczukMoss_Parameters.pdf`, `Kottwitz_Isocrystals.pdf`,
`Kottwitz_IsocrystalsII.pdf`, `BhattScholze_WittAffineGrassmannian.pdf`,
`Scholze_CondensedMathematics.pdf`, `Scholze_CondensedAnalyticGeometry.pdf`,
`LiuZheng_EnhancedSixOperations.pdf`.

Title/edition of every PDF above was checked on its own first page before use.

## Corrections to existing statements

1. **`RelativeFarguesFontaine` roadmap text has no stage covering the classical
   points of `Y_C`/`X_C`.** FS II.1.6–II.1.14 and Def./Prop. II.1.22 (classical
   points, bijection with untilts, `Spm(B) = |U|^cl`, the principal-ideal-domain
   property of `B`, and Lemma II.1.14's point with surjective inertia used later
   in IV.7.3) are genuine prerequisites of `VectorBundlesAndIsocrystals:VB2:classification`
   and of Drinfeld's lemma, but appear in no RF stage description. Recorded as a
   gap in `RelativeFarguesFontaine.json`; decomposed in the
   `VectorBundlesAndIsocrystals` packet rather than duplicated.
2. **`[GR03, Proposition 5.4.21]` does not match the library copy.** See the gap
   of that name in `RelativeFarguesFontaine.json`. In the 2002 arXiv numbering,
   5.4.21 is a henselian-approximation density statement; the torsor lifting and
   descent results are in §5.8. Anyone reproving FS VI.1.7 must resolve the
   edition before treating the local-triviality step as available.

## Shared-supplier requests / proposed cross-roadmap edges

- **`FarguesFontaineDiamonds:F4` → `RelativeFarguesFontaine:RF2:untilts`**
  (proposed in `RelativeFarguesFontaine.json` `links`). `F4`'s own description
  says it owns "the fixed-field case of FS II.1.4", including the
  maximum/annulus boundary estimate for multiplication by the primitive
  generator. That is exactly the input FS's proof of II.1.4 reduces to
  ("this question immediately reduces to the case that S is a geometric point",
  printed p. 50). The analogous edge `F4 → RF3` already exists in `data/atlas.json`;
  the edge into `RF2:untilts` does not. **`FarguesFontaineDiamonds` belongs to
  EXT-04** — this is a request to that job's owner, not a unilateral change.

## Unresolved cross-job dependencies

- Fargues' `[Far20b]` ("Simple connexité des fibres d'une application
  d'Abel–Jacobi et corps de classes local") is **absent from the supplied
  library**. FS use it for Remark VI.1.3 (geometric-fibre criterion for
  `Div^d`), Remark II.1.20 and Corollary II.2.4. Needed by `RF2:integral-divisors`
  and `RF2:untilts`; also likely needed by EXT-04's `FarguesFontaineDiamonds`
  and `BunGAndNewtonStrata` (`[Far20a, Théorème 7.1]` is cited in FS III.3.1).
- Hansen–Kedlaya's sheafiness-criteria paper (`[HK20]` in FS II.1.1) was not
  found in the library; searched `CATALOGUE.json`, `diamonds_fargues.json` and
  the `papers/` listing.

## Next actions

1. `VectorBundlesAndIsocrystals` packet (FS II.2.2–II.2.5, II.2.9–II.3, Kottwitz).
2. `VStackSheavesAndLisseCategories` packet (FS IV.1, IV.2, IV.4, IV.5, V, VII).
3. `GeometricSatakeAndFusion` packet (FS VI.1–VI.12, Zhu, Bhatt–Scholze).
4. `HeckeStacksAndLocalShtukas` packet (FS IX.2–IX.3, VI.8–VI.9).
5. `LanglandsParameterStacks` packet (FS VIII, DHKM, Zhu).
