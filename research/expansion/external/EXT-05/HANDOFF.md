# EXT-05 handoff — Diamonds and geometric Langlands (batch 2)

Job: `EXT-05` in `research/expansion/EXTERNAL_AGENTS.md`.
Roadmaps: `GeometricSatakeAndFusion`, `HeckeStacksAndLocalShtukas`,
`LanglandsParameterStacks`, `RelativeFarguesFontaine`,
`VStackSheavesAndLisseCategories`, `VectorBundlesAndIsocrystals`.

All six packets are written. Every packet status is `partial`; every stage
coverage row is `partial` except one honestly marked `not_read`
(`GeometricSatakeAndFusion:GS4:classical-Satake-comparison`). Every node carries
`implementationStatus: "unchecked"`. **No Lean work was done, no sorries were
introduced, and no executable proof ticket is claimed.** No file outside this
directory was created or modified; nothing was committed or pushed.

## Files written (this directory)

| File | Nodes | Links | Coverage rows | Gaps | Packet status |
| --- | --- | --- | --- | --- | --- |
| `RelativeFarguesFontaine.json` | 24 | 15 | 11 | 5 | partial |
| `VectorBundlesAndIsocrystals.json` | 23 | 23 | 10 | 5 | partial |
| `VStackSheavesAndLisseCategories.json` | 21 | 20 | 6 | 5 | partial |
| `GeometricSatakeAndFusion.json` | 23 | 24 | 14 | 5 | partial |
| `HeckeStacksAndLocalShtukas.json` | 13 | 13 | 5 | 5 | partial |
| `LanglandsParameterStacks.json` | 16 | 17 | 8 | 5 | partial |
| **Total** | **120** | **112** | **54** | **30** | |

Validated with `python3`: all six parse; all 54 owning stages of the six
roadmaps appear in `coverage` with no extras; every `parentStageId` is a real
`data/atlas.json` stage id; every node id is namespaced under its own roadmap;
every `sourceId` resolves inside its packet; the 112 proposed links are acyclic,
and adding the one proposed cross-roadmap edge to `data/atlas.json`'s 3508
`stageEdges` leaves that graph acyclic too.

## Sources actually read

"Read" means the passage was opened and the statement — and, where the packet
says so, the proof — was inspected, with the printed page recorded. PDFs and
extracted text stay outside this repository; only bibliographic metadata,
hashes, locators and short verification excerpts are recorded in the packets.

- **Fargues–Scholze, *Geometrization of the local Langlands correspondence***,
  author-hosted 356-page PDF (MPIM Bonn), sha256
  `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
  PDF page = printed page throughout the body. Read: **II.1** pp. 47–57 in full;
  **II.2** pp. 57–75 in full (including the complete quantitative proof of
  Thm. II.2.6, the GAGA proof II.2.7, the classification proof II.2.14 and the
  key Lemma II.2.15, the contracting-action Lemma II.2.17, and Thm. II.2.19);
  **II.3** pp. 75–83 (II.3.1–II.3.8); **III.3** pp. 97–99; **IV** intro p. 107;
  **IV.1** pp. 107–114 in full; **IV.2.1–IV.2.2** pp. 114–118; **IV.2.3.3**
  pp. 124–125 (Thm. IV.2.23 with proof); **IV.2.4** pp. 129–130; **IV.4** intro
  pp. 134–135; **IV.5** pp. 151–155 (Thm. IV.5.3 with full proof); **V.0–V.2**
  pp. 167–172; **V.4–V.7** pp. 177–186; **VI.0–VI.4** pp. 187–209; **VI.6**
  pp. 211–215; **VI.7** pp. 215–224; **VI.8–VI.9** pp. 224–230; **VI.10**
  pp. 230–231; **VI.11–VI.12** pp. 235–239; **VII** intro pp. 243–245; **VII.1**
  p. 245; **VII.6** pp. 268–271; **VII.7** pp. 271–272; **VIII.0–VIII.1**
  pp. 277–281 (Thm. VIII.1.3 with full proof); **VIII.3** pp. 285–290;
  **VIII.4** pp. 290–291 (statements); **VIII.5.1** pp. 293–296; **VIII.5.3**
  pp. 301–308; **IX.0–IX.3** pp. 317–325; **IX.5.1** pp. 327–328; **IX.6.1–IX.6.3**
  pp. 328–329.
- **Scholze–Weinstein, *Berkeley Lectures on p-adic Geometry***, Annals of
  Mathematics Studies 207, PDF dated "March 27, 2020", sha256
  `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`.
  Printed page = PDF page − 10. Read: Thm. 5.2.8, Lemma 5.2.9 and the remark
  after it, Def. 5.3.1–Prop. 5.3.3 (pp. 38–39); Lemma 6.2.8, Def. 6.2.9,
  Lemma 6.2.10, Thm. 6.2.11, Def. 6.3.1 (pp. 46–47); Prop. 19.1.2 with proof,
  Rem. 19.1.3, Lemma 19.1.4 (pp. 170–171); Thm. 19.5.2 and Prop. 19.5.3, both
  with proofs (pp. 179–181); Def. 23.1.1, Rem. 23.1.2–23.1.3, Thm. 23.1.4
  (pp. 216–217).
- **Fargues–Fontaine, *Courbes et fibrés vectoriels en théorie de Hodge
  p-adique***, 400-page book PDF (published as Astérisque 406), sha256
  `cc159f38a3801c736b71ecea363496abe7706550bfb416600718ee9933922ca3`.
  Printed page = PDF page − 10. Read: §5.5 Harder–Narasimhan formalism
  (Thm. 5.5.4, Def. 5.5.5, Prop. 5.5.6, examples 5.5.2.1–5.5.2.3), printed
  pp. 212–215; §8.2.3–8.2.4 (Def. 8.2.5, Prop. 8.2.6, Def. 8.2.7, Prop. 8.2.8
  with proof, the E′|E adjunction, Rem. 8.2.9, Thm. 8.2.10), printed pp. 286–288.
  **Attribution caution:** printed pp. 1–50 of this volume are Pierre Colmez's
  preface, *not* Fargues–Fontaine's text; the Dieudonné–Manin statement at
  printed p. 26 is Colmez's recollection and is cited as such.
- **Bhatt–Scholze, *Projectivity of the Witt vector affine Grassmannian***,
  arXiv:1507.06490v3, sha256
  `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e`.
  Read: §1.1–1.3 (Thms. 1.1–1.3, Rem. 1.4, outline) pp. 1–3; Thm. 6.8 with proof
  p. 23; §8.1 (Def. 8.1, Thms. 8.2, 8.3, strategy) and §8.4 (proof of Thm. 8.3)
  pp. 32–35.
- **Keel, *Basepoint freeness for nef and big line bundles in positive
  characteristic***, Annals 149 (1999) 253–286; library copy arXiv:math/9901149v1
  with Annals pagination, sha256
  `2ec4141aea36ad77e5b504f01617ffbbe17de0af27f8b2c5f4a1f4ee6afde398`.
  Printed page = PDF page + 252. Read: 0.0–0.3 (pp. 253–254) and 1.7, 1.8, 1.9
  with proofs (pp. 262–263).
- **Dat–Helm–Kurinczuk–Moss, *Moduli of Langlands parameters***,
  arXiv:2009.06708v3, sha256
  `70b647bb5fbf924f20784a5084f7f38c9a2faf88e04690f38d76fc0be2a3213c`.
  Read: abstract and contents p. 1; introduction pp. 2–3; Thms. 1.3 and 1.4 p. 6.
- **Scholze, *Lectures on Condensed Mathematics***, sha256
  `d422561285f3025a53ee71a497d350fc89afaefe28053de78e2255b2d521c69d`.
  Read: Def. 5.1 with Rems. 5.2–5.3 (p. 33), Prop. 5.7 statement (p. 34),
  Thm. 5.8 and Lemma 5.9 (pp. 35–36).
- **Scholze–Weinstein, *Moduli of p-divisible groups***, arXiv:1211.6357v2,
  sha256 `984411ef6c3d735a713684d4c9251fbad411a40eab33cefed8ab5c8412b09f6d`.
  Read: Thm. A with Rem. 1.0.1 (p. 3), Prop. 3.1.3 with proof (p. 22), §3.5 and
  Lemma 3.5.1 with proof (p. 29).
- **Bhatt–Morrow–Scholze, *Integral p-adic Hodge theory***, sha256
  `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a`.
  Read: Lemma 3.10 (i)–(ii) with proof and Lemma 3.21 (article pp. 22–24).
- **Gabber–Ramero, *Almost ring theory***, sha256
  `c4ab39ad5cd3f95f12a4c2f1f100f0c9f91578c6cbe2085a1962d111df8d7dc8`.
  Read: contents (PDF p. 2), Prop. 5.4.21 (PDF p. 121), Thm. 5.8.14 with
  Claims 5.8.15–5.8.16 (PDF p. 148). See correction 3 below.

Title, authorship and edition of every PDF above were checked on its own first
page before any content was used.

**Verified present in the library but NOT read** (their content is therefore
`unchecked` in the packets): `Zhu_MixedCharacteristicSatake.pdf`
(arXiv:1407.8519v3), `Zhu_CoherentParameterSheaves.pdf` (arXiv:2008.02998v3),
`KedlayaLiu_RelativePadicHodgeFoundations.pdf`, `KedlayaLiu_ImperfectPeriodRings.pdf`,
`Kottwitz_Isocrystals.pdf` and `Kottwitz_IsocrystalsII.pdf`,
`LiuZheng_EnhancedSixOperations.pdf`, `Scholze_CondensedAnalyticGeometry.pdf`,
`BhattScholze_Prisms.pdf`. **Searched for and NOT found** in the library
(searched `CATALOGUE.json`, `diamonds_fargues.json`,
`additional_round02_diamonds_sources.json` and the `papers/` listing):
Fargues `[Far20b]`/`[Far20a]`, Hansen–Kedlaya `[HK20]`, Rapoport–Zink `[RZ96]`,
and every modular-representation input of FS VIII.5 (Donkin, Mathieu, Kempf,
Koppinen, Touzé–van der Kallen, Prasad–Yu).

**Note on the Kottwitz files.** `Kottwitz_Isocrystals.pdf` was confirmed to be
*Isocrystals with additional structure*, Compositio 56 (1985) 201–220 (Numdam
scan). Its text layer is a lossy OCR in which displayed formulas are mangled
(`03A6` for Φ, dropped equations). It was therefore **not** used for any precise
statement, and `VectorBundlesAndIsocrystals.json` cites Fargues–Fontaine §8.2.3
for the isocrystal category and the division algebra instead.

## Corrections to existing statements

1. **`RelativeFarguesFontaine` has no stage covering the classical points of
   `Y_C`/`X_C`.** FS II.1.6–II.1.14 and Def./Prop. II.1.22 (classical points, the
   bijection with untilts, `Spm(B) = |U|^cl`, the principal-ideal-domain property
   of `B`, and Lemma II.1.14's point with surjective inertia used later in IV.7.3)
   are genuine prerequisites of `VectorBundlesAndIsocrystals:VB2:classification`
   and of Drinfeld's lemma, but appear in no RF stage description. Decomposed in
   `VectorBundlesAndIsocrystals.json` (node
   `…:VB2:classification/classical-points-and-principal-ideal-domains`) rather
   than duplicated; flagged as a gap in `RelativeFarguesFontaine.json`.
2. **Dimension normalisation differs between the two parameter-moduli sources.**
   FS Thm. VIII.1.3 states *relative* dimension `dim G` over `Z_ℓ`; DHKM Thm. 1.3
   states *pure absolute* dimension `dim Ĝ` and warns explicitly that
   `dim Ĝ = dim G + 1` "since the base scheme of Ĝ has dimension 1". These agree
   once the base is accounted for, but a restatement must say which it uses.
   DHKM additionally assert **reducedness**, which FS VIII.1.3 does not.
   Recorded in `LanglandsParameterStacks.json`.
3. **`[GR03, Proposition 5.4.21]` does not match the library copy.** FS's proof of
   VI.1.7 concludes étale-local triviality of `G`-torsors over `B⁺` by citing the
   Springer LNM 1800 (2003) edition of Gabber–Ramero. The library copy is
   arXiv:math/0201175v3, the 2002 "sixth (and final) release"; in *that*
   numbering, Prop. 5.4.21 (PDF p. 121) is a henselian-approximation density
   statement, while the torsor lifting/descent results are §5.8 (Thm. 5.8.14,
   PDF p. 148, which "resumes the assumptions of proposition 5.4.21"). The
   editions plausibly renumber. Anyone reproving FS VI.1.7 must resolve this
   before treating the step as available. Recorded in
   `RelativeFarguesFontaine.json`.
4. **`GS4:classical-Satake-comparison` has no source in FS Chapter VI.** The
   chapter's twelve sections were listed and inspected; it ends at VI.12 (the
   Chevalley involution) and contains no Frobenius-trace/spherical-Hecke-function
   comparison. The stage is marked `not_read` with candidate sources named.
5. **A locator in the `VB3:positive-basic-examples` stage text may be off.** It
   says to use "II.2.15's endomorphism analysis". In the version read, II.2.15 is
   the key extension lemma, whose *proof* contains the classification of
   `E`-linear endomorphisms of `(A¹)^♦`. Flagged for the reviewer in case a
   different numbering was intended.
6. **HN-polygon convention is not pinned across sources.** FS describe the polygon
   as the convex hull of the `(i,dᵢ)` and state *upper* semicontinuity; the
   Fargues–Fontaine volume records that the HN polygon "est concave". The two
   were not reconciled in anything read, and the isocrystal functor additionally
   reverses slopes. A live normalisation risk for any consumer comparing a Newton
   polygon with an HN polygon. Recorded in `VectorBundlesAndIsocrystals.json`.

## Shared-supplier requests / proposed cross-roadmap edges

Exactly one cross-roadmap edge is proposed; every other one of the 112 links is
internal to the roadmap that owns both endpoints.

- **`FarguesFontaineDiamonds:F4` → `RelativeFarguesFontaine:RF2:untilts`**
  (in `RelativeFarguesFontaine.json` `links`). `F4`'s own description in
  `data/atlas.json` says it owns "the fixed-field case of FS II.1.4", including
  "the maximum/annulus boundary estimate to obtain the lower bound for
  multiplication by the primitive generator", and adds "These analytic estimates
  are owned here." That is exactly what FS's proof of II.1.4 reduces to: after
  the Shilov-boundary and tilting reductions it notes "this question immediately
  reduces to the case that `S` is a geometric point" (printed p. 50).
  `RF2:untilts` needs that estimate in the relative and ramified case. The
  analogous edge `F4 → RF3` already exists in `data/atlas.json`; the edge into
  `RF2:untilts` does not. **`FarguesFontaineDiamonds` is EXT-04's roadmap — this
  is a request to that job's owner, not a unilateral change.** Adding it keeps
  the stage graph acyclic (checked).

Supplier stages inspected and **deliberately not** linked, to avoid duplicating
another worker's stage: `BunGAndNewtonStrata:BG0/BG2/BG3` and
`DiamondSixOperations` (EXT-04), `EtaleDualityAndPerverseSheaves:EDC.4–EDC.7`
(EXT-02), `SmoothRepresentationsOfLocalGroups:SR.0–SR.4`,
`ReductiveGroupsPartII`, `EnhancedDerivedSheaves:E5`. Where their results are
consumed (e.g. FS IV.1.19 and IV.1.22 on `Bun_G`, used in the proof of V.7.1),
the packets record them as *cited inputs with locators* inside `gaps`, not as
new nodes.

## Unresolved cross-job dependencies

- **Fargues' `[Far20b]`** ("Simple connexité des fibres d'une application
  d'Abel–Jacobi et corps de classes local") is **absent from the library**. FS
  use it for Rem. VI.1.3 (the geometric-fibre criterion for `Div^d`),
  Rem. II.1.20 and Cor. II.2.4. Also likely needed by EXT-04
  (`[Far20a, Théorème 7.1]` is cited in FS III.3.1).
- **FS IV.6 (hyperbolic localization / Braden) and IV.7 (Drinfeld's lemma)** are
  unread and are imported by three of my roadmaps (VS1, GS1/GS3, HS1). FS
  themselves caution in the Chapter IV introduction: "The theme here is the idea
  `π₁((Div¹)^I) = W_E^I`. Unfortunately, we know no definition of `π₁` making this
  true." Whoever reads them should record the result for EXT-04 as well, since
  `DiamondSixOperations` also consumes IV.6.
- **FS VII.2–VII.5** (the solid four/five operations, Prop. VII.5.2) are unread
  and carry both the `D_lis` machinery (VS2/VS3) and the Hecke construction (HS1).
- **FS VIII.4** (excursion operators, Thm. VIII.4.1) was read only at statement
  level; the creation/annihilation triangle identities that `HS4` requires have
  **no located source statement** in FS IX and may have to be supplied from VIII.4.
- **FS Chapter X** (spectral action) is unread; `LP4`'s consumer contract — that
  the `ℓ ∤ |π₁(Ĝ)_tors|` restriction "belongs to its consumer" — is therefore
  unchecked. `ExcursionOperatorsAndSpectralAction` is EXT-04's roadmap.
- **FS IX.6** is written in terms of spectral/geometric Bernstein centres. Per the
  `HS4` stage text, only the *geometry* of those diagrams was recorded here; the
  parameter identities belong to ES6–ES7 (EXT-04). If EXT-04 decomposes IX.6, the
  geometric half recorded here should not be duplicated.

## Next actions, in priority order

1. Read **FS IV.6 and IV.7** (printed pp. 155–166). Highest leverage: unblocks
   `VS1`, `GS1`, `GS3` and `HS1` simultaneously, and is shared with EXT-04.
2. Read **FS VII.2–VII.5** (printed pp. 252–268). Unblocks `VS2`, `VS3`, `HS1`.
3. Read **FS VIII.5.2's proof** (printed pp. 296–301). Unblocks `LP2:integral-invariants`
   and `LP4`, which currently rest on read statements with unread proofs.
4. Read **Bhatt–Scholze §§2–7 and 8.2–8.3** and **Keel §§1–2**. Unblocks
   `GS0:Witt-geometry`, whose line bundle `L` is currently a read statement with
   an unread construction.
5. Read **Berkeley Lectures 23.2–24** for `HS2`, and **Zhu (both papers)** for
   `GS0:Witt-geometry`, `GS4:classical-Satake-comparison` and `LP1`.
6. Obtain Fargues `[Far20b]` and the FS VIII.5 modular-representation inputs
   (Jantzen Part II ch. 4 covers most of them).
