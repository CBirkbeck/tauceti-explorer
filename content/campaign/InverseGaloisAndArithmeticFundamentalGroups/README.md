# Inverse Galois theory and arithmetic fundamental groups

## Scope and ownership

Construct finite-cover and specialization machinery, explicit regular realizations and the proven solvable inverse-Galois branch. The inverse Galois problem over Q for arbitrary finite groups is a frontier statement, never a premise. Use SGA-style finite étale covers from the scheme foundation and existing finite-group/Galois theory.

## Execution status

Curriculum and construction specification. Stages are not proof-ready: pin the source edition, inspect the complete proof, match supplier declarations, and transcribe the lemma tree with exact hypotheses and locators. A source-access or decomposition task is part of the plan; no completed theorem is claimed. Preserve mathematical frontier statements as conjectures.

## Source register

- Pinned TauCeti BelyiMaps supplier and its named analytic/algebraic/arithmetic successors. **Evidence:** Supplier roadmap opening ownership table and Layers 9–14 scope inspected; only compiled carrier availability is established by LI.0, not by the roadmap text.
- [SGA 1, Revêtements étales et groupe fondamental, Exposés V, IX, XIII](https://arxiv.org/abs/math/0206203). **Evidence:** Primary reprint selected; exact hypotheses and proof leaves require transcription.
- [Serre, Topics in Galois Theory, Hilbert irreducibility and rigidity chapters](https://indico.math.cnrs.fr/event/11410/attachments/4760/7351/SerreTopicsGaloisTheory.pdf). **Evidence:** Primary book file located; edition, chapter numbers and proofs pending.
- [Malle–Matzat, Inverse Galois Theory, 2nd edition (2018), rigidity and embedding-problem chapters](https://link.springer.com/book/10.1007/978-3-662-55420-3). **Evidence:** Publisher contents inspected; full proofs, including the chosen solvable route, still required.

<a id="ig-0"></a>
## IG.0. Galois categories and fibre functors

**Dependencies:** `SchemeAndStackFoundations:SF.2`; `FoundationsAndLibraryIntegration:LI.4`.

**Construction:** Construct the profinite automorphism group of the geometric fibre functor on finite étale covers, together with its equivalence to finite continuous sets. Treat connected components and base-point change as explicit equivalences.

**Acceptance:** Recover the absolute Galois group for Spec K and the fundamental group of G_m over an algebraically closed characteristic-zero field.

<a id="ig-1"></a>
## IG.1. Arithmetic exact sequences and specialization

**Dependencies:** `InverseGaloisAndArithmeticFundamentalGroups:IG.0`.

**Construction:** Prove the geometric/arithmetic fundamental-group sequence for geometrically connected schemes in the selected SGA range. Construct decomposition and inertia subgroups, tame quotients and specialization maps for smooth proper families, recording characteristic and prime-to-p restrictions.

**Acceptance:** Check finite-field Frobenius and a punctured curve; wild inertia must survive outside the tame quotient.

<a id="ig-2"></a>
## IG.2. Hilbert irreducibility and disjoint specializations

**Dependencies:** `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `FoundationsAndLibraryIntegration:LI.4`.

**Construction:** Prove Hilbert irreducibility over number fields, then specialize a regular finite Galois cover outside its branch locus with full Galois group. Construct simultaneous avoidance and linear-disjointness variants under the exact theorem.

**Acceptance:** Produce infinitely many distinct specialized extensions in a worked regular example, with ramification and irreducibility certificates.

<a id="ig-3"></a>
## IG.3. Branch cycles, rigidity and descent

**Dependencies:** `InverseGaloisAndArithmeticFundamentalGroups:IG.1`; `SchemeAndStackFoundations:SF.3`; `ComplexComparisonPartII:C4`.

**Construction:** Construct branched covers from generating tuples with product one via Riemann existence, and prove the braid action and field-of-moduli/descent conditions. Apply a rational rigidity criterion only after checking conjugacy classes, centralizers and rationality. For three-point covers, consume BelyiMaps and its BelyiAnalyticCovers/BelyiAlgebraicAndDescent successors: use transitive permutation triples with product one, finite bipartite ribbon-graph dessins, and finite maps of smooth proper connected curves branched only over {0,1,infinity}. Reuse their Belyi theorem and analytic/algebraic comparison, with an explicit compiled-supplier check rather than duplicating those proofs.

**Acceptance:** Give one rigid realization and one example showing that a field of moduli need not supply a model. Compare a dessin and its permutation triple up to simultaneous conjugacy, and verify the actual branch-cycle/ramification data; a passport alone does not determine a Belyi pair.

<a id="ig-4"></a>
## IG.4. Embedding problems and solvable realizations

**Dependencies:** `InverseGaloisAndArithmeticFundamentalGroups:IG.2`; `FoundationsAndLibraryIntegration:LI.4`.

**Construction:** Define weak and proper solutions of finite embedding problems and their local constraints. Decompose a selected proof of Shafarevich’s solvable realization theorem into abelian kernels, auxiliary ramification and successive proper solutions; source verification is required before strengthening its local prescriptions.

**Acceptance:** Construct cyclic and dihedral realizations, then certify the inductive properness step. A weak lift with smaller image is not a realization.

<a id="ig-5"></a>
## IG.5. Hurwitz spaces and function-field branches

**Dependencies:** `InverseGaloisAndArithmeticFundamentalGroups:IG.3`; `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Construction:** Construct the relevant Hurwitz moduli with braid/Nielsen-class components, descent and specialization to regular extensions. Add tame positive-characteristic covers with explicit p-prime-to-order assumptions; assign wild patching/Abhyankar variants their own source-dependent proof subtasks.

**Acceptance:** Compare a characteristic-zero and tame reduction example; no unrestricted Riemann-existence theorem is exported in characteristic p.

<a id="ig-6"></a>
## IG.6. Explicit realizations and downstream interfaces

**Dependencies:** `InverseGaloisAndArithmeticFundamentalGroups:IG.4`; `InverseGaloisAndArithmeticFundamentalGroups:IG.5`.

**Construction:** Export checked polynomials, field extensions, cover maps and Galois-group isomorphisms, with specialization conditions. Consume BelyiArithmeticActions for the arithmetic Galois action on Belyi pairs/dessins and its source-scoped faithfulness theorem; compare peripheral inertia and the cyclotomic branch-cycle convention, retaining field-of-moduli versus definition distinctions. Hand the profinite fundamental group and path torsors to the anabelian continuation without assuming a reconstruction theorem.

**Acceptance:** Maintain a theorem-indexed list of solved group families; arbitrary finite groups over Q and generic-polynomial universality remain named open targets.

## Completion contract

Each construction returns actual mathematical objects and maps on the canonical suppliers. Finish source decomposition, then definitions, theorems, naturality/comparison lemmas and the worked acceptance examples. Every algorithm also proves soundness, completeness under its stated hypotheses, and precision/termination where promised. An absent source lemma stays an explicit open subtask; it is never replaced by an opaque assumption.
