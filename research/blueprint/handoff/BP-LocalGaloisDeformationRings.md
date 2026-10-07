# BP-LocalGaloisDeformationRings: complete pass over R08.1–R08.6, L7 and L8

Claude — session `claude-CxJ5Mu`, 7 October 2026. Refs #770. **Status: complete** (goes to its independent review).

This pass continues the eight checkpoints of session `cc-39fac3` (28–29 September 2026, 72 nodes). It plans the 19
sources the maintainer added to the issue, handles the five confirmed red-team findings, closes the open stages, and
brings the document and the suggested file up to date.

## What the packet now contains

- **153 nodes** (81 new): 92 theorems, 14 lemmas, 14 definitions, 29 constructions, 3 comparisons, 1 application.
  There are 208 API items, 160 unit tests, 43 planets, 9 baseline declarations, 17 requests and 3 gaps.
- **Nodes per layer:** R08.1 16, R08.2 30, R08.3 13, L7 39, L8 7, R08.4 15, R08.5 14, R08.6 19.
- **Coverage:** every stage is `planned`; L8 is `source_decomposed`. Each `planned` record lists its refinements (see
  below).
- `check_blueprint.py`: 0 errors, 0 warnings.

## New nodes, by source

- **Böckle–Iyengar–Paškūnas, Paškūnas–Quast, Ding, Breuil–Hellmann–Schraen (R08.1):**
  - `coefficient-rings-lambda`, `lambda-presentation`;
  - `completion-at-points` (Kisin's comparison, also from CG18 and BCGP21), `smooth-points-generic-fibre`;
  - `rank-one-ring`, `determinant-twisting`;
  - `g-valued-framed-ring`, `g-valued-presentations`;
  - `phi-gamma-module-deformation-rings`.
- **Away from p (R08.2):**
  - Liu et al. and its companion: `q-tame-group`, `level-raising-local-problems`, `rigid-residual-conditions`;
  - Shotton via Newton–Thorne: `unrestricted-ring-complete-intersection`, `inertial-type-with-monodromy`,
    `fixed-type-rings-rank-n` (with BLGGT Lemma 1.3.4 and BCGP25 Lemma 5.6.2);
  - Newton–Thorne: `steinberg-ring-domain`, `dotto-division-algebra-cycles`;
  - CG18: `rank-two-unrestricted-rings-cg`, `taylor-wiles-local-tangent`;
  - CG20: `regular-unipotent-minimally-ramified`, `gsp4-ramification-types`, `gsp4-minimal-conditions`;
  - BCGP21 and BCGP25: `gsp4-taylor-wiles-lifts`, `gsp4-unipotent-local-models`, `gsp4-ihara-avoidance-rings`;
  - BCGP25: `ihara-avoidance-rings-p2`, `taylor-wiles-block-condition`;
  - FKP: `g-valued-generic-fibre-away-from-p`, `equal-characteristic-local-lifts`,
    `reducible-lifts-prescribed-determinant`.
- **R08.3:**
  - `pst-quotient-in-families` (Kisin 2.5.5, 2.7.6, 2.7.7 over any complete local A°; red-team finding /14);
  - `g-valued-pst-rings` (Balaji, Bellovin–Gee via FKP);
  - `weil-deligne-type-ring` (CDN R_{B,M});
  - `bcdt-type-rings` (BCDT R^D and Conjecture 1.1.1);
  - `fixed-determinant-pst-rings` (CN Lemma 3.3.6).
- **R08.4:** `finite-cocycles-kummer` (KW II Lemma 3.7), `kw-algebraisation-lemma` (Lemma 3.8),
  `bt-ring-unique-generalisation` (CN Lemmas 5.3.3–5.3.4).
- **R08.5 (KW I and KW II):** `weight-p-crystalline-ordinarity`, `weight-p-plus-one-ordinary-ring`,
  `semistable-weight-two-resolution`, `dyadic-minimal-lifts`, `twisted-semistable-away-from-p`,
  `kw1-endpoint-weight-rings`.
- **R08.6:**
  - KW I: `kw1-lift-types`, `good-dihedral-type`, `dyadic-weight-two-transition`;
  - FKP: `ordinary-pcris-lifts-reducible`, `serre-weight-crystalline-lift`;
  - Newton–Thorne: `newton-thorne-local-quotients`, `torsion-semistable-condition`;
  - BCDT: `category-deformation-conditions`.
- **L7:**
  - `ordinary-of-weight-lambda` (NT26 Definition 2.5(2), BCGP25 Definition 5.6.8, CN Definition 3.3.1);
  - `semistable-ordinary-quotient` (CN);
  - `g-valued-ordinary-condition`, `-quotient`, `-components` (FKP Appendix B, with the central generators of E43);
  - `snowden-ordinary-ring-trivial-residual` (CN Proposition 5.3.2);
  - `ordinary-ring-with-frobenius-eigenvalue`, `eigenvalue-ring-normal-cm-type-three` (CG18);
  - `gsp4-siegel-ordinary-condition`, `gsp4-siegel-ordinary-tangent` (CG20);
  - `gsp4-borel-ordinary-conditions`, `gsp4-ordinary-generic-fibres`, `gl2-borel-ordinary-ring` (BCGP21);
  - `gsp4-ordinary-flag-incidence`, `gsp4-ordinary-regularity`, `gsp4-ordinary-weight-two-components` (BCGP25);
  - `connects-relation`, `weight-zero-crystalline-connectedness`, `local-model-rho-nm0` (BLGGT, BCGNT, BCG);
  - `kisin-modules-tame-descent`, `semisimple-kisin-modules-and-shapes`, `gl3-pcris-deformation-rings`,
    `gl3-explicit-rings`, `gl3-component-labelling` (LLHLM);
  - `partition-monodromy-rings`, `partition-ring-smooth-points` (Clozel–Thorne);
  - `torsion-crystalline-representations` (Liu et al. Definition 2.2.4);
  - `away-from-p-rank-n-interface`.
- **L8:** `doubling-equals-unramified` (CG18 Lemma 3.22).
- **Existing nodes extended:**
  - `R08.2/ihara-avoidance-components` takes Newton–Thorne's congruence;
  - `L7/trivial-residual-flag-ring` takes BCGP25 Proposition 5.6.6(3) at p = 2 and Remark 5.6.7 (no flat closure);
  - `R08.4/rank-two-bt-components` takes CN Lemma 5.3.4.
- **Stage placeholders replaced by nodes:** the prerequisites `LocalGaloisDeformationRings:L7` and `:R08.5` in R08.6's
  exports.
- **Two cycles removed.** Both were node dependencies running against the stage order:
  - `R08.5/ordinary-deformations-p2` → `R08.6/export-ordinary` (now uses `R08.4/finite-cocycles-kummer`);
  - `R08.1/smooth-points-generic-fibre` → R08.2.
- **Unit-test kinds:** the `example`/`value` kinds of the earlier checkpoints were mapped to the protocol's kinds.

## The red-team findings

- **RT-AREA-langlands-2/14:**
  - R08.3 exports Kisin's (2.5.5), (2.7.6) and (2.7.7) over an arbitrary complete local Noetherian A° as
    `R08.3/pst-quotient-in-families`, read in the AMS PDF of Kisin's JAMS paper;
  - the link R08.3 → AutomorphicGaloisRepresentations R19.5, and R19.5's node, are proposed in `restructure`.
- **/16 (local duality):**
  - every dimension and smoothness node lists `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-…` and names
    `tateDualityPairing_perfect_mixed` and `eulerCharacteristic_finrank_fp` in its proof outline. That covers 39 nodes,
    among them the KW II Lemma 3.7 analogue `R08.4/finite-cocycles-kummer`;
  - these two names are planned in that Tau Ceti layer; they are not in the pinned library;
  - the request lists every consumer and asks for the link Layer 5 → R08.1.
- **/17 (Berger–Li–Zhu):**
  - R08.5 imports KW II Lemma 3.5 from PadicHodgeTheory R06.4, through a request and the R06.4 nodes
    `weight-p-endpoint-branch`, `weight-p-plus-one-branch` and `two-dimensional-ordinarity-criterion`;
  - the single-owner proposal (R06.4, with R21.5 keeping only Skinner–Wiles' p = 3 branch) is in `restructure`.
- **/18 (duplicate pst rings):**
  - R08.3 owns Kisin's rings in every rank (including the G-valued rings);
  - L7 is narrowed in the `restructure` record, with the owners entry and the corrected R08.3 text.
- **/22 (P9 versus PA.3):**
  - the uses of L7's and L8's ACC+ §6.2 nodes name PotentialAutomorphyInfrastructure PA.3;
  - `restructure` proposes the corrected L7 text and the links L7, L8, G8 → PA.3.

## Structure proposals (`restructure`)

Besides the five above, the packet proposes splitting L7 into five sub-layers:
- L7a, bounded-height lattice moduli, placed before R08.3;
- L7b, Fontaine–Laffaille, discrete series and rank n away from p;
- L7c, ordinary conditions for GL_n and G;
- L7d, GSp₄ ordinary conditions;
- L7e, components.

Two stage-level dependencies still run against the atlas edges, and both are older than this pass:
- R08.3's semistable quotient uses L7's lattice moduli;
- L7's flag scheme uses L8's coefficient ring Λ_v.

Placing L7a before R08.3 and moving `L8/ordinary-coefficient-ring` into L7c removes both. RS-08's owner record for
the lattice moduli (L7) is kept.

## Gaps (3)

- Pappas–Rapoport local models (from checkpoint 5).
- Thorne's Proposition 3.14 behind ACC+ Proposition 6.2.10 (from checkpoint 6).
- **New:** generic reducedness of potentially Barsotti–Tate rings (Caraiani–Emerton–Gee–Savitt). No Emerton–Gee stack
  roadmap exists. It is needed by `R08.4/bt-ring-unique-generalisation`.

## Requests (17)

The earlier ones stand. The new ones are:
- Tau Ceti classical groups Layer 0: GSp_{2n} over any ring.
- PadicHodgeTheory P7: (φ, Γ)-modules over the Robba ring.
- Tau Ceti ProfiniteCohomology Layer 9: Kummer theory for F^nr.
- PadicHodgeTheory R06.4: KW II Lemma 3.5 with Berger–Li–Zhu.
- DeformationAndDerivedPatchingAlgebra R03.3: graded Cohen–Macaulay rings, Hilbert series, canonical modules and type.
- PadicLocalLanglandsForGL2Qp R30.5: pseudo-character rings of blocks and CDN Théorème 5.11. The link R30.5 → R08.3 is
  acyclic.

## What a follow-up does (the `remaining` lists)

- **R08.1:** at lemma level, split PQ26 Lemmas 3.3–3.5 and BIP Corollary 3.42.
- **R08.2:**
  - G-valued minimally ramified conditions beyond GL_n and GSp₄ are planned only through Bellovin–Gee and Booher as
    cited;
  - split BCGP21 Propositions 7.4.14–7.4.18.
- **R08.3:**
  - CDN Théorème 5.11 is requested from R30.5;
  - the trianguline variety belongs to the Breuil–Hellmann–Schraen roadmap.
- **R08.4, R08.5:** the gaps above.
- **R08.6:** general de Rham lifting is GL2ModularityLifting R32; only its local conditions are exported here.
- **L7:**
  - Thorne's gap;
  - the LLHLM table rows (Tables 3–4, §3.6.2–3.6.3), one node per row at lemma level;
  - Geraghty's paper (Math. Ann. 2019) was not obtained. Its Lemmas 2.32, 3.10 and 3.14 and Corollary 3.6 are cited
    through BCGNT, BCGP25 and FKP, and should be read at the next pass.

## Mistakes in the sources

No new `sourceIssues` entries are added. The packet keeps E1 (Savitt) and E2 (CHT).

Nodes use corrected statements for the mistakes the reviewed extractions recorded, and cite them in their hypotheses:
- CG18: E89, the case v ≡ −1 mod p missing from Lemma 4.11. The packet re-derives it: the line ω̄² ⊂ ad⁰ρ̄(1) is
  trivial exactly when v ≡ ±1 mod p. Also E92–E93 and E172.
- CG20: E17, E20, E23–E25 and E148.
- FKP: E6, E7, E29 and E43.
- BCGP21: §§7.3–7.4.
- CN: E1–E2.
- BCGNT: E26.
- LTXZZ: the §6.4 monodromy direction, and footnote 5 of Definition 2.2.4.

## Suggested Lean file

`suggested/LocalGaloisDeformationRings.lean` **elaborates** with `lean-check`:
- the shared build at the pinned Mathlib 082e2d3, which imports Mathlib only;
- exit 0, and its only warnings are 4 `declaration uses sorry`.

New elaborated checks:
- the tame relation for (Φ, S), with a proved power formula for lower unipotents;
- Snowden's presentation of R̃† ⊗ k: the four bilinear generators as entries of mn − βm, m² = (a² + bc)·1,
  det(1 + n) − 1 and the characteristic polynomial at 1 + β (all proved);
- the trace relation α + α⁻¹ = 2 + φ₁ + φ₄;
- the Chebyshev case v = 2 of CG18's footnote 5;
- N₁² = 0 for GSp₄;
- ρ_{n,m,0}'s weights and its tensor-exponent identity;
- the dimension counts of Lemma 4.8, the GSp₄ filtration and the good-dihedral example.

A generated sketch block names every definition, API item, unit test and theorem of the packet. All 208 API names and
160 test names occur in the file.

## Sources read in this pass

All were fetched into scratch on 7 October 2026. The sha256 values are in the packet's sources.
- arXiv: NT26 (2212.03595v2), LTXZZ (1912.11942v3) and its companion (2108.06998v1), FKP (2008.12593v5),
  CG18 (1207.4224v2), CG20 (1907.08691v1) with its appendix (1907.08694v1), PQ26 (2404.14622v2), BCGNT (2309.15880),
  CDN (2204.11214), BIP (2110.01638v2), LLHLM (1608.06570v4), BCG (2309.15944v3), Ding (2407.21237),
  BHS (1702.02192), BCGP21 (1812.09269v3), BCGP25 (2502.20645v1), CN (2301.10509v3), BLGGT (1010.2561v4).
- Other copies:
  - Clozel–Thorne III, the accepted manuscript on Thorne's page; fetched without certificate verification, because
    the server's certificate chain is incomplete;
  - KW I, the authors' copy;
  - KW II, the authors' final version;
  - BCDT, the AMS open-access PDF;
  - Kisin, JAMS 2008, the AMS PDF.
- **Not obtained:** Geraghty (Math. Ann. 2019), Snowden (Math. Z. 2018), Shotton (Compositio 2018), Bellovin–Gee
  (ANT 2019), Dotto, Wake–Wang-Erickson, Thorne (JAMS 2015). Each is cited through the papers above that quote it,
  with their locators.
