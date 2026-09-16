# EXT-01 handoff (in progress)

Job: EXT-01 — Shared foundations. Roadmaps: DeformationAndDerivedPatchingAlgebra,
EnhancedDerivedSheaves, FoundationsAndLibraryIntegration, GeneralAlgebraicKTheory,
SchemeAndStackFoundations, StableHomotopyKTheory (60 stage records in the atlas).

This file is updated after each packet so that everything saved remains usable if the
session stops. All packets are `partial`; every node has `implementationStatus:
"unchecked"`. No Lean files, tickets, commits or edits outside this directory.

Method notes. Packets 1–3 were read directly from the sources. For packets 4–6 the bulk
reading is done by read-only reader passes working from the library copies (text
extractions kept in the worker's scratch area, never in the repository); their notes
record labels, hypotheses, proof steps and literal excerpts, and every excerpt placed in a
packet is machine-checked to occur verbatim (after whitespace normalization) in the local
extraction of its source before validation. Packet 3 was additionally checked claim by
claim by three independent read-only verification passes; all 40 reported discrepancies
were corrected in the packet.

## Working order

1. StableHomotopyKTheory — done (packet written, validated).
2. GeneralAlgebraicKTheory — done (packet written, validated jointly with 1).
3. DeformationAndDerivedPatchingAlgebra — done (packet written, validated, verified against
   the sources, corrections applied).
4. EnhancedDerivedSheaves — in progress. E3 nodes written (HTT §§4.3.1–4.3.3; Liu–Zheng
   arXiv v2 §2 / v4 §§2–3; Scholze ECD §§17, 22–23, 26). Readers are working on E0/E1 (HA
   §§1.1, 1.3; Stacks K-injectives), E2/E4 (Bhatt–Scholze §3) and the E5 sub-stages (HA §2;
   HTT §§5.1.4, 5.3.5, 5.5.8).
5. SchemeAndStackFoundations — readers working (Stacks schemes, descent, étale cohomology,
   curves, Picard, Chow, deformation theory; Bhatt–Scholze §5; de Jong 1996).
6. FoundationsAndLibraryIntegration — reader working (Stacks algebra, homological algebra,
   sites; Mathlib declaration audit at the pinned commit).

## Files written

| File | Nodes | Links | Gaps | Coverage |
| --- | --- | --- | --- | --- |
| `StableHomotopyKTheory.json` | 25 | 28 | 7 | 12/12 stages (11 partial, 1 not_read) |
| `GeneralAlgebraicKTheory.json` | 24 | 55 | 7 | 15/15 stages (14 partial, 1 not_read) |
| `DeformationAndDerivedPatchingAlgebra.json` | 18 | 30 | 5 | 9/9 stages (all partial) |
| `EnhancedDerivedSheaves.json` (first pass, E3 only) | 7 | 13 | 5 | 11/11 stages (1 partial, 10 not_read) |

Validation: `json.load` plus the repository's own `scripts/decompositions.py`
`merge_decompositions` run in a scratch copy with an in-memory placeholder review
(structure, node ownership, endpoints and global acyclicity all pass). The placeholder
review is not part of the packet and is not a review. The two K-theory packets link to
each other's nodes; validated jointly all links resolve (validated alone, the 17
cross-packet links of GeneralAlgebraicKTheory are reported as deferred, as designed). The
deformation packet validates alone with no deferred links (its cross-roadmap links target
stage ids).

## Sources read (with hashes)

StableHomotopyKTheory and GeneralAlgebraicKTheory:
- Quillen, *Higher algebraic K-theory: I*, LNM 341 (1973) — sha256 `5d2db42d…bae04`.
- Weibel, *The K-book*, chapters II, IV, V (online files) — sha256 `529ea8a5…bc607`,
  `9f1c1b8c…75248`, `52dcc8ee…b1da8`.
- Waldhausen, *Algebraic K-theory of spaces* (1985) — sha256 `2f452696…b1c6e`.
- Schlichting, *Negative K-theory of derived categories* (2003) — sha256 `f59620e3…b5aa6`.
- Carlsson, *Deloopings in algebraic K-theory*, Handbook of K-theory I.1 (2005) — library
  copy of the Handbook, sha256 `3d5b694c…b7e60`.
- Hatcher, *Algebraic Topology*, author's online edition (public copy from
  https://pi.math.cornell.edu/~hatcher/AT/AT.pdf, scratch only) — sha256 `bebb3032…e5618`.

DeformationAndDerivedPatchingAlgebra:
- Stacks Project, book.pdf (PDF dated 30 January 2026, 7641 pp.) — sha256 `e44ecf82…f7712`;
  ch. 90 §§90.2–90.19, ch. 10 §10.72 and §§10.110–10.111, ch. 15 §§15.68–15.69, 15.75–15.76,
  15.92 (parts).
- Calegari–Geraghty, *Modularity lifting beyond the Taylor–Wiles method*, Invent. Math. —
  sha256 `c0ba8de0…225c5`; §2 and §6.
- Allen et al. (ACC+), *Potential automorphy over CM fields* — sha256 `c5429e4f…67f02`;
  §§6.2.20–6.2.27, 6.2.33, 6.3, 6.4.
- Kisin, *Moduli of finite flat group schemes, and modularity*, Ann. of Math. 170 (2009) —
  sha256 `076f8bb6…f4ee7`; (3.3).
- Khare–Wintenberger, *Serre's modularity conjecture (II)*, author preprint — sha256
  `53f45f8b…86ed4`; §4.2, §9.1, §10.
- Khare–Wintenberger, Ann. of Math. 169 (2009) — sha256 `154c0c2a…cdb22`; Lemma 3.6.

EnhancedDerivedSheaves (so far):
- Lurie, *Higher Topos Theory* (PDF dated April 9, 2017) — sha256 `58855f3a…ede6e`.
- Lurie, *Higher Algebra* (PDF dated September 18, 2017) — sha256 `112b145a…d68c3`.
- Scholze, *Étale cohomology of diamonds* (version dated April 14, 2026) — sha256
  `4ce3d123…a26c1`.
- Liu–Zheng, arXiv:1211.5948v4 (library copy) — sha256 `ceac019a…a0e0d`; and v2, the
  version ECD cites (public arXiv copy https://arxiv.org/pdf/1211.5948v2 downloaded to
  scratch only) — sha256 `7f4b977e…4e338`.

## Corrections and precision notes for existing statements

StableHomotopyKTheory / GeneralAlgebraicKTheory:
- H.6: completion of homotopy groups is not just tensoring with Z_ℓ even under finiteness.
  Weibel IV 2.9: if the π_{n+1}(E; Z/ℓ^ν) are finite, lim¹ vanishes and π_n(E; Z_ℓ) is an
  extension of the Tate module of π_{n−1}(E) by the ℓ-adic completion of π_n(E).
- H.3: the only existence proof read (Hatcher Prop. 4.40) gives an integral homology
  isomorphism; the local-coefficient isomorphism in Weibel's Definition 1.1(2) and the
  universal property (Theorem 1.5(2)) have no proof in the sources read. The perfect
  subgroup need not be normal in Hatcher; the kernel is its normal closure.
- H.4: Carlsson's printed statement of Segal's delooping theorem says σ_n are weak
  equivalences "for n > 1"; the case n = 1 must be checked against Segal 1974.
- H.5:S-delooping / K.4 (confirmed): Waldhausen §1.3 (p. 330) says additivity is needed for
  the S.-delooping, and Proposition 1.5.3 is proved from Proposition 1.5.5, which uses
  additivity; Weibel IV 8.5.5 relies on V.1.7 likewise. The atlas edge
  H.5:S-delooping → K.4 must be reversed, or additivity split into a node that precedes
  H.5:S-delooping (the packets link the K.4 additivity/fibration nodes to the H.5 node).

DeformationAndDerivedPatchingAlgebra:
- P8: in ACC+ the patching base is S_∞ = T[[Δ_∞]] with Δ_∞ = Z_p^{nq}, Λ and T power series
  rings over O and the framing variables inside T; the complexes C_N are perfect over
  Λ[Δ_N] and the data are indexed by N ∈ N ∪ {0}. The stage's S_∞ = O[[z₁,…,z_q]] and
  "S_N a finite quotient of O[Δ_N]" should be aligned. Uniform bounds on presentations are a
  proved consequence (minimal complexes with ranks dim_k H^i(C₀ ⊗^L k)), not a hypothesis;
  the augmentation statement is C_∞/a_∞ ≅ C₀ (ACC+ Prop. 6.4.16).
- P7: minimal complexes over a local ring are unique up to isomorphism of complexes (Stacks
  15.76.6), stronger than "up to homotopy"; the Stacks Tor spectral sequence (Example
  15.62.4) is stated for objects of D⁻; derived Nakayama belongs to DD.1 (Stacks 15.92.19–20).
- P9: in Calegari–Geraghty the balanced-module theorem (Prop. 2.3) is the l₀ = 1 situation
  (length-one resolutions), while l₀ = 0 is the classical Taylor–Wiles–Diamond case; "a
  one-degree module theorem as a specialization" must say which. ACC+ Lemma 6.3.4 also needs
  Spec T_m irreducible and T_m/(f) zero-dimensional; additivity of derived length needs two
  of three terms with finite-length cohomology; Assumption 6.3.6 needs the strict bound
  dim < dim S_∞ − l₀ − 1 for non-maximal generic points (including R′_∞/ϖ).
- R03.2: no abstract (non-Galois) lemma relating presentation relations to obstruction
  spaces was found in the sources read; KW II Lemma 4.6 is the Galois instance (Poitou–Tate)
  and ACC+ Prop. 6.2.25 only counts variables (T ≠ ∅, p ∤ 2n, determinant not fixed).
  Schlessinger's theorem needs Der_Λ(k,k) → T F injective when k/k′ is inseparable (Stacks
  90.18.2); unframed functors satisfy (S1)–(S2) and fail (RS) when automorphisms do not lift.
- R03.3: the Matsumura inequality depth ≤ dim R/p (p ∈ Ass) is Stacks Algebra Lemma 10.72.9.
- R03.4: KW II §10 obtains finiteness from finite image (KW 2009 Lemma 3.6 via Carayol, or de
  Jong 2001, 3.14), and §9.1 (p = 2) from faithfulness of M_∞ over R_∞ (Lemma 9.6(b)); the
  framed ring is finite only over O[[y_{h+1},…,y_{h+j}]]. KW 2009 Lemma 3.6 concerns
  deformations in κ-algebras; it is applied through "R finite over Z_p ⇔ R/(p) finite".
- R03.5/R03.6: CG Prop. 2.3 concludes only freeness of H over R (no complete-intersection
  claim); CG Thm 6.4 assumes R_∞ p-torsion free; CG Prop. 6.6 has its proof omitted.

EnhancedDerivedSheaves:
- E3: "the cofinality result used when restricting from a total diagram to a fibre, and the
  criterion that a fibrewise transformation preserves coCartesian edges" are not in HTT
  §4.3.2. The cofinality is proved inside HTT Lemma 4.3.3.9 (absolute Kan extensions only;
  HTT does not develop the relative theory); preservation of coCartesian edges is ECD Lemma
  22.17, derived from ECD 22.15–22.16.
- E3: ECD's "[LZ14, Section 2]" is arXiv:1211.5948v2 §2 "Enhanced operations for ringed
  topoi", which is §§3.1–3.2 of the library's v4 (v4 §2 is different material). The
  construction assumes ringed topoi with enough points.
- E3 / DiamondSixOperations:S2: ECD applies HTT Corollary 4.3.2.14, which needs a small
  source ∞-category; smallness is not addressed (HTT Lemma 4.3.2.13 is the size-free
  criterion). ECD 22.14/22.20 apply HA 1.4.4.1(2), which needs Rf_! to be exact.
- E4 / AdicCoefficientsAndComparisons:L0: ECD Prop. 26.2 cites Bhatt–Scholze Lemma 3.5.7,
  stated for noetherian rings; the claim that the noetherian hypothesis can be dropped for
  regular-sequence ideals, and the identification of complete objects of the
  projective-system topos with lim_n D(Y_v, Λ/Iⁿ), are not proved in the text.

## Shared-supplier requests

- A construction stage for the Serre spectral sequence of a fibration with local
  coefficients and its comparison theorem (needed by StableHomotopyKTheory H.3 nodes; no
  atlas stage constructs it; Mathlib has no file named for it — unchecked beyond grep).
- A concrete spectrum model with stable homotopy category (Bousfield–Friedlander or
  symmetric spectra) — currently assigned to StableHomotopyKTheory H.5:spectra but no
  library source; next action is to download Hovey–Shipley–Smith (arXiv:math/9801077).
- A relative (over a base) fibrewise Kan-extension lemma and a coCartesian-edge
  preservation criterion, owned by EnhancedDerivedSheaves:E3: DiamondSixOperations:S2 needs
  them and HTT does not supply them.

## Unresolved cross-job dependencies

- New node-level links into other jobs' stages (all refine existing stage-level needs,
  scope checked against the consumer stage text): H.3 → K2SymbolsBrauer:T.1:plus and
  K3BlochGroups:V.1 (EXT-18); H.2 homotopy-fibre sequence → KTheoryFiniteLocalFields:L.1
  (EXT-18, new stage-level edge); KTheoryLowDegrees:U.1 and Z.1 (EXT-18) → H.4 nodes.
- DeformationAndDerivedPatchingAlgebra → GlobalGaloisDeformations:R04.1,
  LocalGaloisDeformationRings:R08.1, PotentialModularityAndCompatibleSystems:R24.1,
  OrdinaryAutomorphicFormsAndModularityLifting:R21.4, PotentialAutomorphyInfrastructure:PA.3,
  CompletedCohomologyPartII:CC.4; and DerivedDeRhamCohomology:DD.1 → P7 (derived completion
  is used, not duplicated).
- EnhancedDerivedSheaves E3 nodes → DiamondSixOperations:S2, S3 and
  DiamondEtaleCohomology:C2.

## Next actions

1. EnhancedDerivedSheaves: add E0/E1 (HA §§1.1, 1.3; Stacks K-injective/K-flat), E2/E4
   (Bhatt–Scholze §3) and E5 sub-stage nodes; re-validate.
2. SchemeAndStackFoundations and FoundationsAndLibraryIntegration packets from the reader
   notes; validate all six packets jointly.
3. Open source actions carried by the packets: Dold–Lashof lemmas and Segal 1974 (H.2, H.4);
   Hovey–Shipley–Smith (H.5); Waldhausen §1.6 and Thomason–Trobaugh §§1.9, 6 (K.4, K.6);
   Khare–Thorne 2017 Lemmas 2.3, 2.5, 2.13 and Gee–Newton 2022 Lemma 2.2.2, Cor. 2.2.7 (P8,
   P9); Stacks Example 15.62.4 and Cohen–Macaulay/excellence sections (P7, R03.3); HTT
   §§5.5.2–5.5.3 proofs and a relative fibrewise Kan-extension statement (E3).
