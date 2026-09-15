# Effective Diophantine methods and certified rational points

## Scope and ownership

Build provably complete algorithms for specified Diophantine classes. Every output includes a certificate and the theorem making the search exhaustive. Existing p-adic integration and height carriers are reused. General effective Mordell and unrestricted rational-point decidability are not assumptions.

## Execution status

Curriculum and construction specification. Stages are not proof-ready: pin the source edition, inspect the complete proof, match supplier declarations, and transcribe the lemma tree with exact hypotheses and locators. A source-access or decomposition task is part of the plan; no completed theorem is claimed. Preserve mathematical frontier statements as conjectures.

## Source register

- [de Weger, Algorithms for Diophantine Equations (1989), CWI Tract 65](https://ir.cwi.nl/pub/13190). **Evidence:** Institutional/author record inspected; full chapter-level numerical bounds remain to transcribe.
- [Tzanakis–de Weger, On the practical solution of the Thue equation (1989)](https://math.deweger.net/). **Evidence:** Author bibliography located; exact theorem and proof source required.
- [Balakrishnan–Dogra–Müller–Tuitman–Vonk, Quadratic Chabauty for modular curves (2021)](https://arxiv.org/abs/2101.01862). **Evidence:** Primary abstract inspected; exact algorithm hypotheses and precision proofs pending.

<a id="ed-0"></a>
## ED.0. Certified algebraic numbers and local precision

**Dependencies:** `FoundationsAndLibraryIntegration:LI.0`; `FoundationsAndLibraryIntegration:LI.4`; `ComputationalNumberTheory:CN.0`.

**Construction:** Import the certified exact-number and local-precision presentations from ComputationalNumberTheory CN.0; construct Diophantine-specific isolating intervals/discs, valuation and certificate adapters on those carriers. Exact arithmetic is available at this stage; certified logarithms and analytic error propagation enter ED.2 from CN.4.

**Acceptance:** Every approximate output has a rational error bound checked independently; numerical agreement cannot prove an algebraic identity.

<a id="ed-1"></a>
## ED.1. Lattice reduction and integer relations

**Dependencies:** `EffectiveDiophantineMethods:ED.0`; `GeometryOfNumbersAndQuadraticArithmetic:GN.5`.

**Construction:** Import the verified LLL reduction from GeometryOfNumbersAndQuadraticArithmetic GN.5, including exact Gram–Schmidt arithmetic, termination and approximation bounds; construct the Diophantine adapter on the same lattice carrier. Develop short-vector/closest-vector certificates used to reduce exponent bounds in logarithmic forms.

**Acceptance:** Give a lattice basis, a certified reduction and a proved lower bound excluding all remaining integer vectors in the specified region.

<a id="ed-2"></a>
## ED.2. Linear forms in logarithms and S-unit equations

**Dependencies:** `EffectiveDiophantineMethods:ED.1`; `HeightsRationalPointsAndObstructions:RP.0`; `DiophantineApproximationAndTranscendence:DT.3`; `ComputationalNumberTheory:CN.4`.

**Construction:** Import the source-qualified explicit archimedean and p-adic logarithm bounds from DiophantineApproximationAndTranscendence DT.3, with their constants, degree, heights, branch and multiplicative-independence assumptions. Consume CN.4 for certified logarithm/error evaluations. Combine with ED.1 reduction and finite residual enumeration for S-unit/Thue–Mahler instances.

**Acceptance:** A theorem row proves that every solution lies in the enumerated box. Register the Baker/Matveev and p-adic source separately; citing their names supplies no numerical constant.

<a id="ed-3"></a>
## ED.3. Descent, rank bounds and saturation

**Dependencies:** `EffectiveDiophantineMethods:ED.0`; `HeightsRationalPointsAndObstructions:RP.1`.

**Construction:** Turn the existing isogeny/Selmer constructions into finite algorithms, compute local images with certified precision and prove the saturation of a proposed Mordell–Weil subgroup at the required primes. Combine lower and upper bounds only when both certificates exist.

**Acceptance:** Test a genus-one curve with a nontrivial torsor class and an elliptic rank computation. Conditional analytic-rank input is labelled separately from algebraic rank certification.

<a id="ed-4"></a>
## ED.4. Classical Chabauty–Coleman

**Dependencies:** `EffectiveDiophantineMethods:ED.3`; `ColemanIntegration:L1`; `SchemeAndStackFoundations:SF.3`.

**Construction:** For a smooth proper genus-g curve over Q with a rational base point, certified Jacobian rank r<g and a prime satisfying the chosen good-reduction theorem, construct annihilating differentials and Coleman integrals. Prove residue-disc zero bounds with all exceptional discs treated.

**Acceptance:** Enumerate every residue disc and prove completeness of the rational-point set, rather than only finding known zeros. Number-field and bad-reduction variants require separately proved hypotheses.

<a id="ed-5"></a>
## ED.5. Mordell–Weil sieve and combination certificates

**Dependencies:** `EffectiveDiophantineMethods:ED.2`; `EffectiveDiophantineMethods:ED.3`; `EffectiveDiophantineMethods:ED.4`.

**Construction:** Construct finite reduction maps from the Jacobian subgroup, compatible residue conditions and the sieve intersection. Prove that Chabauty or height bounds plus the sieve eliminate all unlisted points. Add integral-point and hyperelliptic workflows only with their actual covering maps.

**Acceptance:** The final certificate includes the index/saturation assumptions, primes, images and exhaustive candidate set. A sieve that has not terminated is an open computation, not an empty solution set.

<a id="ed-6"></a>
## ED.6. Explicit higher methods and reproducible examples

**Dependencies:** `EffectiveDiophantineMethods:ED.5`; `AnabelianGeometryAndNonabelianChabauty:NC.5`.

**Construction:** Consume the nonabelian/quadratic Chabauty construction when its rank and local-height hypotheses are verified, and implement its integration/precision certificates. Maintain complete worked Thue, S-unit, elliptic and higher-genus examples with proof-producing output.

**Acceptance:** Each algorithm advertises sufficient termination conditions and unresolved inputs. A finite set of p-adic candidates must still be compared with global rational points.

## Completion contract

Each construction returns actual mathematical objects and maps on the canonical suppliers. Finish source decomposition, then definitions, theorems, naturality/comparison lemmas and the worked acceptance examples. Every algorithm also proves soundness, completeness under its stated hypotheses, and precision/termination where promised. An absent source lemma stays an explicit open subtask; it is never replaced by an opaque assumption.
