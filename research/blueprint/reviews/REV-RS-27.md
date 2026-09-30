# REV-RS-27 — independent restructuring review

Verdict: **accepted**, with three forwarding links added. Refs #853. Reviewer: Claude Code, session
`cc-58621d`, 29 September 2026. Proposal author: Claude Code, session `cc-fb70e5` (#3954). This session
did not write RS-27 and has no other work on this family.

## 1. The decision

`AlgebraicModuliForArithmeticGeometry` (AM) is kept with its title. It is not declared an extension of
either anchor, Tau Ceti *Modular curves* (MC) or *Stable reduction* (SR). This is the case PROTOCOL §15
names in its fifth rule: "A general theory that subsumes special cases an existing roadmap builds (say,
general algebraic spaces over the finite-quotient constructions of Modular curves) builds on those cases:
it cites them, proves its general statements compatible with them, and does not construct them again".

AM's own R09.3 already says "Compare with the finite étale quotient construction of #81 instead of
replacing it". And AM does not continue MC in MC's own direction; ModularCurvesPartII does. So `keep` is
right, and no extension frontier arises.

## 2. What was checked

I read the following:
- AM's document in full, and all twelve of its stages (nine are listed in the proposal; R09.7b–R09.7d
  are unchanged);
- the seventeen owner records, the thirty-one links, the family file and the report;
- every anchor layer the proposal names: MC 0C, 0E, 0F, 0G, 1E, 4A, 4C, 7B, 7D, 9A, 9D and 9E, and SR
  layers 2 and 4.

**The anchors own what the owner records say.**
- **SR layer 2** proves, "over locally Noetherian bases", coherent pushforward under proper morphisms,
  the full cohomology-and-base-change theorem, Grauert's theorem and upper semicontinuity. Only then does
  it derive the curve statements. So A0-extension rightly keeps only the non-Noetherian,
  finite-presentation extension.
- **SR layer 4** constructs the Rees-algebra blowup as a relative Proj, with its universal property,
  charts, exceptional divisor and strict transform.
- **MC 0F** is the general finite-locally-free Weil restriction ("if Z ⟶ S is finite locally free and
  X ⟶ Z is affine of finite presentation ...").
- **MC 0G** builds "the relative Grassmannian of locally free rank-N quotients" of a group scheme's Hopf
  algebra, which is a finite locally free module. The report already flags this generality point: if the
  implementation specializes to Hopf algebras, R09.1 still imports it and states the module version as a
  thin generalization.
- **MC 4A** says itself that it "is not a general theory of algebraic stacks", which matches R09.4
  keeping general stacks and comparing them with Ell/R.

**Conservation.**
- Each of the eight narrowed layers states in `keeps` exactly what remains, and every moved piece has one
  anchor owner:
  - P(E), smoothness, the Plücker immersion, flags and boundedness stay in R09.1;
  - the general Hilbert, Quot, Hom and Isom schemes and the Chow-lemma package stay in R09.2;
  - general algebraic spaces, Weil restriction as an algebraic space and fppf descent of polarized
    projective schemes stay in R09.3;
  - general stacks stay in R09.4;
  - the finite-inertia coarse-space theorem stays in R09.5;
  - the stack-level deformation comparison and Artin's criterion stay in R09.6;
  - transforms and marked ideals stay in R09.7a;
  - the non-Noetherian and Picard parts stay in A0-extension.
- Nothing is dropped. R09.7's atlas description contains the whole R09.7a–R09.7d section, so listing
  it under `formerly` for the blowup owner is consistent.

**Structure.**
- `scripts/check_restructure.py` passes.
- On the current assembled atlas (`d62a8362`), five links already exist, and the union with all links,
  including the three added below, is acyclic.
- The anchors are unchanged; only links out of their layers are added.

**Links to a roadmap not yet in the atlas.** The links MC 0G → `MordellLawrenceVenkatesh:LV.3` and
`LV.7` name a designed roadmap. DESIGN-LV and its review are done, and its README is in
`research/blueprint/readmes/`, but it is not yet in the atlas. `scripts/restructure.py` records such
links under `skippedLinks` and applies them at the first build after the roadmap's stages exist. They
are correct and need no change.

## 3. Forwarding: three links added

§15: every layer that relied on a narrowed layer gets a link from the new supplier. The report adds
links for outside consumers that used a moved piece, and argues that the other consumers use only what
AM keeps.

I checked every consumer of each narrowed layer that has no link from a supplier. For each I asked
whether it reaches the supplier by a path avoiding the narrowed layer, and read its description where it
does not. Most use only kept parts; some keyword matches were false leads:
- an elliptic curve used as a test example in AbelianSchemes A6;
- analytic descent in A0-extension;
- general quotient stacks in R09.4;
- ComplexComparisonPartII C3's own coherent descent.

Three later AM layers did rely on moved pieces and had no link. I added them:

| Link | Why |
| --- | --- |
| SR layer 2 → R09.2 | The projective Hilbert and Quot constructions use relative ampleness, projective morphisms and relative Proj, which R09.1 no longer owns. |
| MC 1E → R09.4 | The algebraicity of the moduli stack of elliptic curves uses effective descent of elliptic curves with their polarization, group law and level structures, which R09.3 no longer owns. |
| SR layer 4 → R09.7b | The local invariant and maximal-contact argument works on the Rees-algebra blowups and charts that R09.7a no longer owns. |

Each is a shortcut of an existing path (supplier → narrowed layer → consumer), so no cycle can arise.
The full set of 34 links was re-tested and is acyclic. The report's outside-consumer links and its list
of consumers served by what AM keeps are right as they stand.

## 4. Notes for the orchestrator

1. The report points out a duplicate outside this family. ReductiveGroupsPartII RG2.0a claims affine
   restriction of scalars along a finite locally free base, which is MC 0F's. RS-27 correctly only adds
   MC 0F → RG2.0a; RG2.0a's own family should narrow it.
2. Blueprint requests still aimed at AM should be redirected when their packets next change:
   SchemeKTheoryOperations S.5 (blowups) and LocalGaloisDeformationRings L7 and MordellLawrenceVenkatesh
   (Grassmannians).

## 5. Checks and inputs

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-27.result.json`: ok, before
  and after the correction.
- Graph and forwarding checks were run on the atlas as `scripts/build.py` assembles it at `d62a8362`.
- Intake file validation on the two deliverables: 0 problems.
- **Changes to the proposal.** Three links and the `review` object were added; nothing else changed. The
  file keeps its one-space indentation.

Pre-review inputs at `d62a83628143b0c886bec9cae9af7cc730062a72` (SHA-256):

| Input | SHA-256 |
| --- | --- |
| RS-27.result.json | `08bb7c17cac4857d0c594f70d900b7540b4067e68e50726b03ce30f184a652cd` |
| RS-27.md | `2be241cf63366dcb5c30a7a8b17e203257258aba6ed88e6f10bfa466f98ec1ed` |
| RS-27.json | `0015a98ceef6351187d00af34bee6f803a297890414405e58e054571a7bc6179` |
| AlgebraicModuliForArithmeticGeometry/README.md | `a137c6fcec0a00edaca46278b6212d97255fa43230f3fef239a13b24793bc3b4` |
| tau-ceti/ModularCurves/README.md | `18da17ea4e8b66b9cfc2a2227f99b5c5aeae4ecb52afd97cbccd72ed29c2e2e6` |
| tau-ceti/StableReduction/README.md | `bba0dac4b46eddafe48fa25fdd78b4816147698d0fb8223050d3ea3fb4cdaf73` |
| data/atlas.json | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |

No Lean file is a deliverable; no Lean was run.
