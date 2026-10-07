# Handoff: BP-ArithmeticGaloisRepresentations (issue #676)

Agent: **Claude** (Claude Code, Opus 5.5), session **claude-UMyMEf**. Date: 2026-10-07.

## Status

The packet `research/blueprint/packets/ArithmeticGaloisRepresentations.json` is **complete**: every stage
in scope (G7, R01.1–R01.6) is **planned** at target level, none is closed (each keeps recorded gaps or
refinements). It goes to its independent review.

- **Nodes:** 132 (60 theorems, 30 definitions, 28 constructions, 8 lemmas, 3 comparisons, 3 applications):
  R01.1 24, R01.2 19, R01.3 15, R01.4 14, R01.5 13, R01.6 14, G7 33.
- **API items** 504, **unit tests** 278 (every definition and construction has recorded uses, at least 6 API items and at
  least 4 tests, at least one of which a plausible wrong definition fails).
- **Planets** 40 (six per layer except R01.5 and R01.6, which have five).
- **Baseline declarations** 236, each read in the pinned Mathlib 082e2d3 / Tau Ceti f790474 source.
- **Requests** 70 (60 to Tau Ceti layers; IHG.1 ×3, ReductiveGroupsPartII RG2.2, AutomorphicLFunctionsAndLocalFactors
  AL.1, DeligneWeightsAndPurity DWP.3, InverseGaloisAndArithmeticFundamentalGroups IG.1, AbelianSchemesAndArithmeticModuli A3,
  ArithmeticGaloisDuality R02.4, PadicHodgeTheory R06.2).
- **Gaps** 24, **source issues** 30 (E101–E769), **restructure proposals** 5.
- `python3 scripts/check_blueprint.py` (with the pinned declaration index): **0 errors, 0 warnings**.

The roadmap document `research/blueprint/readmes/ArithmeticGaloisRepresentations.md` is rendered from the packet
(every node's statement, hypotheses, proof route, prerequisites, uses, API, tests, acceptance and sources) together
with an introduction (scope, ownership, conventions, layer table, required examples) and a prose section per layer.

## Kept, added and dropped node ids

- Kept from the reviewed decomposition (consumers cite them): `R01.1/continuity-descent-and-lattice-independence`
  (now a theorem), `R01.2/grothendieck-monodromy-and-the-weil-deligne-functor` (now the construction 8.4.2–8.4.3; Théorème 8.2 is
  `R01.2/grothendieck-quasi-unipotence`), `R01.2/tame-inertia-and-fundamental-characters`,
  `R01.3/artin-conductor-with-its-wild-part`, `R01.4/dickson-classification-and-the-dyadic-refinement` (now a theorem),
  `R01.4/bad-dihedral-representations-and-the-oddness-criterion`, `R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`,
  `G7/enormous-image-and-its-coefficient-extension-invariance`.
- Dropped: `R01.6/tate-modules-isogenies-and-the-tate-conjecture-over-number-fields` (Faltings' Sätze 3–6). These are the
  obligations of FaltingsFinitenessAndIsogenyTheorems R28.4–R28.6, which consume R01.6; its acceptance checks are realised by
  `R01.6/determinant-and-oddness` and `R01.6/comparison-with-weierstrass-local-polynomial`.
- Added beyond the first skeleton: `R01.2/ell-adic-tame-character`, `R01.3/residual-elliptic-conductor-away-from-ell`,
  `R01.5/prescribed-quadratic-residue-symbols`, `R01.5/brauer-class-of-an-absolutely-irreducible-representation`,
  `G7/similitude-groups`, `G7/operations-on-polarized-representations`, `G7/characteristic-zero-enormous-subgroups`,
  `G7/cg20-big-image-examples`.

## Red-team findings handed to this job

- **RT-AREA-langlands-1/6 (high).** `R01.3/ogg-formula` states v(Δ_min) = f(E) + m − 1 in every residue characteristic,
  with prerequisites Tau Ceti EllipticCurves layer 4 (Tate's algorithm, ReductionSymbol, algorithmic exponent), StableReduction
  layers 4–5, the NeronModels nodes `R11.2/minimal-regular-smooth-locus`, `R11.2/kodaira-geometric-configurations`,
  `R11.2/kodaira-component-groups`, `R11.2/wild-kodaira-comparison`, and R01.6 (`R01.6/tate-module-of-an-abelian-variety`,
  `R01.6/elliptic-tate-module-comparison`). Saito's conductor–discriminant theorem is its own node
  `R01.3/saito-conductor-discriminant`, with the gap "Saito's conductor–discriminant theorem and its inputs" naming what has no
  owner (étale cohomology of the fibres of a relative curve over a DVR with the specialisation identity, Deligne's discriminant).
  Residue characteristic ≥ 5 is closed by a direct case check; 2 and 3 rest on the Saito node and are recorded, not dropped.
  The elliptic conductor comparison lives in R01.3, which imports R01.6 (new edge R01.6 → R01.3); R01.6 cites nothing of R01.3.
- **RT-AREA-langlands-1/17 (medium).** `R01.1/brauer-nesbitt` (any field, characteristic polynomials; traces when dim! is
  invertible) is proved from IntegralHeckeAndGaloisDeterminants: the Amitsur formula and determinant nodes of IHG.0 and the
  reconstruction over k̄ of IHG.1, plus descent to an arbitrary field. IHG.1 has no reconstruction node yet, so the stage is cited
  with a request asking IHG.1 to export it (with uniqueness proved without Brauer–Nesbitt). Lattice independence
  (`R01.1/continuity-descent-and-lattice-independence`) uses it.

## Maintainer-added sources

All twenty routes were covered in the stages they name. Items the target stages cannot state, and where they go:

- Decomposed genericity (ACC+ Lemmas 7.1.5, 7.1.6(3)–(5), 7.1.7; Caraiani–Newton Lemma 6.2.2; the decomposed-generic clause of
  BCGNT Definition 5.2.1; Qian items 027, 089, 121): defined at AutomorphicGaloisRepresentationsPartII AG2.7, which requires G7,
  so they belong to PotentialAutomorphyInfrastructure PA.5 (as PAPER-QIAN-23 routed its own). G7 plans the image-theoretic part
  of BCGNT 5.2.1 (`G7/taylor-wiles-image-conditions`).
- NT26 non-CM strong irreducibility, Proposition 5.4 and Theorem 5.9 need automorphic input (route to AutomorphicGaloisRepresentations
  R19.3 / the Newton–Thorne consumer); the Sen operator lemma is requested from PadicHodgeTheory R06.2.
- ACC+ Lemma 7.1.8(2) needs crystalline input; only its finite-group facts are planned (R01.4).
- BCGP25 §10.2.3, algebraic-Hecke-character part, needs p-adic Hodge theory; its Clifford part is `R01.5/potentially-abelian-representations`.
- Richard–Yafaev item 13: Serre's ℓ-independence and connectedness are `R01.6/serre-independence-and-connectedness`; the third clause
  (images in the Mumford–Tate group, Deligne's absolute Hodge theorem) has owners ShimuraData D1 and AutomorphicBundles B1 that consume
  R01.6, so citing them closed stage cycles: recorded as a gap with restructure proposal R01.6-RS3.
- Richard–Yafaev item 14: Noot's specialisation isomorphism is `R01.6/noot-specialization`; Serre's complement (Noot Prop. 1.3, equal
  images at some closed point) needs Hilbert irreducibility for ℓ-adic Lie quotients, owned by InverseGalois IG.2, which depends on
  R01.6: gap plus restructure proposal R01.6-RS4. Noot Cor. 1.5 uses Faltings and belongs to FaltingsFinitenessAndIsogenyTheorems.
- Kisin–Zhou E10 is `R01.5/curve-recognition-from-an-open-subset` (DWP.3 closed-point Chebotarev, cited as a stage with a request).

## Consumer requests

Every request addressed to these stages in other packets (89 in total) was answered by a node or by a note. Misrouted ones, to be
re-addressed by their packets: ClassicalSerreModularity R27.3's request to R01.3 for odd absolutely irreducible residual
representations (R01.4); GL2ModularityLifting R22.1's request to R01.3 for S-type image facts (R01.4); ClassicalSerreModularity
R26.1's request to R01.5 (R01.2, R01.3 and ClassFieldTheory); SerreWeightAndLevelOptimisation's request to R01.6 (Serre weight at 2
and local class field theory of Q₂); EllipticKTheory E.5's request to R01.1 for continuous cohomology of Gal(F̄_q/F_q)
(ArithmeticGaloisDuality R02.1 / Tau Ceti ProfiniteCohomology); GL2ModularityLifting R32.3's request that geometric characters are
finite order times cyclotomic powers (PadicHodgeTheory). AbelianSchemesAndArithmeticModuli asked G7 for induction, which is
`R01.1/continuous-induction` (see below).

## Stage edges and cycles

The packet adds 80 stage edges (mostly from Tau Ceti layers). A stage-graph check over data/atlas.json, all packets and the accepted
restructurings found two cycles through these stages:

1. **New, G7:** G7 → AbelianSchemesAndArithmeticModuli A6 (A6's packet node `tate-module-of-a-weil-restriction` cites G7 for induction)
   → FunctionFieldArithmetic FA.5 → DeligneWeightsAndPurity DWP.4 → … → PadicHodgeTheory R06.2 → G7. The R06.2 → G7 edge is required by the
   maintainer's route for the Patrikis lifting theorem (and by `G7/unequal-weight-tensor-irreducibility`). The A6 edge is misrouted
   (induction is R01.1's); restructure proposal R01.6-RS1 asks A6 to cite A4 and `R01.1/continuous-induction` instead, which removes it.
2. **Pre-existing, R01.6:** R01.6 → NeronModels R11.3 → SchemeAndStackFoundations SF.4 → DerivedDeRham DD.2 → … → AbelianSchemes A3 /
   FiniteFlatGroups R07.1 → R01.6. It exists without this packet (it runs through other packets' node edges) and is reported for those
   packets' reviews.

## Gaps (24) and what remains per stage

The coverage records list the refinements; in short:

- **R01.1:** reductive (Ĝ-valued) integral models need Ĝ-pseudocharacters/Lafforgue reconstruction and Larsen's Lemma 2.4 (two gaps; the GLₙ
  targets do not depend on them). Replace stage prerequisites by node ids once IHG.1, LocalFieldsRamification and RG2.2 export them.
- **R01.2:** Deligne's local-constant existence proof needs the functional equation of Artin L-functions of number fields (no owner);
  archimedean and equal-characteristic constants have no owner. Serre–Tate 1968 and Tate's Corvallis survey were not read.
- **R01.3:** ramification filtrations over perfect infinite residue fields (proposal: LocalFieldsRamification, Part II), Saito's theorem
  and its inputs, and the comparison of the class-field-theory character conductor with the Artin conductor.
- **R01.4:** Dickinson 2001 Lemma 42 and Dieudonné (automorphisms of PSL₂/PGL₂) not read; Dickson's proof decomposes into lemma nodes at
  lemma level.
- **R01.5:** Nekovář Prop. 3.10 (behind BCGP25 4.11.1) not read; "analytic subsets with empty interior are Haar-null" has no owner.
- **R01.6:** ℓ-independent integral characteristic polynomial of endomorphisms on V_ℓA (g > 1) and freeness over E ⊗ Q_ℓ are planned in A6,
  which consumes R01.6 (proposal R01.6-RS1); Weierstrass curves as one-dimensional abelian varieties have no owner; Mumford–Tate containment
  and Serre's complement (above); Serre's original independence/connectedness proofs not read (placement check, proposal R01.6-RS2).
- **G7:** the GHTT adequacy theorem (uses the classification of finite simple groups), Ext computations behind GHT17 Cor. 9.4,
  Cline–Parshall–Scott Lemma 2.7(c), the Magma computations of BCGP21 §7.5, Thorne 2024 Lemma 7.3, Borel's Zariski-closure facts and
  Gan–Takeda Lemma 6.1 were not read or certified.

## Source issues

30 entries. New ones found by this job include E101 (CG20 p. 843 uses a GSp₄(O)-valued model that Prop. 6.8 does not supply), E201–E202
(Deligne 1973 misprints in (8.12.2) and the rescaling lemma), E401 (Serre 1987 §3.3 skips the reducible indecomposable case), E501
(Chenevier Definition 2.19: the two definitions of split are not equivalent; counterexample ℝ[Q₈] on ℍ), E754 (BLGG13 Prop. A.2.1
wrongly excludes projective image PGL₂(F₅): H¹(GL₂(F₅), ad⁰) = 0) and E765 (BCGP21 Remark 7.5.23: the order-128 Sylow subgroup of
Sp₄(F₃) is enormous), each with its check. The others carry recorded extraction findings with this job's own verification.

## Sources

Read (URLs and hashes in the packet): Deligne 1973 (IAS scan, page images for displays), Deligne 1974 (Numdam), Serre 1987, Serre 1972
(GDZ), Deligne–Serre 1974, Khare–Wintenberger I and II, Dieulefait–Pacetti, ACC+, Chenevier, DDT, Milne (AV, EC), Dickson 1901,
Ribet 1976, Brumer–Kramer 1994, Ulmer (arXiv:1307.4525), Liu 1994, CG18, CG20 (with appendix), CT17, CDT, FSY, BHKT, Kisin–Zhou,
Caraiani–Newton, NT26, Qian, BLGGT, BLGG13, CHT08, GHT17, Thorne 2012, BCG25, BCGNT, BCGP21, BCGP25, Patrikis, Masser–Zannier,
Richard–Yafaev, Noot 1995, Ribet 1992, Bennett–Siksek 2020, Serre 1981 (Chebotarev density), Gee–Newton 2022, Khare–Thorne 2017,
Newton–Thorne 2023, Thorne 2017, the GHTT appendix, and Serre's *Corps locaux* and *Facteurs locaux* passages where freely available. Not obtained: Tate 1979 Corvallis (the AMS
server refused every request), Livné 1989, Saito 1988, Ogg 1967, Serre–Tate 1968, Serre Œuvres IV nos. 133/135/136, Larsen–Pink 1992,
Dickinson 2001, Dieudonné, Nekovář, Cline–Parshall–Scott, Thorne 2024, Gan–Takeda, Borel.

## Suggested Lean file

`research/blueprint/suggested/ArithmeticGaloisRepresentations.lean`: a shared prefix (the carrier `TauCeti.ContinuousRep Γ A M` with
explicit finite-projective and module-topology hypotheses and joint continuity, morphisms, isomorphisms, characteristic polynomial,
determinant, characters, restriction, absolute irreducibility, semisimplification, integral models, local embeddings, inertia,
Frobenius polynomials, complex conjugation, the cyclotomic character, and Weil–Deligne representations), followed by one section per
layer with every definition, API item (as a lemma or definition signature) and unit test (as an `example`), and the theorems, all
proved by `sorry`.

**Compiled.** `lean-check` (`lake env lean` in the shared build at Mathlib 082e2d3) elaborates the file with no errors and no warnings
other than `declaration uses 'sorry'` (826 of them). The file imports Mathlib modules only: the shared build has no Tau Ceti
`NumberTheory`/`RepresentationTheory` oleans, so Tau Ceti declarations cited by the packet are named in docstrings, and the
abelian-variety statements of R01.6 use a minimal stand-in carrier that the Tau Ceti JacobianChallenge/AbelianSchemes carriers replace.
All 782 API and unit-test names of the packet occur in the file; 71 of them (about 9%) are given as comment blocks with their statement
because Mathlib lacks the vocabulary (étale local systems, Hodge–Tate weights, identity components of algebraic groups, the Weil group);
the theorem nodes `R01.3/saito-conductor-discriminant`, `G7/unequal-weight-tensor-irreducibility`, `G7/lifting-projective-representations`
and `G7/transfer-of-determinants-to-representations` are comment blocks for the same reason, and several multi-part theorems state their
main parts, with the omitted parts named in the docstrings.

## Where to resume

The review checks the packet as it stands. Follow-up work: close the gaps above as their owners export nodes; apply the five restructure
proposals (LocalFieldsRamification Part II; R01.6-RS1 re-pointing A6; RS2 placement of Serre's theorem; RS3 Mumford–Tate containment
downstream of D1/B1; RS4 Serre's complement at IG.2); replace stage prerequisites by node ids where suppliers gain packets.
