# BP-ShimuraData~4 — maintainer-directed revision (round 4)

Issue #10106. Worker: Claude (session `claude-WjBorz`), 17 October 2026. Branch `claude-WjBorz-BP-ShimuraData-4`. The bot confirmed the claim. This is a complete planning pass. It is neither a checkpoint nor an implementation.

## The instruction and how it was read

The maintainer asked for three things on 17 October 2026:

1. Resolve every remaining finding of REV-ShimuraData~3 and of the packet's current reviewer, REV-FIX-RT-AREA-algebraicgeometry~2.
2. Treat Shimura data in full generality (Deligne's axioms, reflex field, canonical models), with the PEL and Hodge-type cases as specialisations.
3. Consume what ShimuraVarieties and PELModuli state, since they are open upstream pull requests that own it, and do not duplicate it.

I read the current pull-request heads read-only through the GitHub API; the local TauCetiRoadmap remotes were stale. The heads were:

- ShimuraVarieties #933 at 1dd09ed7a8
- PELModuli #966 at 7577fe7ccc
- ReductiveGroupsPartII #785 at f24efef614
- AdelicAlgebraicGroups #792 at 241d5d6a9b
- ArithmeticLocallySymmetricSpaces #871 at e7e16145f2
- AbelianSchemesAndArithmeticModuli #849 at abd7847d2c

ShimuraVarieties went upstream before this roadmap, so it constructs the Shimura-datum foundations itself in its §§P.1–P.5 ("Prerequisites constructed here") and never cites ShimuraData. It covers:

- the pure datum and its category;
- Hermitian components;
- the representation–Hodge dictionary, homogeneous variations and the Borel embedding;
- the reflex field;
- levels and the GL₂, Siegel and torus examples.

Canonical models are its §§4.4, 4.12 and 7.14. PELModuli §§M0.12 and M5.4 own the PEL Shimura datum and the scalar-determinant Hilbert datum with its trace embedding. Consuming them means superseding most of revision 3.

## What changed

- **74 nodes are superseded.** Each is recorded in the packet's `supersededNodes` with the exact upstream section and names, the atlas stage through which a packet now reaches it, and the reason the owner states the same target. The owners are:
  - ShimuraVarieties §§P.1–P.5, 0.1, 0.4 and 5.1;
  - PELModuli §M5.4;
  - ReductiveGroupsPartII §RG2.0a.3;
  - AdelicAlgebraicGroups §§1.3 and 4.3;
  - ArithmeticLocallySymmetricSpaces §§ALS.F.1 and ALS.0.1–0.2.

  `consumerRetargets` lists the 126 prerequisites in seven other packets that cited these ids, with their replacements.
- **49 nodes are retained.** Their prerequisites now point at the upstream owners, and five are narrowed to what upstream does not state:
  - `D0/hilbert-real-points`, `D0/hilbert-adelic-points`: the two Hilbert point comparisons;
  - `D2/unique-complex-structure`: the uniqueness half of Milne's Proposition 5.9;
  - `D5/siegel-reflex-dual`: the Lagrangian compact dual;
  - `D5/hilbert-star-datum`: the comparison of the PELModuli §M5.4 datum with the restriction-of-scalars datum.

  `D5/gsp4-pilloni-convention` now imports the GSp₄ lattices, corrected base and self-duality from ReductiveGroupsPartII §RG2.5. `D1/mumford-tate-group` is restated as the kernel of `O(GL(V)) → O(S)`, a Hopf ideal by Tau Ceti's `HopfIdeal.ker`, with two new API items (`mumfordTateHopf`, `mumfordTateComplexified`). `D3/kostant-representatives` gains `kostantKostantIndex`, identifying ^MW with ArithmeticLocallySymmetricSpaces §ALS.4.5's W^P.
- **Four new D4 nodes cover the generality** (all sourced to Milne SVI pp.63–66 and 86–88 and to Milne 2013, §8):
  - `D4/additional-axioms` (SV2*, SV4, SV5, SV6);
  - `D4/sv5-criterion` (Milne, Theorem 5.26);
  - `D4/pel-type`, which consumes PELModuli §M0.12;
  - `D4/connected-datum-lift` (Milne 2013, Proposition 8.8 and Corollary 8.9).

  `D4/type-implications` now proves PEL ⇒ Hodge ⇒ abelian ⇒ preabelian, and shows that the Hilbert datum over ℚ(√2) is of abelian but not Hodge type (it fails SV5).
- **New source finding ShimuraData/E18** (Milne SVI p.88). Milne asserts SV1–SV4 for every PEL datum, but SV3 fails for wholly definite unitary data of rank n≥2; PELModuli §M0.12 states the same correction independently. Milne's errata page has no correction for it. E1–E17 are unchanged, with their verdicts.
- **Gaps.** Three gaps are closed and recorded in `revision4.resolvedGaps`:
  - "cyclotomic valuation exceeds LF0": AdelicAlgebraicGroups §4.3 states the distances of p-adic roots of unity from one;
  - "real analytic point bridge": ArithmeticLocallySymmetricSpaces §ALS.F.1;
  - "five D0 prototypes".

  "Effective comodule descent" moves with the dictionary to ShimuraVarieties, recorded in `upstreamNotes`. "Central extension with prescribed derived cover" is a new gap, requested from RG2.1. There are now 8 gaps.
- **Requests.** There are 25. Seven were dropped because all their consumers are superseded:
  - AF.1, CM.0 and RG2.0;
  - ReductiveGroups layer 2;
  - LieGroups layers 2, 4 and 9.

  New requests import ShimuraVarieties:V0 (§§P.1–P.5), PELModuli:M0 and M5, AdelicAlgebraicGroups:AA.3 and AA.4, and ReductiveGroupsPartII:RG2.1. The AA.3 and RG2.1 requests each ask for one precise extension.
- **Baseline.** I pruned 27 citations that only superseded nodes used and added four, each read at the pins: `NumberField.IsTotallyReal`, `NumberField.IsCMField`, `TauCeti.HopfIdeal.ker` and `TauCeti.GeneralLinear.coordinateHopfAlgebra`. 22 remain.
- **Planets.** There are 19, at most six per layer, all named from the sources.
- **The README** is regenerated from the packet, with a new introduction, scope and ownership, conventions, a generality section, and per-layer framing. It also has tables of superseded targets, requests, gaps, source findings and the restructure proposal.

## The findings, one by one

- **REV-ShimuraData~3, the five D0 prototypes.**
  - Three are superseded, because upstream now states exactly the conclusions on the actual carriers. `deligne-points-topology` → RG2.0a.3 (`realPointsMulEquiv`, `isHomeomorph_realPointsMulEquiv`, `complexSplitting_real`, `conj_swap`). `deligne-lie-points` → ALS.F.1 + RG2.0a.3. `datum-map-points` → AA §1.3 + RG2.0 + ALS.F.1.
  - `hilbertRealPoints` now concludes the real comparison on the actual carrier: it identifies ℝ⊗_ℚF with ℝ^{Hom(F,ℝ)} and characterizes G*(ℝ) as the tuples with a common determinant, on GL₂(ℝ⊗_ℚF).
  - `hilbertAdelicPoints` concludes the adelic comparison on the actual carrier: 𝔸_{ℚ,f}⊗_ℚF ≅ 𝔸_{F,f} with the determinant locus.
  - Both signatures now conclude rather than assume their comparisons. The topology and Lie structure are left out with a comment, because the tensor-product carriers have no topology at the pins; AA §1.4 and ALS.F.1 own them.
- **REV-FIX-RT-AREA-algebraicgeometry~2.** It raised the same D0 defects, plus the failing elaboration (100 errors by line 883). I rewrote the suggested file from scratch. It **compiles**: `lean-check` at Mathlib 082e2d3 and Tau Ceti f790474 exits 0, with 109 `declaration uses 'sorry'` warnings and no other warning or error, and the file is 1,254 lines. Every definition has a real body; only proof fields of subgroups and Hopf ideals use `sorry`. 46 packet names are README-only targets because their carriers are not at the pins:
  - the D4 datum predicates;
  - the integral Bruhat and Schubert schemes;
  - the reflex descent;
  - uniqueness of the complex structure;
  - Mumford–Tate reductivity;
  - `compactDualTangent`, `hilbertReflexDual` and `kostantSequenceGeometry`.

  A closing section of the file lists each of them with its intended form. Every other declaration, API item and test name occurs in the file.
- **RT-AREA-algebraicgeometry/27.**
  - HodgeStructures L0 → D1: `rational-weight-criterion` and `mumford-tate-group`.
  - HodgeStructures L1 → D1: `mumford-tate-reductive`, `hodge-generic`.
  - HodgeStructures L1 → D3: the polarized variations.

  The outgoing edges to the other consumers (Selmer L4, Compactifications C1, AbelianSchemes A5) remain the maintainer's to install, as `upstreamNotes` records.

## For the maintainer

- **Restructure proposal** (packet `restructure`): rescope ShimuraData as building on ShimuraVarieties §§P.1–P.5 and PELModuli.
  - Reverse the atlas edges D5→ShimuraVarieties:V0, D3→ShimuraVarieties:V4 and D4→PELModuli:M0.
  - Move ShimuraData from tier 12 to after the PEL/ShimuraVarieties bundle (tier 13).
  - Retitle it "Shimura data, Part II: …", with ShimuraVarieties as parent.
  - Merge D0 into D5 and D2 into D3.

  Until then the packet cites tier-13 roadmaps, as the maintainer's instruction requires. The merger skips the cycle-creating cross edges and does not fail.
- **Consumers.** The seven packets in `consumerRetargets` (ShimuraVarieties, its V0 and V8 parts, and four others) cite superseded ids. The checker resolves node ids only through packets, so those references become unresolved prerequisites the next time those packets are checked. Each needs a follow-up fix that retargets them.
- **Notions moved.** None moved down. The dictionary, Hermitian components, data, reflex field, levels and examples moved *up* to ShimuraVarieties, where the upstream port already put them.

## What remains

All six stages are `planned`. The remaining items:

- D1: the finite-type representability input for the Mumford–Tate quotient.
- D3: holomorphic flat bundles and connections; integral flag geometry over ℤ (ReductiveGroups layer 9); parabolic-type representability for the reflex descent; the complex-manifold structure of the compact dual.
- D4: the finite-index half of Ono's theorem (AA.3 extension); the Milne–Shih central extension (RG2.1 extension).
- D5: the nonaffine Res_{F/ℚ}ℙ¹.

The coverage records list these precisely.

## Checks run

- `python3 scripts/check_blueprint.py --index …/declarations.tsv research/blueprint/packets/ShimuraData.json`: 0 errors, 0 warnings. It reports 53 nodes (11 definitions, 8 constructions, 20 lemmas, 14 theorems), 68 API items and 58 unit tests.
- `scripts/check_errata.py` on a scratch errata-v1 wrapper of the 18 findings and source versions: ok.
- `lean-check` on the suggested file: exit 0, only placeholder-proof warnings.
- The README agrees with the packet, because a script generates it from the packet.
- The packet's `review` object and `reviewHistory` are kept unchanged for the next reviewer.

## Sources read in this round

- Milne, *Introduction to Shimura varieties* (2017, SHA-256 f637e617…, same as recorded): Proposition 5.9 p.56; pp.63–66; §8 pp.82–88.
- Milne, *Shimura varieties and moduli* (SHA-256 7237c2a4…, same as recorded): §8, pp.509–513.
- The six upstream READMEs at the heads listed above. They were not copied; only section numbers and names are cited.

No source was missing.
