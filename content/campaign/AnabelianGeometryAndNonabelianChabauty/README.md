# Anabelian geometry and nonabelian Chabauty

## Scope and ownership

Build arithmetic path torsors, source-qualified reconstruction theorems and unipotent Selmer varieties. Distinguish profinite reconstruction from the unipotent quotients used in Chabauty–Kim. The section conjecture and general eventual Chabauty–Kim completeness remain explicitly conjectural.

## Execution status

Curriculum and construction specification. Stages are not proof-ready: pin the source edition, inspect the complete proof, match supplier declarations, and transcribe the lemma tree with exact hypotheses and locators. A source-access or decomposition task is part of the plan; no completed theorem is claimed. Preserve mathematical frontier statements as conjectures.

## Source register

- [Mochizuki, The Profinite Grothendieck Conjecture for Closed Hyperbolic Curves over Number Fields (1996)](https://www.ms.u-tokyo.ac.jp/journal/abstract_e/jms030305_e.html). **Evidence:** Publisher abstract inspected; complete proof and exact reconstruction statement require decomposition.
- [Kim, The unipotent Albanese map and Selmer varieties for curves (2009)](https://arxiv.org/abs/math/0510441). **Evidence:** Primary record and abstract inspected; full local/global proof leaves pending.
- [Balakrishnan–Dogra, Quadratic Chabauty and rational points I (2018)](https://arxiv.org/abs/1601.00388). **Evidence:** Primary abstract inspected; published hypotheses and dimension calculation pending.
- [Balakrishnan–Dogra, Quadratic Chabauty and rational points II](https://arxiv.org/abs/1705.00401). **Evidence:** Primary abstract inspected; generalised-height construction requires its own source proof.

<a id="nc-0"></a>
## NC.0. Fundamental groupoids and sections

**Dependencies:** `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `SchemeAndStackFoundations:SF.3`.

**Construction:** Import the finite-étale fibre functor and arithmetic exact sequence, then construct path torsors and the section associated to a rational point. Prove base-point change and conjugacy independence, including tangential base points for the selected open curves.

**Acceptance:** Compare a rational point and a tangential point on P¹ minus three points. Do not assert that every Galois section arises from a rational point.

<a id="nc-1"></a>
## NC.1. Source-qualified anabelian reconstruction

**Dependencies:** `AnabelianGeometryAndNonabelianChabauty:NC.0`; `ComplexComparisonPartII:C4`.

**Construction:** For the precise smooth proper hyperbolic curves over number fields in the chosen Mochizuki theorem, reconstruct the curve from the relevant outer Galois-equivariant fundamental-group data. Decompose decomposition-group recovery, covers, linear systems and effectivity from the full proof.

**Acceptance:** State base-field compatibility, topology and allowed morphisms exactly. Isomorphism and Hom versions are separate targets; finite-field, local-field and affine variants need their own sources.

<a id="nc-2"></a>
## NC.2. Unipotent fundamental groups and realizations

**Dependencies:** `AnabelianGeometryAndNonabelianChabauty:NC.0`; `PadicHodgeTheory:R06.5`; `ColemanIntegration:L1`.

**Construction:** Construct unipotent étale and de Rham fundamental groups using their Tannakian categories, central series and finite quotients. Build path torsors with filtration/Frobenius/Galois structures and comparison maps at the good-reduction coefficient prime.

**Acceptance:** At depth one recover the Jacobian’s abelian realization. A pro-unipotent group is not the entire profinite fundamental group, and its rational points do not determine all finite covers.

<a id="nc-3"></a>
## NC.3. Nonabelian cohomology and Selmer varieties

**Dependencies:** `AnabelianGeometryAndNonabelianChabauty:NC.2`; `ArithmeticGaloisDuality:R02.6`.

**Construction:** Construct torsor-valued H¹ for the finite unipotent quotients, local unramified/crystalline conditions and representable Selmer varieties. Prove obstruction and dimension calculations using central extensions and actual Galois cohomology, retaining bad-place conditions.

**Acceptance:** Check depth-one Kummer/Selmer agreement and a nontrivial depth-two obstruction. A dimension bound is a theorem, not a field inserted into an assumed Selmer space.

<a id="nc-4"></a>
## NC.4. Unipotent Albanese and Chabauty–Kim loci

**Dependencies:** `AnabelianGeometryAndNonabelianChabauty:NC.3`; `ColemanIntegration:L1`.

**Construction:** Construct the local unipotent Albanese map using iterated integration and the global-to-local Selmer map. Define their intersection locus and prove that rational/integral points lie in it. Deduce finiteness only from the selected dimension and nonvanishing theorem with its geometric hypotheses.

**Acceptance:** At depth one recover classical Chabauty. Prove each implication using actual maps, and retain conjectural motivic dimension inputs as conditions wherever the source does.

<a id="nc-5"></a>
## NC.5. Quadratic Chabauty and height equations

**Dependencies:** `AnabelianGeometryAndNonabelianChabauty:NC.4`; `HeightsRationalPointsAndObstructions:RP.1`; `ColemanIntegration:L1`.

**Construction:** For the published good-reduction curve/Jacobian hypotheses, construct the depth-two quotient and p-adic height equations, Néron–Severi contributions and all bad-place local terms. Prove the precise rank-versus-genus/Picard-number criterion selected from the primary theorem.

**Acceptance:** A worked curve includes certified rank, independent divisor classes, local heights and all residue discs. Do not drop local contributions or infer rational completeness from finite p-adic solutions.

<a id="nc-6"></a>
## NC.6. Reconstruction and rational-point handoff

**Dependencies:** `AnabelianGeometryAndNonabelianChabauty:NC.1`; `AnabelianGeometryAndNonabelianChabauty:NC.5`.

**Construction:** Export independent APIs for profinite reconstruction, Selmer varieties, iterated-integral equations and finite Chabauty–Kim loci. Send the explicit equations and precision requirements to EffectiveDiophantineMethods ED.6 for certified enumeration.

**Acceptance:** Preserve the section-conjecture and eventual-stabilization frontiers. A theorem proved assuming Bloch–Kato or another motivic conjecture stays explicitly conditional throughout the endpoint.

## Completion contract

Each construction returns actual mathematical objects and maps on the canonical suppliers. Finish source decomposition, then definitions, theorems, naturality/comparison lemmas and the worked acceptance examples. Every algorithm also proves soundness, completeness under its stated hypotheses, and precision/termination where promised. An absent source lemma stays an explicit open subtask; it is never replaced by an opaque assumption.
