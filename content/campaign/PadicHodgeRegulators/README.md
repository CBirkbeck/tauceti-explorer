# p-adic regulators and the local K₃ calculation

One owner for étale/syntomic K-regulators and vector-valued Iwasawa regulators.

## Canonical ownership and interfaces

- Period rings and rational/integral comparison are supplied by PadicHodgeTheory and its integral Part II. [PhiGammaModulesAndIwasawaCohomology](../PhiGammaModulesAndIwasawaCohomology/README.md) PG.1–7 owns the étale equivalence, overconvergence, Herr/ψ comparisons and Wach existence. The regulator construction and its precise interpolation are owned here.
- ColemanIntegration supplies logarithms/polylogarithms and Frobenius continuation. D.3's unramified p>3 K₃→p²O is retained with the GSWZ normalization and derived completion; it does not generalize to ramified fields by scalar extension.

**Campaign dependencies:** [PadicHodgeTheory](../PadicHodgeTheory/README.md), [FiniteFlatGroupsAndIntegralPadicHodgeTheory](../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md), [PadicMeasuresIwasawaAlgebras](../PadicMeasuresIwasawaAlgebras/README.md), [LocallyAnalyticDistributions](../LocallyAnalyticDistributions/README.md), [SelmerIwasawaCohomology](../SelmerIwasawaCohomology/README.md), [ColemanIntegration](../ColemanIntegration/README.md), [MotivicEtaleKTheory](../MotivicEtaleKTheory/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

**Prefix:** D. **Dependencies:** V, P, L, M; p-adic analysis and local fields. **References:** GSWZ, *The Habiro ring of a number field*, v2 §3.1 and Theorem 9; Huber–Kings; Besser–de Jeu; Handbook II.3.

## D.1 — p-adic analytic functions with normalisations

Import logarithms, analytic continuation and p-adic polylogarithms from [ColemanIntegration](../ColemanIntegration/README.md), and prove the regulator-specific comparison of branch, Frobenius and modified-dilogarithm conventions used in GSWZ. The imported owner proves convergence, differential equations and distribution relations; D.1 verifies the exact normalizations and extension-of-scalars square, rather than reconstructing that analysis.

Teichmüller representatives, roots of unity, Frobenius and unit decompositions must be the existing local-field/Witt-vector objects. A branch of logarithm is not globally unique on a local field's units and uniformisers without a normalisation.

## D.2 — Étale and syntomic regulators

Construct the étale Chern regulator to continuous Galois cohomology, and a syntomic regulator in the exact smooth/unramified settings used here. Develop filtered de Rham complexes, Frobenius data and the syntomic mapping fibre. Establish the comparison with the étale regulator using the appropriate p-adic comparison theorem, including its hypotheses and any integral range restrictions.

In degree three and weight two compare the regulator with the explicit p-adic dilogarithm on V's Bloch-group model. Give the actual scalar/Frobenius normalisation. A map out of K₃ is not defined by an arbitrary linear functional on a free module of the right rank.

## D.3 — The unramified p>3 theorem

Let `L` be a finite product of finite unramified extensions of `Q_p`, and assume p>3. Define `K₃(L;Z_p)` using H's derived p-completion, and prove the product comparison. With the GSWZ normalisation, prove

\[
 D_p:K_3(L;\mathbb Z_p)\xrightarrow{\sim}p^2\mathcal O_L.
\]

The unramified hypothesis is inherited from the setup of GSWZ §3.1 and is part of the public statement. This is not asserted for arbitrary ramified extensions, for p=2 or 3, or for the uncompleted abelian group K₃(L).

The proof has four explicit parts. First identify completed K₃ with the appropriate local H¹ group and show it is free of rank equal to the total local degree. Second prove the dilogarithm's `p²` integrality with the stated hypotheses on z and `1−z`. Third compute its leading reduction modulo p by the finite-polylogarithm identity. Fourth show the values at the permitted roots of unity span the residue vector space, use Nakayama to obtain surjectivity, and conclude from equal ranks and torsion-freeness.

The roots-of-unity classes are constructed through V's valid coefficient-localised or integral multiples, with the comparison to the notation `[ζ]` used in GSWZ proved. Do not insert raw symbols into a Bloch kernel without checking their boundary.

## D.4 — Arithmetic localisation and Frobenius

For a number field F and p unramified in F, identify `F⊗Q_p` with its product of completions. Construct the localisation map from global K₃, compare with all local embeddings, and apply D.3. Prove compatibility with norm/trace and with Frobenius. Describe the image of a torsion class and of a rationally specified class with denominators controlled.

Export the regulator in the exact form used to define Habiro-module gluing, including its p-adic integral target and the scalar change between regulator conventions. Global finite generation and Borel rank do not imply that this localised map is injective; a higher p-adic regulator conjecture remains a distinct proposition.

## D.5 — Elliptic and higher-weight interfaces

Construct the degree-two syntomic regulator of a smooth proper curve under the chosen good-reduction hypotheses and compare it with the explicit symbol formula. Provide pullback, pushforward and specialisation formulas. State separately the additional logarithmic/syntomic input needed for bad or semistable reduction; it is not supplied by the unramified-field calculation.

This supplies a foundation for p-adic elliptic regulators, not a proof of every p-adic Beilinson or elliptic main conjecture. The real regulator theorem in ER remains independent of such conjectures.

## Tests

Compute D.3 for an unramified field and for a split product, checking componentwise Frobenius and traces. Verify the finite-polylogarithm congruence and the spanning argument by exact finite-field calculation, not floating-point approximation. Check that the theorem cannot be applied at p=3 or at a ramified field without a different hypothesis-bearing result. Check that the completed K₃ carrier is the same one used in L and HB.

## Scope and dependencies

Construct the local regulator theory needed by RJW §10.5 and Appendix B. The core output is a **vector-valued** regulator; a scalar p-adic L-function requires a period functional or refinement. Existing AdicSpaces/Fargues–Fontaine or new perfectoid/diamonds work may supply period-ring components, but their existence is not treated as a proof of crystalline comparison, the Bloch–Kato exponential, or a Perrin–Riou interpolation formula.

Depend on R01–R02 and R07.L0–L3. Geometric comparison for modular curves is owned by R11 and uses the local theory here; R09 does not depend on R11's final Galois-representation theorem.

## L0. Period rings and realizations

Import period rings, realizations, tensor/dual/descent statements and admissibility from [PadicHodgeTheory](../PadicHodgeTheory/README.md), with integral comparison from [FiniteFlatGroupsAndIntegralPadicHodgeTheory](../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md). Check that their Hodge–Tate, Frobenius, monodromy and logarithm conventions match the regulator. No additional period-ring carrier is introduced.

## L1. Bloch–Kato maps

Construct the exponential and dual exponential from the fundamental exact sequences. Prove their domains, kernels, local duality relation, twist compatibilities and the finite local condition. Work first over a finite extension of Q_p; then construct semilocal versions. These proofs supply the local-condition layer of R07 rather than presupposing it.

## L2. (phi,Gamma)-modules and Iwasawa cohomology

Import the analytic coefficient rings from PadicHodgeTheory's early annulus stage and the actual comparison engine from [PhiGammaModulesAndIwasawaCohomology](../PhiGammaModulesAndIwasawaCohomology/README.md) PG.0–6. In particular PG.5, not the word 'Herr', supplies identification of the ψ complex with the derived inverse limit of corestriction cochains. Here prove the regulator-specific choice-of-generator, twist, lattice and basis comparisons with SelmerIwasawaCohomology. PG.7 supplies only its hypothesis-bearing family comparison, not blanket base change for all Robba modules.

## L3. The big logarithm and explicit interpolation

For crystalline V construct

    L_V : H^1_Iw(Q_p,V) → H(G) tensor_K D_cris(V),

with G=Gal(Q_p(mu_(p^infinity))/Q_p) and H(G) its locally analytic distribution algebra. A Delta-isotypic component gives the corresponding H(Gamma) formulation. Include the standard choices and any auxiliary h used in a big-exponential version, prove their comparison, and prove the interpolation at every finite-order character and integral twist using Bloch–Kato exponential/dual exponential maps. Euler operators involving phi must be evaluated on their stated domains; a singular operator cannot be inverted without treating its kernel.

Prove linearity, Galois/weight equivariance, growth bounds, determinant/reciprocity formula, lattice integrality and scalar extension. Identify the rank-one Tate case with R04's Coleman map, with the chosen sign and Tate twist. For general V a scalar projection is an additional defined map; it is not canonical from V alone.

## L4. Signed and noncrystalline extensions

Using Wach bases construct the Coleman maps of Lei–Loeffler–Zerbes and the logarithmic matrix expressing the unbounded vector regulator in terms of bounded components. Prove the image descriptions and change-of-basis formulas of LLZ's regulator paper, including the integral refinements. The signed Selmer groups in R16 use these exact maps.

For de Rham (phi,Gamma)-modules construct the regulator on the character domain in Rodrigues Jacinto 2018, with its stated growth and interpolation range. This includes the route relevant to bad/infinite-slope modular forms. Do not replace that theorem by a globally defined scalar distribution on all character space for every de Rham representation. Record its comparison with crystalline Perrin–Riou theory where both apply.

**Acceptance:** the complete rank-one Coleman comparison; Bloch–Kato maps and local conditions; the vector-valued regulator and its explicit specializations; LLZ's bounded decomposition; the exact de Rham-domain theorem. The required geometric comparison remains a proved dependency supplied by R11.

## Shared conventions and sources

The programme conventions, dependency contracts, and source register are part of this specification. References such as RJW, Rubin, SU, and FW denote the precise sources and versions listed there. The mathematical milestones above, not a source-code inventory, define completion.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-padicreg"></a>

**KU-padicreg — p-adic and syntomic regulators.** Readiness checkpoint for original `padicreg`: verify completion and map-level compatibility of [PadicHodgeRegulators:D.1](README.md), [PadicHodgeRegulators:D.2](README.md), [PadicHodgeRegulators:D.3](README.md), [PadicHodgeRegulators:D.4](README.md), [MotivicEtaleKTheory:M.8](../MotivicEtaleKTheory/README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `localp`, `blochk3`, `motivic`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `D.3` | Use the same derived-completed K3 as local K-theory; prove H0(L,F_p(2)) vanishes for the unramified p>3 input, identify its H1 lattice, and then use finite-polylogarithm spanning and Nakayama. |
| `L3` | Construct the vector-valued regulator first; for every scalar projection record the actual crystalline eigenline/differential and prove its twist, growth and period comparison. |
| `L4` | Retain the logarithmic-matrix and Coleman-image modules until the chosen Wach-basis theorem computes them; singular Euler operators require kernel/cokernel or exceptional-zero data. |

**Producer–consumer handoff.** HabiroNumberFields HB.7 consumes the p²O-normalized local map only in its unramified p>3 range; modular and signed consumers need their separate crystalline/de Rham hypotheses.

**Acceptance.** Test a split unramified product, rank-one Coleman sign, a singular Euler operator and a ramified input rejected by D.3.

**Source-readiness boundary.** The residue-field spanning computation and regulator/Chern scalar comparison remain proof tasks; no global injectivity follows from the local theorem.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
