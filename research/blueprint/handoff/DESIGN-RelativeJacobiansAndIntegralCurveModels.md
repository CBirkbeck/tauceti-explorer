# Handoff: DESIGN-RelativeJacobiansAndIntegralCurveModels

Refs #11046. Claude (Opus 5.5), session `claude-c10lUP`, 19 October 2026. The bot confirmed the claim (comment 6274357621).

## What was done

This job designs a new roadmap, *Relative Jacobians and integral models of curves* (area `automorphic`, no parent). It has six layers and is planned at target level.

- `research/blueprint/roadmaps/RelativeJacobiansAndIntegralCurveModels.json` is the roadmap definition. Each stage's `requires` list is derived from its nodes' prerequisites.
- `research/blueprint/packets/RelativeJacobiansAndIntegralCurveModels.json` is the packet:
  - status `complete`, with 28 nodes: 5 definitions, 5 constructions and 18 theorems;
  - 90 API items, 40 unit tests and 25 planets;
  - 29 baseline declarations, each read at the pins;
  - 14 requests and no gaps;
  - every stage is `planned` with nothing remaining;
  - `sourceIssues` is empty: no mistakes were found in the passages read.
- `research/blueprint/readmes/RelativeJacobiansAndIntegralCurveModels.md` is the reader document, 878 lines. The introduction, scope table, boundaries, conventions, layer introductions, worked examples and acceptance tests are written by hand; the per-target sections are generated from the packet, so the two agree.
- `research/blueprint/suggested/RelativeJacobiansAndIntegralCurveModels.lean` is 132 lines and **compiled**: `lean-check` at the pins (Mathlib 082e2d3, Tau Ceti f790474) reports only 4 `declaration uses sorry` warnings. It contains:
  - the real-bodied structure `TauCeti.DedekindModel`, the model of a curve over a Dedekind domain, generalising `TauCeti.Model`;
  - `DedekindModel.ofModel` from Tau Ceti models over a discrete valuation ring, with a proved `example`;
  - the theorem `existsUnique_section` (points of proper models);
  - the two-chart Čech differential and the three two-chart Čech theorems for H⁰, H¹ and H^{≥2}, stated on Tau Ceti's `Scheme.Modules.Cohomology`.

  Everything else is a README target, because its carriers are not at the pins.

Checks run:
- `TAUCETI_BASELINE=… scripts/check_blueprint.py` reports 0 errors and 0 warnings.
- The dry atlas assembly, patching `build.load_promoted` to add this packet, document and definition, gives 5734 stages and 15183 stage edges, with no skipped (cyclic) links.
- The latent-cycle audit found that the proposed consumer edges are acyclic: ModularCurvesPartII R13.4a ← RJ.0, R14.2/R14.6 ← RJ.4/RJ.5, NeronModels R11.4 ← RJ.3, and EllipticCurveModularity R29.1 ← RJ.5.
- `research/blueprint/intake.py check-files` was run on all deliverables.

## Layers

- **RJ.0, integral models over Dedekind bases.**
  - Models (flat, finitely presented, with a generic identification), which localise to `TauCeti.Model`.
  - Points of proper models and specialisation; sections of regular models lie in the smooth locus (BLR 3.1/2).
  - The normalisation X_{F,t} of ℙ¹_S in a function field, on Mathlib's `Scheme.Hom.normalization`. Its properties when finite (Nagata or separable): integral, normal, separated, proper and flat; its generic fibre is AlgebraicCurves 12B's model, so closed points are places; H⁰ is the integral closure of R in the constant field.
  - The two-chart Čech formulas, from Tau Ceti's Mayer–Vietoris sequence and affine acyclicity.
  - H¹(X_{F,t}, O) = A₀∞/(A₀ + A_∞), whose torsion is the failure of cohomological flatness.
- **RJ.1, relative Picard of curves with arbitrary fibres.**
  - Degrees, multiplicities d_i, e_i and δ_i, and the index (BLR 9.1).
  - Over strictly henselian bases, the index kills the Brauer obstruction.
  - Rigidificators and Raynaud's rigidified Picard space (BLR 8.1/5–11, 8.3/3, 8.4/2).
  - The universal rigidified bundle and its restriction to represented subfunctors, with the normalisations (BLR 8.2/4).
  - Relative effective Cartier divisors and Abel maps (BLR 8.2/6–7, 9.3/3–5).
- **RJ.2, pointed smooth curves.**
  - Projectivity from the section.
  - J = Pic⁰ (imported from JacobianChallengePartII JC1) represents rigidified degree-zero bundles, with a normalised Poincaré bundle, and is the Néron model over a Dedekind base.
  - J(L) = Pic⁰(C_L) = Cl⁰(C_L), Galois-equivariantly.
  - Specialisation of divisor classes at good reduction.
- **RJ.3, Raynaud.**
  - The separated quotient P/E, in all three cases of BLR 9.5/3.
  - Raynaud's representability theorem (BLR 9.4/2–3).
  - The Néron model of the Jacobian from a regular model, with Pic⁰ = N⁰ under gcd one (BLR 9.5/1, 9.5/4).
  - The rational-singularities criterion and normal semistable curves (BLR 9.7/1–2).
  - The global Néron model over a Dedekind base.
- **RJ.4, reduction.**
  - The reduction homomorphism, with its identity-component and component-group pieces.
  - Injectivity on torsion for **every** separated commutative group scheme of finite type over a discrete valuation ring: on prime-to-p torsion always, and on all torsion when e < p − 1. The proof takes the schematic closure of the cyclic subgroup and applies Deligne's theorem and Raynaud's lemma (BLR 7.5/5), so no reduction-type hypothesis is needed. The μ_p example shows the bound is sharp.
  - The global form at every closed point.
  - The component of a divisor class's reduction, given by the multidegree of its closure (BLR 9.5/9, 9.6/1).
- **RJ.5, global.**
  - Regular proper models over excellent Dedekind bases, from the normalised model by Lipman's resolution (Stacks 0BGP; StableReduction Layer 4).
  - The specialisation package consumed by the Eisenstein-ideal study of J₀(N).

## Brief items and where they are

| Brief item | Where |
| --- | --- |
| relative Pic⁰ of a smooth proper curve with a section over a DVR/Dedekind base as an abelian scheme representing the rigidified functor | RJ.2/jacobian-rigidified-representability (imports JacobianChallengePartII JC0/JC1, AMAG section-picard-split) |
| generic points = Cl⁰ over K^s, Galois-equivariantly | RJ.2/jacobian-points-divisor-classes |
| reduction homomorphism; injective on prime-to-ℓ torsion and on ℓ-power torsion when e < ℓ − 1 | RJ.4/reduction-homomorphism, RJ.4/torsion-specialisation, RJ.4/global-torsion-injection (all primes, bad ones included) |
| general theory over the whole base: bad fibres through the Néron model, Raynaud's identity-component theorem for semistable curves | RJ.3 (general regular models; normal semistable in RJ.3/rational-singularities-criterion), RJ.4/component-multidegree, RJ.5 |
| representability package for subfunctors of the rigidified Picard functor with Poincaré bundle and zero-section normalisation | RJ.1/universal-rigidified-bundle, RJ.1/rigidificator, RJ.1/rigidified-picard-representability |
| relative effective Cartier divisors of degree r and the Abel–Jacobi map | RJ.1/relative-cartier-divisors, RJ.1/abel-map (pointed version included) |
| Čech formulas for H⁰ and H¹ over a two-affine cover | RJ.0/two-chart-cech, RJ.0/normalised-model-cohomology |
| normalisation of ℙ¹ over the base in a function field as an integral model; closed points of the generic fibre ↔ places | RJ.0/normalised-projective-line, RJ.0/normalised-model-properties (places imported from AlgebraicCurves 12B) |

## Ownership decisions (read before building on this)

- **JacobianChallengePartII**, accepted, already owns the relative Picard scheme, the relative Jacobian, Abel maps and Poincaré identities for smooth projective curves over noetherian bases. They are imported, never re-planned. The brief's "relative Pic⁰ … as an abelian scheme" is therefore an import plus the rigidified representing statement.
- **AlgebraicModuliForArithmeticGeometry A0-extension**, accepted, owns:
  - the relative Picard sheaf and its rigidification along a section;
  - Artin representability;
  - the Picard–Brauer obstruction;
  - Raynaud's condition N* and the degree-one cohomological-flatness criterion;
  - infinitesimal lifting of line bundles.

  All of these are imported.
- **NeronModelsAndSemistableAbelianVarieties** has an open gap, "Picard Raynaud", which is needed by R11.4/picard-zero, R11.4/picard-neron-identity and R11.4/intersection-component-quotient. This roadmap's RJ.3 plans exactly that, in general. To keep the stage graph acyclic, RJ.3 imports only R11.1–R11.3. RJ.4 imports R11.4/intersection-component-quotient. The `restructure` entry proposes that a fix of NeronModels import RJ.3 to close its gap.
- **HeightsRationalPointsAndObstructions RP.1/reduction-torsion-injective** is the good-reduction case of RJ.4. It is cited in text, not as a prerequisite, because the proof here does not use it.
- **Tau Ceti ModularCurves (main, 337f504)**:
  - Its Layer 10 constructs X_H by normalising the j-line; RJ.0's construction is the general version, and the compatibility appears as an API item.
  - Its "Mazur interface" names an unbuilt owner for "J₀(N) and its Néron model, Pic⁰ of the regular model, component groups at N". This roadmap supplies the general theory. The maintainer may want to tell upstream.
- **Upstream SchemeAndStackFoundations**, merged on TauCetiRoadmap main, is cited through the atlas stages SF.0, SF.1, SF.2 and SF.4, with requests. SF.1 is asked for "separated group algebraic spaces over a DVR are schemes" (BLR 6.6/3) and for quotients by flat subgroups (BLR 8.3/9). No atlas node states these.
- **Lang's theorem**, used for A(K)/N⁰(R) = Φ(k) over finite k, is cited from ReductiveGroupsPartII:RG2.3/lang-theorem, whose packet is not yet accepted.

## Requests made

There are 14 requests, all to stages:
- SchemeAndStackFoundations SF.0, SF.1, SF.2 and SF.4;
- Tau Ceti StableReduction Layers 0, 4 and 5;
- AlgebraicCurves Layer 12;
- ModularCurves Layer 10;
- JacobianChallenge Layers A, B, C, D and F.

Each request states the exact need.

## Consumers to connect (follow-ups)

- **EisensteinIdealAndRationalTorsion** is being designed concurrently (#11045, Codex). It should import:
  - RJ.0/proper-model-points, for rational points specialising to cusps;
  - RJ.2/jacobian-points-divisor-classes, for the cuspidal class;
  - RJ.4/component-multidegree, RJ.4/global-torsion-injection and RJ.5/specialisation-package.

  It should plan only the modular inputs: the Deligne–Rapoport model, the moduli interpretation of the cusps, and Ogg's computation.
- **ModularCurvesPartII** R13.4a/R14.2/R14.6 should import RJ.0/normalised-projective-line and RJ.5/specialisation-package.
- **NeronModelsAndSemistableAbelianVarieties**: the fix that closes "Picard Raynaud" (see above).

## What remains

Nothing remains in scope. The plan is at target level, so lemma-level refinement is a later job, when the roadmap nears the front of the line. That refinement includes:
- splitting BLR 9.5/4's finite-type proof (Lemmas 7–11);
- splitting the three cases of BLR 9.5/3;
- the Greenberg-functor step of BLR 9.6/1 for imperfect residue fields.

## Sources

- **Bosch–Lütkebohmert–Raynaud, *Néron Models*.** Read from the maintainer-cleared copy (printed page = PDF page − 9):
  - Chapters 8 and 9 in full;
  - §§1.1–1.2 and 1.4;
  - §3.1;
  - §7.5.

  Nothing was copied; every statement is in my own words, with numbered statement and page.
- **The Stacks Project.** Every cited tag was fetched and checked on 19 October 2026.
- **Upstream TauCetiRoadmap main (337f504).** The JacobianChallenge, SchemeAndStackFoundations, StableReduction, ModularCurves and AlgebraicCurves READMEs were read via the GitHub API.
- **Not read.** Katz's appendix to Lang, Invent. Math. 62 (1981), is not on an allowed host, so it is not cited. Kleiman's *The Picard scheme* was not needed. Mazur's papers were not read: they appear only in `uses`, through Tau Ceti ModularCurves' Mazur interface, and no Mazur statement is cited as a source.
