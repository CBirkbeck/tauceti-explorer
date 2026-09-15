# Drinfeld modules, t-motives and characteristic-p special values

## Scope and status

Let A be functions on a smooth projective F_q-curve regular away from a chosen place infinity. A Drinfeld module includes a characteristic map A -> L; its characteristic prime is distinct from the rational prime p. The t-module branch initially uses A=F_q[t]. Generic characteristic, special characteristic, algebraic closure and analytic completion are explicit parameters.

Status: curriculum specification, with established theorem targets and explicitly source-gated extensions. This document does not certify formalized proofs or a complete proof-interior source audit. Each AI proof ticket must replace its source route by an inspected theorem/lemma locator, enumerate intermediate lemmas, search the pinned library, and prove the actual geometric or analytic object has the exported properties. A structure field assuming the conclusion is not completion.

## Stages

### DM.0. Additive polynomials and Drinfeld modules

**Inputs:** `FunctionFieldArithmetic:FA.1`.

**Construction and export:** Construct the Ore ring L{tau}, with tau a=a^q tau, and identify it with F_q-linear polynomial endomorphisms of G_a. Define a rank-r Drinfeld A-module with constant term the characteristic map and degree r deg(a) for nonzero a, recording the degree normalization at infinity. Define morphisms, isogenies and kernels as group schemes. Generalize to bases using line bundles and invertibility of leading coefficients; do not mistake a field formula for a moduli functor.

**Acceptance:** For A=F_q[t], the Carlitz module t -> theta+tau tests rank, multiplication and kernel degree; a special-characteristic example detects inseparability.

**Source route:** Drinfeld Elliptic modules; Rosen Chapter 13.

### DM.1. Torsion, Tate modules and Galois actions

**Inputs:** `DrinfeldModulesAndTModules:DM.0`, `SchemeAndStackFoundations:SF.2`.

**Construction and export:** Construct ideal torsion and prove finite flatness of the appropriate degree, then etaleness away from the characteristic ideal. For each nonzero prime lambda different from that ideal, form the inverse system of lambda-power torsion over a separable closure and prove the Tate module is free of rank r over A_lambda with continuous Galois action. Keep the characteristic-prime local object separate: its connected part cannot be recovered from separable points.

**Acceptance:** Compare the scheme-theoretic kernel with separable torsion points at and away from characteristic; verify the rank after an isogeny and account for its finite cokernel.

**Source route:** Drinfeld torsion theory; Rosen Chapter 13; SF.2 finite-flat and etale descent.

### DM.2. Analytic uniformization and lattices

**Inputs:** `DrinfeldModulesAndTModules:DM.0`, `FunctionFieldArithmetic:FA.2`.

**Construction and export:** Over the completed algebraic closure C_infinity of K_infinity with its standard generic characteristic embedding, construct the entire exponential from the functional equation, prove convergence and surjectivity, and identify its kernel as a discrete projective A-lattice of rank r. Construct the inverse lattice-to-module functor and prove independence under homothety. Restrict automatic uniformization to this field setting; t-modules and families over Tate algebras require separate uniformizability hypotheses.

**Acceptance:** Compute the Carlitz exponential recurrence and period lattice; a lattice with nonprincipal ideal class tests projectivity rather than an unjustified free-basis choice.

**Source route:** Drinfeld analytic uniformization; Rosen Chapters 12--13.

### DM.3. Moduli, modular forms and compactification

**Inputs:** `DrinfeldModulesAndTModules:DM.1`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.4`.

**Construction and export:** Construct the moduli stack and sufficiently fine prime-to-characteristic level schemes, prove their representability and smoothness in the stated open base, and define Hecke correspondences. Follow Pink for generic-fiber Satake compactification via generalized Drinfeld modules, uniqueness and the ample line bundle of modular forms. Integral compactification over A with inverted level is a separate source-selected extension; do not infer it or a full explicit boundary stratification from the generic-fiber theorem.

**Acceptance:** Rank one and rank-two principal level test stabilizers, dimension and cusp behavior; verify pullback/pushforward of modular forms under one change-of-level map.

**Source route:** Pink arXiv:1008.0013; Drinfeld level moduli; exact scheme-level restrictions reconciled before proof execution.

### DM.4. t-modules and effective t-motives

**Inputs:** `DrinfeldModulesAndTModules:DM.0`.

**Construction and export:** For A=F_q[t], construct an Anderson t-module on G_a^d with differential theta times identity plus a nilpotent operator. Define its motive by F_q-linear maps to G_a, including the contravariant convention, tau action and finite-generation requirements. Prove the equivalence with the appropriate effective Anderson motives in the abelian range by constructing inverse functors and Hom maps. Purity, rigid analytic triviality and uniformizability are additional properties, not automatic for every t-module.

**Acceptance:** The Carlitz motive and its tensor powers test dimension/rank conventions; include a nonabelian t-module to test that finite-generation hypotheses are actually used.

**Source route:** Anderson t-Motives, definitions and equivalence theorem; theorem-locator reconciliation required before ticket activation.

### DM.5. Isogenies and the Tate theorem

**Inputs:** `DrinfeldModulesAndTModules:DM.1`, `DrinfeldModulesAndTModules:DM.4`.

**Construction and export:** For Drinfeld modules of the same characteristic over a field finitely generated over F_q and lambda away from characteristic, construct the natural map Hom_L(phi,psi) tensor_A A_lambda -> Hom_Galois(T_lambda phi,T_lambda psi). Prove injectivity and then surjectivity by the Taguchi/Tamagawa motive route with its exact source hypotheses. Treat semisimplicity of the rational Tate representation as a separate theorem. Extend to more general motives only after matching their hypotheses, not by renaming the Drinfeld theorem.

**Acceptance:** A finite-field module checks the Frobenius centralizer; a module with extra endomorphisms tests that dimension is not assumed to be one.

**Source route:** Taguchi The Tate conjecture for t-motives; exact theorem and any Tamagawa alternate route must be acquired/located before the proof leaf is ready.

### DM.6. L-values, regulators and class modules

**Inputs:** `DrinfeldModulesAndTModules:DM.2`, `DrinfeldModulesAndTModules:DM.5`.

**Construction and export:** For Taelman's integral Drinfeld-module setting over the integral closure of F_q[t] in a finite extension of F_q(t), construct the convergent Euler-product value, exponential unit lattice, finite class module and normalized lattice covolume/Fitting polynomial. Prove the determinant/nuclear-operator identity and then the class-number formula with all integral-model and bad-reduction hypotheses copied from the chosen theorem. Keep characteristic-p Goss values distinct from complex Artin L-functions and from unproved arbitrary t-motive special-value predictions.

**Acceptance:** The Carlitz module must recover its explicit zeta value and period normalization; an example with nonzero class module tests that the class factor is retained.

**Source route:** Taelman arXiv:1004.4304, main class-number formula; exact theorem scope is a source-readiness gate.

### DM.7. Elliptic sheaves and shtuka realizations

**Inputs:** `DrinfeldModulesAndTModules:DM.3`, `DrinfeldModulesAndTModules:DM.4`.

**Construction and export:** Construct the vector-bundle chain and Frobenius modification attached to a Drinfeld module, with the distinguished pole infinity, characteristic leg and periodicity. Prove the elliptic-sheaf equivalence in its normalized range and identify prime-to-characteristic Tate realizations. Export this as a special case for GS.2; general global G-shtukas are defined independently. Provide local-shtuka and comparison interfaces only with characteristic place, coefficient ring and effective/bounded conditions explicit.

**Acceptance:** Rank one checks Frobenius direction and periodicity; rank two checks that the underlying bundles are on the global curve, not the Fargues--Fontaine curve.

**Source route:** Drinfeld Elliptic modules and elliptic-sheaf construction; global-shtuka consumer supplies further comparison sources.

### DM.8. Periods, logarithms and algebraic independence

**Inputs:** `DrinfeldModulesAndTModules:DM.2`, `DrinfeldModulesAndTModules:DM.4`.

**Construction and export:** In generic characteristic over an algebraic closure of F_q(theta), construct the neutral Tannakian category of the rigid analytically trivial motives in the chosen Papanikolas theorem, its fiber functor and the corresponding Frobenius-difference Galois group. Build the analytic trivialization matrix and prove the specialization/lifting criterion that identifies its period transcendence degree with the group dimension. For Carlitz logarithms of algebraic arguments, deduce algebraic independence from the exact linear-independence hypothesis by calculating the Galois group. Extend to higher rank or other special values only under separately proved hypotheses.

**Acceptance:** One nonzero logarithm and a linearly dependent pair test the distinction between a transcendence statement and arbitrary independence; a nontrivial motive without the required analytic trivialization must fail the theorem eligibility check.

**Source route:** Papanikolas arXiv:math/0506078, Tannakian/difference-group and Carlitz-logarithm theorems. Full proof and specialization hypotheses must be inspected before execution; this is a source-selected proven branch, not a universal period conjecture.

## Sources and readiness

- **DRINFELD:** [Drinfeld, Elliptic modules](https://doi.org/10.1070/SM1974v023n04ABEH001731). Primary publication metadata and abstract inspected; proof locators must be recorded per ticket.
- **ANDERSON:** [Anderson, t-Motives](https://doi.org/10.1215/S0012-7094-86-05328-7). Bibliography selected; exact equivalence hypotheses require source reconciliation before proof tickets.
- **PINK:** [Pink, Compactification of Drinfeld modular varieties](https://arxiv.org/abs/1008.0013). Primary abstract inspected: generic-fiber Satake compactification, ample sheaf, Hecke operators; no claimed explicit boundary stratification from this abstract.
- **TAGUCHI:** [Taguchi, The Tate conjecture for t-motives](https://www.jstor.org/stable/2161067). Primary publication identified; theorem and proof interior not inspected in this revision.
- **TAELMAN:** [Taelman, Special L-values of Drinfeld modules](https://arxiv.org/abs/1004.4304). Primary abstract inspected; exact integral model and normalizations must be checked in the theorem before execution.
- **PAPANIKOLAS:** [Papanikolas, Tannakian duality for Anderson--Drinfeld motives and algebraic independence of Carlitz logarithms](https://arxiv.org/abs/math/0506078). Primary abstract inspected: Tannakian/difference Galois groups and Carlitz logarithm independence; full theorem hypotheses and proof interior require inspection.
- **ROSEN:** [Rosen, Number Theory in Function Fields](https://link.springer.com/book/10.1007/978-1-4757-6046-0). Publisher contents inspected; chapter routes selected, proofs not audited.

## Integration and completion

The machine-readable stage graph is in cohomology_extensions.json. Preserve each stage identifier when refining tickets. Construction examples are acceptance obligations, not claims of currently available Lean declarations. `Suggested.lean` records the implementation discipline without introducing axioms or placeholder theorem proofs.
