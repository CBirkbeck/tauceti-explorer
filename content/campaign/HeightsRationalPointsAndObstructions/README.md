# Heights, rational points and obstructions

## Scope and ownership

Join existing arithmetic heights, abelian varieties, descent, Brauer groups and Faltings finiteness into a rational-points programme. Separate existence, finiteness, effective enumeration and obstruction completeness. This roadmap owns the missing geometric applications, not a duplicate number-field or cohomology foundation.

## Execution status

Curriculum and construction specification. Stages are not proof-ready: pin the source edition, inspect the complete proof, match supplier declarations, and transcribe the lemma tree with exact hypotheses and locators. A source-access or decomposition task is part of the plan; no completed theorem is claimed. Preserve mathematical frontier statements as conjectures.

## Source register

- [Poonen, Rational points on varieties (2017), §§5.7, 6.5–6.9, Chapter 8 and §9.5](https://math.mit.edu/~poonen/papers/Qpoints.pdf). **Evidence:** Selected definitions, finiteness/frontier statements and contents inspected; complete source proofs remain to transcribe.
- [Milne, Arithmetic Duality Theorems, abelian varieties and global duality](https://www.jmilne.org/math/Books/adt.html). **Evidence:** Author source located; consume the existing arithmetic-duality proof owner.
- [Zhang, Equidistribution of small points on abelian varieties, Annals 147 (1998), pp.159–165](https://annals.math.princeton.edu/articles/12893). **Evidence:** Publisher record inspected; complete proof, theorem locator and inputs still require acquisition/transcription.
- [Ullmo, Positivité et discrétion des points algébriques des courbes (1998)](https://arxiv.org/abs/alg-geom/9606017). **Evidence:** Primary abstract inspected; this supplies the curve branch only until the full proof is decomposed.
- Faltings, Endlichkeitssätze and correction; existing local campaign sources. **Evidence:** Existing R28 ownership retained; Parshin/Mordell and higher-dimensional additions require separate proof decomposition.

<a id="rp-0"></a>
## RP.0. Height machine and canonical heights

**Dependencies:** `FoundationsAndLibraryIntegration:LI.4`; `SchemeAndStackFoundations:SF.5`; `AbelianSchemesAndArithmeticModuli:A6`.

**Construction:** Import normalized absolute heights, product formula and Northcott from the audited arithmetic-height supplier. Construct divisor/line-bundle heights modulo bounded functions and their pullback/tensor laws; compare Néron–Tate and local heights on abelian varieties.

**Acceptance:** Test independence of projective coordinates and field extension, and the quadratic polarization identity; state ampleness wherever finiteness uses it.

<a id="rp-1"></a>
## RP.1. Weak Mordell–Weil and descent

**Dependencies:** `HeightsRationalPointsAndObstructions:RP.0`; `ArithmeticGaloisDuality:R02.6`; `AbelianSchemesAndArithmeticModuli:A3`.

**Construction:** Construct Kummer maps, finite Selmer groups for isogenies and the quotient A(K)/nA(K), using fppf cohomology when n meets residue characteristic. Combine finite descent with a height argument to prove finite generation, retaining a computable versus merely finite distinction.

**Acceptance:** An elliptic 2-descent example includes local conditions, the global image and a proved finite-generation conclusion; a Selmer upper bound is not the rank itself.

<a id="rp-2"></a>
## RP.2. Adelic points and Brauer evaluation

**Dependencies:** `HeightsRationalPointsAndObstructions:RP.1`; `SchemeAndStackFoundations:SF.2`; `FoundationsAndLibraryIntegration:LI.4`.

**Construction:** Construct restricted adelic point spaces, local invariant maps and the Brauer–Manin pairing with its finite-support theorem. Prove that rational points pair trivially through global reciprocity, and derive effective tests for a specified finite subgroup of the Brauer group.

**Acceptance:** Verify a conic and a variety with an actual obstruction; a nonempty Brauer–Manin set does not imply a rational point.

<a id="rp-3"></a>
## RP.3. Torsor descent and comparison of obstructions

**Dependencies:** `HeightsRationalPointsAndObstructions:RP.2`; `AlgebraicModuliForArithmeticGeometry:R09.3`.

**Construction:** Construct descent sets for torsors with specified linear algebraic groups, twists and adelic lifting conditions. Prove the chosen comparisons with finite étale descent/Brauer–Manin under their hypotheses, including stabilizers and finiteness of relevant twist classes.

**Acceptance:** Track a torsor with no rational lift and an example where weaker local tests pass. State exact obstruction equality only for the proved class.

<a id="rp-4"></a>
## RP.4. Curves: Faltings and integral-point finiteness

**Dependencies:** `HeightsRationalPointsAndObstructions:RP.1`; `FaltingsFinitenessAndIsogenyTheorems:R28.5`; `SchemeAndStackFoundations:SF.3`; `DiophantineApproximationAndTranscendence:DT.2`.

**Construction:** Construct the Parshin covering reduction from a rational point on a genus-at-least-two curve to bounded-ramification auxiliary curves, then apply the existing Shafarevich finiteness route. Add Siegel finiteness for affine curves with the exact genus/boundary conditions and its own Diophantine approximation input.

**Acceptance:** The cover degree, ramification set and field extension are uniformly controlled. Neither theorem automatically returns an effective height bound or full rational-point algorithm.

<a id="rp-5"></a>
## RP.5. Subvarieties of abelian varieties and special sets

**Dependencies:** `HeightsRationalPointsAndObstructions:RP.0`; `HeightsRationalPointsAndObstructions:RP.4`.

**Construction:** Construct translates, stabilizers and finitely generated subgroup intersections, then develop the selected Mordell–Lang and Manin–Mumford proof routes with precise characteristic and field hypotheses. Add a separate Bogomolov/small-points theorem for subvarieties of abelian varieties over number fields: relative to a symmetric ample line bundle, a geometrically irreducible subvariety not a torsion translate of an abelian subvariety has a positive-height threshold below which points are not Zariski dense. Supply the selected primary equidistribution proof and retain number-field/characteristic-zero hypotheses; torsion classification alone does not prove this small-points conclusion.

**Acceptance:** A positive-dimensional torsion translate remains a legitimate infinite component. Pin complete primary sources for all three branches before tickets are executable, including Ullmo/Zhang for the chosen Bogomolov theorem; Faltings R28 alone does not discharge this stage.

<a id="rp-6"></a>
## RP.6. Rational-point classification and frontier register

**Dependencies:** `HeightsRationalPointsAndObstructions:RP.3`; `HeightsRationalPointsAndObstructions:RP.5`.

**Construction:** Assemble separate interfaces for local solubility, obstruction, finite generation, geometric finiteness and certified enumeration. Transfer finite rational-point theorems to actual scheme points through the existing Jacobian embeddings.

**Acceptance:** Worked genus-zero, genus-one and genus-at-least-two examples record which conclusions are proved. Bombieri–Lang, Vojta and unrestricted obstruction completeness remain conjectural statements with no consumers treating them as proved.

## Completion contract

Each construction returns actual mathematical objects and maps on the canonical suppliers. Finish source decomposition, then definitions, theorems, naturality/comparison lemmas and the worked acceptance examples. Every algorithm also proves soundness, completeness under its stated hypotheses, and precision/termination where promised. An absent source lemma stays an explicit open subtask; it is never replaced by an opaque assumption.
