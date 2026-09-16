# Handoff: DESIGN-LV (MordellLawrenceVenkatesh)

## Outputs

- `research/blueprint/roadmaps/MordellLawrenceVenkatesh.json`: new roadmap, group `diophantine`, status `draft`,
  twelve layers LV.0–LV.11. Stage `requires` lists name the exact supplier stages, including Tau Ceti upstream
  stages; they are computed from the prerequisites and requests of the packet nodes, so roadmap and packet agree.
- `research/blueprint/packets/MordellLawrenceVenkatesh.json`: blueprint packet, `part: null`, status `partial`.
  `python3 scripts/check_blueprint.py research/blueprint/packets/MordellLawrenceVenkatesh.json` reports
  0 errors and 0 warnings (run with `TAUCETI_BASELINE` pointing at the pinned baseline index).
- `research/blueprint/readmes/MordellLawrenceVenkatesh.md`: the roadmap document, generated from the packet and the
  roadmap (objects with API, theorems with suggested declaration names and proof outlines, dependencies with the
  requested statements, tests), plus purpose, scope, boundaries, conventions, sources and a list of corrections
  to the source.

Baseline: Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174.

## Numbers

- 132 nodes: 70 lemmas, 29 theorems, 21 definitions, 11 constructions, 1 comparison; 253 API items on the 32
  definitions and constructions.
- 89 baseline declarations cited (73 Mathlib, 16 Tau Ceti), each read in its source file at the pinned commit.
- 92 requests to 51 supplier stages (19 of them are integration requests to `FoundationsAndLibraryIntegration:LI.4`,
  see below).
- 1 gap; 4 restructure proposals.
- Integrated nodes of other packets used: `CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base`
  and `FaltingsFinitenessAndIsogenyTheorems:R28.1/hermite-minkowski-finiteness-of-extensions-unramified-outside-S`.
  The Mordell corollary of FaltingsFinitenessAndIsogenyTheorems is not used.

## Layer structure and status

| Stage | Content | Coverage |
| --- | --- | --- |
| LV.0 | semilinear centralizers (LV 2.1), Aff(q), LV 2.11, counting, transvection and Goursat lemmas (LV 2.12–2.14) | source_decomposed |
| LV.1 | Faltings's finiteness lemma, friendly places, LV 2.8–2.10, H¹ of abelian varieties | source_decomposed |
| LV.2 | abelian-by-finite families, good models, de Rham bundle, residue disks, formal horizontal sections, transports, crystalline Frobenius | source_decomposed |
| LV.3 | Lagrangian Grassmannian and period varieties, monodromy group, period maps, LV 3.1–3.3, Strassmann, finite preimages | source_decomposed |
| LV.4 | fibre crystalline comparison, transport (6.6)–(6.7), orbit lemma, finiteness criterion, LV Proposition 3.4 | source_decomposed |
| LV.5 | surfaces, classification, mapping class groups, Dehn twists, point pushing and the Birman sequence, configuration fibration, twist lifting, families of branched covers | partial (gap) |
| LV.6 | S-unit theorem: reductions, Kummer fields, Legendre family and monodromy, LV 4.2–4.4, Theorem 4.1 | source_decomposed |
| LV.7 | size_v, LV 6.1–6.4 and the Sublemma, Proposition 5.3 | source_decomposed |
| LV.8 | Hurwitz spaces (LV 7.1, 7.4), reduced Pryms and their homology, Kodaira–Parshin family, fibre map (5.5) | source_decomposed |
| LV.9 | Aff(q)-covers, primitive homology, lifted monodromy, LV 8.2–8.4, normal form 8.5, LV 8.11 | source_decomposed |
| LV.10 | LV 8.6–8.10, Theorem 8.1, full monodromy of the Kodaira–Parshin family | source_decomposed |
| LV.11 | choice of q and v, Weil pairing, orbit count, size bound (5.4), Faltings's theorem | source_decomposed |

The layer order changed during the job from an eleven-layer draft: the Legendre monodromy of LV §4 needs surface
topology, so the topology layer (now LV.5) precedes the S-unit layer (now LV.6), and the Aff(q)-cover topology
(LV.9) is separated from the monodromy theorem (LV.10). Every layer depends only on earlier layers.

## Gap

- **Proof of the classification of compact surfaces** (`LV.5/surface-classification`). The node states the theorem
  and outlines the standard proof (Radó triangulation, polygon normal form), but Farb–Margalit only cite it and no
  atlas roadmap owns it. A continuation needs a source proof (for example Moise, *Geometric Topology in Dimensions 2
  and 3*, or Thomassen's proof) and should decompose it, or the MappingClassGroups roadmap proposed below should own it.

## Checker issue and the LI.4 routing

`scripts/check_blueprint.py` classifies every prerequisite matching `^(mathlib|tauceti):\S+$` as a baseline
declaration, so upstream stage ids such as `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`
cannot be node prerequisites (they fail as unlisted baseline declarations), although the checker accepts them as
request suppliers. The atlas routes upstream material through `FoundationsAndLibraryIntegration:LI.4` ("Imported
arithmetic foundations"). The packet therefore:

- replaces each upstream stage prerequisite by `FoundationsAndLibraryIntegration:LI.4`, and records the precise
  upstream stages in the node's `notes`;
- adds one LI.4 request per upstream stage ("integrate … with a declaration-level import ledger");
- keeps a direct request to the precise upstream stage with the exact statement needed.

The roadmap `requires` lists name the upstream stages directly. Recommended fix (outside this job's permissions):
exclude `tauceti:TauCetiRoadmap/` and `tauceti:Completed/` ids from the baseline pattern, after which the LI.4
routing can be removed.

## Corrections to the source recorded in the packet

- LV Lemma 2.3: the ramification set must contain the places above p.
- LV Lemma 2.8: true on units of the local field, false on uniformizers (η = χ_cyc⁻¹); proved on units, which is all
  Lemmas 2.9–2.10 use. The proof supplied goes through algebraic Hecke characters and Milne's factorization of
  infinity types.
- LV Lemma 3.2: independent radii for the two disks.
- LV Lemmas 6.3–6.4: W nonzero and proper; r ≥ 5 suffices.
- LV Proposition 5.3: the auxiliary place has odd residue characteristic lying below no place of S (the set-up of
  LV §3.1); LV.11 chooses v accordingly.
- LV Lemma 6.1: the base pair ranges over all pairs of local degree ≥ 8.
- LV Lemma 7.4: only middle exactness of the fundamental-group sequence is needed (so the reference to
  Schneebeli is not needed); injectivity rests on π₂ of the base; G_K-equivariance of fibres is defined through the
  outer action, with no rational auxiliary point.
- LV Lemmas 8.2–8.3: e nonseparating. LV Lemma 8.9: the group is Mod(Y ∖ {y})_{Z_i}.
- LV Lemma 8.6 (left to the reader) is proved with a finger-moved nonseparating curve; the curve of LV Lemma 8.8
  case 3 (LV Figure 4) is constructed as T_d^m(x) for every exponent; the curves β₁β₂^j of LV Lemma 8.11 are
  T_d^j(β₁).
- Proof of Theorem 5.4: small orbits need only 1 ≤ i ≤ 7; for i = 8 the unit condition can fail. Linear
  disjointness uses ℚ(ζ_{2m'}) = ℚ(ζ_{m'}) and the Tau Ceti compositum isomorphism with m' = (q − 1)/2.
- LV Lemma 4.3: the Legendre monodromy (±T_a², ±T_b² with î(a, b) = ±1) is derived from point pushing and twist
  lifting; the conclusion uses a factorwise-unipotent criterion instead of Lemma 2.12. LV Lemma 4.4: nonconstancy of
  the period map follows from full monodromy.

These derivations are the parts a reviewer should read most carefully, in particular the surface-topology
constructions in LV.10 (`push-monodromy-noncentral`, `covers-distinguished-by-curve`) and LV.9
(`normal-form-curves`), which replace pictures in the source by explicit Dehn-twist constructions.

## Requests (by supplier)

AbelianSchemesAndArithmeticModuli A1 (abelian schemes; elliptic curves as abelian schemes; relative identity
components), A2 (polarizations), A3 (Weil pairings), A4 (degree-one de Rham realization), A5 (Betti local system,
complex uniformization, homology of (ker ε)°); AlgebraicModuliForArithmeticGeometry R09.1 (Grassmannians, Plücker,
closed conditions, projectivity), A0-extension (relative Pic⁰); ArithmeticGaloisRepresentations R01.1, R01.6;
ComplexComparisonPartII C0 (algebraic vs analytic local rings, normalization), C2 (GAGA), C4 (connectedness of
Y(ℂ)), C5 (Gauss–Manin compatibility); CrystallineCohomology CR.1, CR.2, CR.3, CR.7; DeligneWeightsAndPurity DWP.0,
DWP.1; EtaleDualityAndPerverseSheaves EDC.2 (duality for curves with ℤ/N coefficients); InverseGaloisAndArithmetic-
FundamentalGroups IG.0, IG.1, IG.3 (Galois categories, arithmetic sequence, Riemann existence and invariance of π₁);
NeronModelsAndSemistableAbelianVarieties R11.5; PadicHodgeTheory R06.2 (D_dR, D_cris, MF^φ, weak admissibility),
R06.5 (identification of D_cris with Berthelot–Ogus and the Hodge filtration), R06.6; SchemeAndStackFoundations SF.0
(spreading out, completed local rings, dimension theory, normalization), SF.2, SF.3; WeightsInEtaleCohomology R34.1;
FoundationsAndLibraryIntegration LI.4 (integration of the upstream stages below); Tau Ceti AlgebraicCurves Layer 3,
AlgebraicTopology Stages 1–6 and 8, Chebotarev Layer 10, ClassFieldTheory Layers 7 and 11, GeometricTopology Layer 1,
JacobianChallenge Layer D, LocalFieldsRamification Layer 2, ReductiveGroups Layers 2, 3, 6, 7, UniversalCovers Stage 2.
The exact statements are in the packet's `requests`.

## Restructure proposals

1. Split: a new MappingClassGroups roadmap (Farb–Margalit Chapters 1–6 and the classification of surfaces) to own
   LV.5.
2. Rescope: state Faltings's theorem once, targeted by both RP.4/R28.5 and LV.11.
3. Rescope: ReductiveGroups states the structure of Sp(V) consumed by LV.0 and LefschetzPencilsAndVanishingCycles LPV.5.
4. Rescope: state the S-unit theorem once, targeted by DiophantineApproximationAndTranscendence DT.2 and LV.6.

## Sources

Fetched into the job's scratch directory (access date 2026-09-16 for all):

| Source | URL | SHA-256 |
| --- | --- | --- |
| Lawrence–Venkatesh, arXiv:1807.02721v3 (PDF) | https://arxiv.org/pdf/1807.02721v3 | e3013516c1123635f0373cd5b623eafa3d816f043ee54760dec724d329bc6b9b |
| same, TeX source | https://arxiv.org/e-print/1807.02721v3 | 6f6972471b088f6943fab432a2a3c0b4f477c20659797d243a56d01603480a1b |
| Brinon–Conrad, CMI notes | https://math.stanford.edu/~conrad/papers/notes.pdf | f27d508bc64b3c9e2e9de5041429b2cb6a909b2cd72ff8096c20493f27b5a187 |
| Milne, Complex Multiplication | https://www.jmilne.org/math/CourseNotes/CM.pdf | 0ac337a885d72f6938f15724b897f568fe350d0d754d0b52370b8f3a01d2e2b5 |
| Milne, Abelian Varieties | https://www.jmilne.org/math/CourseNotes/AV.pdf | f5ca4e63e5092a4b102daad1470e4cbed5fe8f82115e3a28c8881e3f67f6aaef |
| SGA 1 (arXiv edition) | https://arxiv.org/pdf/math/0206203 | 8e64218d356456c534eebf996940f0f957e43b54f1a080241debe12cbaf60d3c |
| Deligne, Sém. Bourbaki 616 | http://www.numdam.org/item/SB_1983-1984__26__25_0.pdf | b0865c63f3c65e768c388e5d575a1395ab401c0edaf45a49305679fb16c73a77 |
| Farb–Margalit, Primer v5.0 | https://pagine.dm.unipi.it/~a019210/Farb%20Magalit_Primer%20on%20Teichmuller%20theory.pdf | 46c4cc848134ba38d6e7fe15462aac3069796db23b0e34a50a9018773d7fc7f2 |
| K. Conrad, Strassmann's theorem and an application | https://kconrad.math.uconn.edu/blurbs/gradnumthy/strassmannapplication.pdf | dc8941f405710c59aaebeb6b6b7868c33c44dfd37079fbd02352adf8639920e8 |

From the supplied library: Faltings 1983 and Berthelot–Ogus (text copies). The sections read are listed in the
packet's `sources`. LV §9 was read only to confirm that the Mordell argument does not use it.

Cited by LV but not read (the packet does not depend on reading them; the needs are requests):
Berthelot, LNM 407, Ch. V (commutativity of LV (3.9); request CR.7); Deligne, IHÉS 35 (freeness of relative de Rham
cohomology; request A4); EGA IV 15.6.4 (relative identity component; request A1); Faltings 1989 (crystalline
comparison; the CP.2 node is used); Fontaine, Astérisque 223 (filtered φ-modules; Brinon–Conrad was used instead);
Katz–Oda (Gauss–Manin connection; request A4); Parshin 1968; Schneebeli 1978 (not needed, see the Lemma 7.4 remark);
Serre, GAGA (replaced by Riemann existence and normalization; request C2); Serre, *Abelian ℓ-adic representations*
(Lemma 2.3 background); the Stacks Project tag 037Z (request SF0); the published Invent. Math. version of LV
(locators are to arXiv v3). A textbook proof of the classification of surfaces is missing (see the gap).

## What a continuation should do

1. Close the gap: decompose a proof of the classification of compact surfaces, or adopt the MappingClassGroups
   restructure and replace LV.5 by a dependency.
2. Check the three surface-topology constructions named above against pictures, and the finger-move argument of
   `push-monodromy-noncentral`.
3. When suppliers publish blueprint nodes for the requested statements, replace the stage prerequisites by those
   node ids and drop the matching requests; after the checker fix, replace the LI.4 prerequisites by the upstream
   stage ids.
