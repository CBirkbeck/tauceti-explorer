# Berkovich spaces, tropical curves and nonarchimedean arithmetic

## Scope and status

Begin over a complete nontrivially valued rank-one nonarchimedean field. Make algebraic closure, discrete valuation, properness and semistable reduction explicit at each stage. Skeleton and tropical coordinates are geometric tools with comparison maps; a combinatorial model does not automatically carry every invariant of the original variety.

Status: curriculum specification, with established theorem targets and explicitly source-gated extensions. This document does not certify formalized proofs or a complete proof-interior source audit. Each AI proof ticket must replace its source route by an inspected theorem/lemma locator, enumerate intermediate lemmas, search the pinned library, and prove the actual geometric or analytic object has the exported properties. A structure field assuming the conclusion is not completion.

## Stages

### TB.0. Berkovich spectra and analytic comparison

**Inputs:** `FoundationsAndLibraryIntegration:LI.0`, `AdicSpacesPartII:R2`.

**Construction and export:** Construct the Berkovich spectrum of a Banach algebra from bounded multiplicative seminorms, its topology and completed residue fields, then glue affinoids into analytic spaces. Compare a strictly affinoid algebra with its Huber adic spectrum by rank-one points/maximal generalizations under the precise hypotheses, proving continuity and the correct quotient topology. Preserve integral-subring and higher-rank information on the adic side rather than claiming equality of point sets.

**Acceptance:** The closed disc has nonclassical Gauss points; a choice of plus ring and a higher-rank valuation tests the limitations of the comparison.

**Source route:** Berkovich foundations and Huber comparison in campaign sources; BPR analytic preliminaries.

### TB.1. Discs, annuli and metric trees

**Inputs:** `TropicalAndBerkovichArithmetic:TB.0`.

**Construction and export:** Classify the four point types on the affine line over an algebraically closed complete field, build paths and the hyperbolic metric off classical endpoints, and construct skeletons of annuli. Prove the logarithmic modulus equals edge length with the chosen absolute-value normalization. Define outgoing slopes of log norms of invertible analytic functions and compute their integral values; explain what changes over a nonalgebraically closed base by descent.

**Acceptance:** Compute the skeleton of r<|T|<1 and the slope of T^m; nested discs with empty intersection test type IV without assuming spherical completeness.

**Source route:** BPR curve metric and annulus preliminaries; Berkovich analytic line.

### TB.2. Semistable models and skeletons of curves

**Inputs:** `TropicalAndBerkovichArithmetic:TB.1`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.4`.

**Construction and export:** For a smooth proper curve with a semistable formal model, construct its dual metric graph, vertex genera and retraction of the analytification. Prove compatibility with refinement and finite extension of the valued field; obtain existence after the finite extension supplied by semistable reduction. Mark punctures and allow rays for open curves. The graph genus plus vertex genera recovers the curve genus; ignoring the vertex terms loses good-reduction components.

**Acceptance:** Compare good reduction, a Tate elliptic curve and a curve with positive-genus components; subdivisions must preserve the metric realization and genus.

**Source route:** BPR semistable vertex sets and skeletons; campaign semistable curve foundation.

### TB.3. Divisors, slope formula and specialization

**Inputs:** `TropicalAndBerkovichArithmetic:TB.2`.

**Construction and export:** Construct divisors and piecewise integral-affine functions on metric graphs, their Laplacian and Jacobian, then the specialization map from divisors on a curve. Prove the slope formula for rational functions and the graph Riemann--Roch theorem; establish the specialization inequality with its degree/rank convention. Use metrized complexes when component-curve information is needed. Equality of algebraic and graph ranks is not a general theorem.

**Acceptance:** A loop graph and a bridge test principal-divisor signs and Jacobian; compare a good-reduction curve with its single-vertex skeleton to expose missing vertex genus.

**Source route:** BPR slope/specialization framework; Baker--Norine and Baker specialization primary papers must be fixed as proof-leaf sources.

### TB.4. Tropicalization and multiplicities

**Inputs:** `TropicalAndBerkovichArithmetic:TB.0`, `SchemeAndStackFoundations:SF.0`.

**Construction and export:** For a subvariety of an algebraic torus, define tropicalization using coordinate valuations, initial degenerations and the appropriate value-group extension. Prove the fundamental theorem, polyhedral structure, weights and balancing with explicit irreducibility/equidimensionality conditions. Construct pushforward of tropical cycles with lattice indices and generic degrees; a set-theoretic image lacks the multiplicities needed for intersection or point-count applications.

**Acceptance:** A tropical line, a nonreduced initial degeneration and a monomial finite map test weights, balancing and lattice-index factors.

**Source route:** BPR multiplicity/projection formula route; primary tropical foundations to be pinned before full higher-dimensional theorem tickets.

### TB.5. Faithful tropicalization of curves

**Inputs:** `TropicalAndBerkovichArithmetic:TB.3`, `TropicalAndBerkovichArithmetic:TB.4`.

**Construction and export:** For a finite subgraph of the analytic skeleton, construct enough rational functions and an algebraic embedding into a toric chart so tropicalization preserves its path metric. Prove the multiplicity-one/isometry criterion and explicitly refine the embedding when a chosen tropicalization contracts an edge or changes its expansion factor. Separate existence of a suitable faithful tropicalization from a claim about every embedding.

**Acceptance:** A Tate elliptic curve must preserve the cycle length after refinement; an initial nonfaithful plane model is the regression case.

**Source route:** Baker--Payne--Rabinoff arXiv:1104.0320, faithful tropicalization and expansion-factor theorems.

### TB.6. Model metrics, measures and local heights

**Inputs:** `TropicalAndBerkovichArithmetic:TB.2`, `SchemeAndStackFoundations:SF.5`.

**Construction and export:** Construct metrics on line bundles from formal models and model measures weighted by intersection numbers on special-fiber components. Prove functoriality and total mass equal to the algebraic degree; extend to semipositive metrics by controlled approximation. Define local heights with integrability and normalization. Equidistribution is a separate global theorem requiring a polarized metrized line bundle and a generic small sequence; this stage provides its local analytic objects.

**Acceptance:** On a good-reduction curve compute the Gauss-point mass; on a Tate curve compare the canonical measure with uniform length on the circle and check total degree.

**Source route:** Chambert-Loir arXiv:math/0304023; SF.5 intersection; exact semipositivity/approximation range is source-gated.

### TB.7. Uniformization and integration interfaces

**Inputs:** `TropicalAndBerkovichArithmetic:TB.3`, `TropicalAndBerkovichArithmetic:TB.6`.

**Construction and export:** Construct Tate uniformization and the Schottky/Mumford-curve quotient in its totally degenerate range; record descent and the period lattice. Build integration handoffs that distinguish local Coleman primitives, annular residues/monodromy and global path or abelian integrals. Export semistable graph corrections and model metrics to Diophantine/height consumers with actual comparison maps. A general curve is not a Mumford curve, and a skeleton does not by itself define a unique global p-adic integral.

**Acceptance:** For a Tate elliptic curve compare the q-period, skeleton length and logarithm branch; a good-reduction higher-genus curve tests the scope of Schottky uniformization.

**Source route:** Campaign Tate-curve and p-adic integration sources; BPR and Chambert-Loir supply geometry and metrics, not all integration theorems.

## Sources and readiness

- **BPR:** [Baker, Payne, Rabinoff, Nonarchimedean geometry, tropicalization, and metrics on curves](https://arxiv.org/abs/1104.0320). Primary abstract inspected: tropical multiplicities, skeletal metrics, faithful tropicalization.
- **CHAMBERT:** [Chambert-Loir, Mesures et equidistribution sur les espaces de Berkovich](https://arxiv.org/abs/math/0304023). Primary abstract inspected; model measures selected, no blanket equidistribution theorem inferred.
- **EXISTING:** Campaign primary source registry. Reuse precise source routes and bounded inspection ledger in cohomology_review.json; existing references do not mean existing proofs.

## Integration and completion

The machine-readable stage graph is in cohomology_extensions.json. Preserve each stage identifier when refining tickets. Construction examples are acceptance obligations, not claims of currently available Lean declarations. `Suggested.lean` records the implementation discipline without introducing axioms or placeholder theorem proofs.
