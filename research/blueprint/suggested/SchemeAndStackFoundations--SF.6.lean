import Mathlib.AlgebraicGeometry.Sites.ElladicCohomology
import Mathlib.CategoryTheory.Sites.SheafCohomology.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
`SchemeAndStackFoundations--SF.6.md` is definitive. Suggested Lean forms help
contributors and reviewers converge on names and signatures.

SF.6 is an audited process layer and owns no mathematical declarations. The
packet therefore has no definition, API, unit-test or planet declarations to
prototype. These checks expose the existing native types used by its consumer
contracts; they do not assert an arithmetic comparison or its implementation.

The eight checked declarations are present at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174. No Tau Ceti module or higher-roadmap
theorem is imported into this foundation-tier file.
-/

-- S1: cohomology of an abelian sheaf on an already specified site.
#check CategoryTheory.Sheaf.H
#check CategoryTheory.Sheaf.H.map
#check CategoryTheory.Sheaf.H.equiv₀

-- S1/S6: the actual small pro-étale site and topological integral coefficient.
#check AlgebraicGeometry.Scheme.ProEt.topology
#check AlgebraicGeometry.Scheme.etaleTopology_le_proetaleTopology
#check AlgebraicGeometry.Scheme.ellAdicSheaf
#check AlgebraicGeometry.Scheme.EllAdicCohomology
#check AlgebraicGeometry.Scheme.isZero_ellAdicSheaf_of_isEmpty

/-!
Signature boundaries, keyed to the packet's process contracts:

* S2 needs the actual algebraic de Rham hypercohomology, analytification and
  singular-cochain carriers of ComplexComparisonPartII:C5. Its additive repair
  does not type the requested product, trace or relative comparison. Request R3
  specifies those obligations at their owner.
* S3/S4 need the étale-to-analytic site map, finite/local coefficient inverse
  image, Kummer connecting maps and real equivariant descent. The proposed C7
  stage is not an existing module. R1/R4 identify the mathematical boundary.
* S5 needs the actual scheme–adic/diamond site maps and derived functors.
  A topology inequality and a same-site Sheaf.H.map do not have those types.
* S6 needs the native coefficient reduction and derived-limit equivalence,
  including the Milnor lim¹ term. EllAdicCohomology is not definitionally a
  limit of finite-coefficient groups. R1 supplies that interface.
* S7/S8 need actual prismatic, derived-completed and period-ring cohomology
  objects. Frobenius pullback, theta base change, Tate lines and the
  trace-normalized period remain in the comparison owners. R6/R7 retain the
  general de Rham and finite-etale prismatic exports; global base change keeps
  the supplier's corrected qcqs hypothesis.
* S9 needs the SF.5 Chow quotient and EDC.3 graded cycle/trace/Gysin carriers,
  with geometric or relative base and corrected relative-dimension signs.
  Requests R2/R5 retain the source and quotient boundaries.

No absent carrier is replaced by an arbitrary module, a proposition-valued
comparison field, or an assumed equivalence. The mathematical acceptance
diagrams in the reader belong to their named suppliers and consumers. Native
type-checking of this file does not discharge them.
-/
