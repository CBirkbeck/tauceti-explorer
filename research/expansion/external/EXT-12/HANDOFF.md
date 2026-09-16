# EXT-12 handoff — Modular, Shimura and Galois theory

Status: in progress (2026-09-16). This file is updated as each packet is finished.

* Every packet stays `partial`.
* Every node's `implementationStatus` stays `unchecked`.
* No Lean files, sorries or execution tickets were created.

## Assignment and packets

EXT-12 covers nine roadmaps with 81 atlas stages.

| Roadmap | Stages | Packet | State |
| --- | --- | --- | --- |
| ModularCurvesPartII | 20 | `ModularCurvesPartII.json` | worker drafting |
| ModularityAndLanglandsExtensions | 6 | `ModularityAndLanglandsExtensions.json` | written; 24 nodes, 39 links, 15 gaps; validator OK |
| OrdinaryAutomorphicFormsAndModularityLifting | 6 | `OrdinaryAutomorphicFormsAndModularityLifting.json` | worker drafting |
| OverconvergentAutomorphicForms | 9 | `OverconvergentAutomorphicForms.json` | worker drafting |
| PELModuli | 7 | `PELModuli.json` | worker drafting |
| PadicLocalLanglandsForGL2Qp | 6 | `PadicLocalLanglandsForGL2Qp.json` | worker drafting |
| PerfectoidShimuraVarieties | 8 | `PerfectoidShimuraVarieties.json` | worker drafting |
| PotentialAutomorphyInfrastructure | 6 | `PotentialAutomorphyInfrastructure.json` | worker drafting |
| PotentialModularityAndCompatibleSystems | 13 | `PotentialModularityAndCompatibleSystems.json` | worker drafting |

The orchestrator note for this run named EXT-15 for the handoff and scratch locations. EXT-15's directory
already holds another job's packets, so this job writes only to `external/EXT-12/`.

## Method

One packet per roadmap. Each packet is built from proofs read in the supplied reference library, or from
public primary copies whose provenance and SHA-256 are recorded in the packet. Each packet is checked for:

* schema;
* node ownership and id prefixes;
* coverage of every atlas stage;
* link endpoints (atlas stage, own node, or a node of another packet);
* stage-level and node-level cycles against the atlas `stageEdges`;
* private paths;
* literal excerpts, each confirmed to occur (after whitespace and symbol normalisation) in the source text read.

Where the text layer drops bars, primes, exponents or inequality signs, the formula was read on a
rendered page image and the packet says so.

## ModularityAndLanglandsExtensions (ML.0–ML.5)

### Sources read

| Source | Version and provenance | Sections read |
| --- | --- | --- |
| Newton–Thorne, *Symmetric power functoriality for holomorphic modular forms* | arXiv 1912.11261v3 (public) | Intro; statement of Thm 2.33; §3 in full; §7 (Thm 7.1 statement, Lemma 7.2, Cor 7.3, even-n induction, Thms 7.6–7.7); §8 in full |
| Newton–Thorne, *… II* | arXiv 2009.07180v2 (public) | Intro; Thm 2.1 and its reduction; §3 in full; Appendix A |
| Newton–Thorne, *Symmetric power functoriality for Hilbert modular forms* | arXiv 2212.03595v2 (public) | Intro; §6 (Prop 6.1 statement, Cor 6.2, Prop 6.3, Thm 6.4) |
| Barnet-Lamb–Gee–Geraghty–Taylor, *Potential automorphy and change of weight* | arXiv 1010.2561v4 (public; numbering matches the citations in ACC+ and Newton–Thorne) | Prop 3.1.1, Thm 3.1.2, Thm 4.2.1, Thm 4.5.1, Thm 5.4.1 with proofs; statements of Thm 2.4.1 and Lemmas 2.2.1–2.2.4 |
| ACC+, *Potential automorphy over CM fields* | Annals 197 (2023), library copy ACCPLUS | §1 theorems; §1.2 notation; §2.3 statement; §6.1 (Thms 6.1.1–6.1.2; page image checked); §7.1 Lemmas 7.1.1–7.1.4 and 7.1.9–7.1.10, Thm 7.1.11, Cors 7.1.12–7.1.16; §7.2 in full (page images of pp. 1100–1106 checked) |
| Khare–Wintenberger, *Serre's modularity conjecture (I)* | library copy SS_KW1 | §10.1–10.2 |
| Atobe–Gan–Ichino–Kaletha–Mínguez–Shin, *Local intertwining relations and co-tempered A-packets* | arXiv 2410.13504v3, library copy R02-AGIKMS | Introduction, §§0.1–0.4 |
| Scholze, *On torsion in the cohomology of locally symmetric varieties* | Annals 182 (2015), library copy SCH-TORSION | Thms 1.0.3–1.0.4; §5.1 opening |

### Main decomposition

* **ML.0.** A normalisation registry: Art_K geometric, Harris–Taylor rec_K, rec^T_K, HT(ε) = −1, r_{π,ι}
  local–global compatibility, and the meaning of "Sym^{n−1}π exists". Checked to agree across Newton–Thorne
  and ACC+.
* **ML.1.** KW I Cor 10.2(ii) (odd two-dimensional Artin representations of G_Q) and 10.2(i) (GL₂-type
  abelian varieties over Q). Both are linked to the existing Serre-conjecture node (ClassicalSerreModularity
  R27.6) and the Deligne–Serre node (AutomorphicGaloisRepresentations R19.1).
* **ML.2.**
  * ACC+ Thm 7.1.11, with its full §7.2 proof: Cor 7.2.4, the determinant twist, auxiliary elliptic-curve
    moduli with local points (supersingular and Serre–Tate cases), and Thm 6.1.1 applied twice.
  * The scope of Thm 1.0.1: potential modularity only.
  * BLGGT14 Prop 3.1.1 (the Moret-Bailly variant), Thm 3.1.2 (Dwork family), Thm 2.4.1 (= [Tho12, Thm 9.1]),
    Thm 4.2.1 (potentially diagonalizable lifting) and Thm 5.4.1 (polarized potential automorphy).
* **ML.3.**
  * Newton–Thorne I: Thm 2.33 (statement), Thm 3.1 (2-adic ping pong), Thms 7.6–7.7 (level one) and
    Thm 8.1 (no supercuspidal component).
  * Newton–Thorne II: Thm 2.1 (statement), Thm 3.1 (all non-CM forms over Q) and Thm A.1 (weight one and CM).
  * Newton–Thorne (Hilbert): Thm A via §6.
  * ACC+ Cors 7.1.13–7.1.15 (purity, L-functions, Sato–Tate, Ramanujan over CM fields).
  * A source-scoped register of all of these.
* **ML.4.**
  * The AGIKMS status: Arthur's and Mok's classification is conditional only on the twisted weighted
    fundamental lemma.
  * Scholze's totally real (symplectic) torsion branch is conditional on it.
* **ML.5.** The Clozel–Thorne conditional implication SP_r + SP_{p−r} + LR_{p+r} + TP_r ⇒ SP_{p+r}, as
  recorded by Newton–Thorne (Hilbert).

### Corrections to existing statements (ML)

1. **ML.2 conflates two theorems.** Its stage text asks for "full regularity, polarization, residual-image…
   hypotheses".
   * The ACC+ main theorem (Thm 7.1.11) needs no polarization. It concerns rank-2 very weakly compatible
     systems with Hodge–Tate {0,1} over CM fields, and their symmetric powers.
   * The polarized, regular potential automorphy theorem is BLGGT14 Thm 5.4.1, which is outside
     PotentialAutomorphyInfrastructure's scope.

   Both are now separate ML.2 nodes.
2. **ML.2's only prerequisite, PA.5, does not cover what the ACC+ assembly uses.**
   * Thm 7.1.11's proof applies ACC+ Thm 6.1.1 twice. No stage owns the assembled proof of Thm 6.1.1/6.1.2
     (§§6.5–6.6).
   * The proof also relies on BLGGT14 Prop 3.1.1, Thm 3.1.2 and Thm 2.4.1.
3. **The PotentialAutomorphyInfrastructure README says PA.5 exports to ML.3 "for the proved
   symmetric-power/Sato–Tate applications".**
   * Only the CM-field branch (ACC+ Cors 7.1.13–7.1.14) uses PA.5's operations.
   * The Newton–Thorne symmetric-power theorems over Q and totally real fields use BLGGT14 Thm 4.2.1,
     [ANT20], [AT21] and [Tho24], not PA.5.
4. **ML.4's conditionality should be stated precisely.**
   * After AGIKMS (arXiv v3, July 2026), the classification for quasi-split classical groups is conditional
     only on the twisted weighted fundamental lemma [MW4, II.4.4].
   * That lemma reduces to (i) the weighted fundamental lemma for Lie algebras (proved for split groups by
     Chaudouard–Laumon) and (ii) its non-standard version.
   * Scholze's torsion paper (2015) described the dependence more coarsely, as "conditional on the
     stabilization of the twisted trace formula".
5. **ML.1 is over Q only.**
   * KW I Cor 10.2 is over Q.
   * Over CM fields ACC+ proves only potential modularity of elliptic curves (Thm 1.0.1).
   * No source read covers weight-one modularity over totally real fields.
6. **Misprint in ACC+ p. 1102.** It writes Ind_{G_F}^{G_Q} ψ_m where p. 1101 has Ind_{G_L}^{G_Q} ψ_m (ψ_m is
   a character of G_L). Checked on the page image.

### Shared-supplier requests (ML)

* **ACC+ Thms 6.1.1 and 6.1.2** (assembled proofs, §§6.5–6.6): an owner in PotentialAutomorphyInfrastructure.
  PA.1–PA.4 own only the ingredients.
* **The ACC+ §7.1 notions of very weakly and extremely weakly compatible systems**, with Lemmas 7.1.1–7.1.3
  and 7.1.9–7.1.10: an owner in PA.5 or PotentialModularityAndCompatibleSystems R24.5:operations.
* **Polarized n-dimensional automorphy lifting and potential automorphy**: Thorne [Tho12, Thm 9.1], BLGGT14
  §§1–5 and BLGHT11 (Dwork family). No atlas stage exists.
* **Stabilisation of the twisted trace formula** (Mœglin–Waldspurger) conditional on the twisted weighted
  fundamental lemma. AS.6, ET.3 and ET.4 explicitly exclude it.
* **An analytic supplier for Sato–Tate.** It needs Serre's equidistribution criterion, Jacquet–Shalika
  non-vanishing on the edge of convergence, and the HSBT10 Brauer-induction argument. AnalyticNumberTheory
  AN.4 covers only Hecke, Dedekind and Artin L-functions.
* **Identification of Harris–Taylor's rec_K** with the ET.6 local Langlands construction.

### Unresolved cross-job dependencies (ML)

* **PotentialModularityAndCompatibleSystems R23.1** (EXT-12 sibling) must state Moret-Bailly
  ([MB89, Thm 1.3]) for arbitrary smooth geometrically connected varieties with Galois-invariant local open
  sets. Consumed by BLGGT14 Prop 3.1.1.
* **ClassicalSerreModularity R27.6** (EXT-10, promoted) supplies KW I Thm 10.1.
* **AutomorphicGaloisRepresentations R19.1** (EXT-10, promoted) supplies Deligne–Serre.
* **FaltingsFinitenessAndIsogenyTheorems R28.4** (EXT-07) supplies the isogeny criterion.
* **EndoscopicTransferAndUnitaryTraceComparison ET.3 and ET.6** (EXT-11 area): scope caveats recorded on the
  links.

### Next actions (ML)

* Read Newton–Thorne I §§1–2 and 4–6, Newton–Thorne II §2, and Newton–Thorne (Hilbert) §§3–5.
* Read BLGGT14 Props 3.2.1, 3.3.1 and 4.1.1; obtain Tho12, ANT20, AT21 and Tho24.
* Read ACC+ Lemmas 7.1.6–7.1.8.
* Obtain Mok (arXiv 1206.0882) and KMSW (arXiv 1409.3731); read Scholze torsion §§5.1–5.4.
* Obtain Ribet 1992 (GL₂-type abelian varieties) and the Sato–Tate analytic sources.

## Other roadmaps

Sections for the other eight roadmaps will be added as their packets are reviewed.
