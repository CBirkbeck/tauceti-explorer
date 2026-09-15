# Automorphic spectral theory and trace distributions

## Scope and dependencies

Develop the analytic structure of automorphic forms and L² automorphic representations for connected reductive groups over number fields. This covers Eisenstein series, intertwining operators, discrete and continuous spectrum, truncation and the invariant trace formula. AutomorphicFormsOnReductiveGroups supplies forms, growth, real representation categories and constant terms; AdelicAlgebraicGroups supplies reduction and measures; SmoothRepresentationsOfLocalGroups supplies local induction and characters. The general functional analysis listed below is part of the work where Mathlib does not already supply it.

The stable trace formula, transfer factors and endoscopic classification require substantially different geometric input and are not consequences of this specification. GL2AutomorphicRepresentationsAndTransfer owns its explicit transfer theorems and must state which trace comparison it consumes. Nothing here asserts general Langlands functoriality.

## Conventions

Use a fixed unitary central character and the finite-volume quotient specified by AA.2. Parabolic induction is normalized; complex parameters lie in a_M,ℂ*, and unitary parameters in ia_M*. State the dependence on Haar measures, standard parabolics and Weyl representatives. Distinguish the algebraic sum of K-finite automorphic constituents, Hilbert direct sums, direct integrals and distributional equalities. Eisenstein poles and residual terms are retained.

## Milestones

### AS.0. Functional analysis for the spectrum

Construct measurable fields of separable Hilbert spaces and their direct integrals, decomposable operators and isometric integration maps. Develop the relevant spectral theorem, trace-class and Hilbert–Schmidt integral operators, nuclear Fréchet test-function spaces, weak/strong meromorphic operator families and finite-rank residues. Prove Fubini/interchange lemmas with integrability hypotheses and distributional convergence. Reuse Mathlib L², Bochner integration and compact-operator spectral theory; supply the direct-integral and unbounded-operator extensions explicitly.

### AS.1. Induced families and Eisenstein convergence

For a rational parabolic P=MN and cuspidal data on M construct sections of normalized induction depending holomorphically on λ. Prove absolute convergence of the Eisenstein sum over P(F)\G(F) in a specified positive chamber, locally uniform convergence with differentiated growth estimates and automorphy. Derive its constant term as a finite Weyl sum of intertwining operators in the convergence region, including the exact source/target induced spaces.

### AS.2. Intertwiners and meromorphic continuation

Construct global and local standard intertwiners by convergent unipotent integrals; prove factorization for factorizable sections, cocycle identities and adjoint identities. Prove meromorphic continuation of operators and Eisenstein series, the functional equations and the regularity/unitarity assertions on the relevant unitary axis. Track singular hyperplanes and residues; no cancellation of a zero or pole is permitted without its separate theorem. Construct normalized intertwiners only after supplying the normalizing factors used in that case.

### AS.3. Truncation and Maass–Selberg relations

Construct Arthur's truncation from parabolic constant terms and chamber indicator functions. Prove local finiteness, alternating-sum identities on root cones and integrability of truncated automorphic forms for sufficiently regular truncation parameter T. Track the genuine T-dependence: prove the applicable polynomial-exponential expansion and the behavior of its coefficients. Neither the truncation operator nor truncated integrals become constant merely because T is regular. Prove independence only for the particular extracted distributions or normalized coefficients for which the source establishes it. Establish the Maass–Selberg inner-product formula for truncated Eisenstein series, with derivatives at singular parameters obtained by actual limiting arguments. Deduce orthogonality and norm identities for wave packets.

### AS.4. Complete automorphic spectral decomposition

Construct discrete cuspidal and residual subspaces, Eisenstein wave packets and the unitary map from the sum/direct integral over associate cuspidal data onto L². Prove surjectivity, correct Weyl multiplicity factors, finite multiplicities in the discrete spectrum and the separation of residual and continuous terms. Show compatibility with finite Hecke operators and central characters. For compact quotients specialize to a discrete Hilbert sum; for GL_2/Q recover the continuous Eisenstein contribution.

### AS.5. Weighted cohomology and automorphic comparison

Build weighted L² complexes, regularization and finite-infinitesimal-character functors. Prove the filtration and acyclicity statements that compare relative Lie algebra cohomology of automorphic forms with that of all smooth functions of the required growth. ArithmeticLocallySymmetricSpaces constructs the topological-to-smooth de Rham comparison; this layer supplies the further automorphic comparison, with algebraic coefficient systems and Hecke equivariance. In particular ordinary cohomology must not be replaced by cusp or L² cohomology.

### AS.6. Coarse, fine and invariant trace formula

For compactly supported smooth test functions build the automorphic kernel and its truncation. Prove integrability and equality of the coarse geometric and spectral expansions. Develop weighted orbital integrals, weighted characters, (G,M)-families, convergence and the fine expansions; then construct the invariant distributions by the invariantization recursion. Prove the invariant trace identity with its actual summation/convergence conditions. Separate local harmonic-analysis lemmas from global reduction estimates and make both reusable. The untruncated diagonal integral is not a substitute on noncompact quotients.

The original proof corpus for AS.3/6 is now archived: Arthur's 1978 geometric part, 1980 truncation part, 1981 invariant form, and 1988 local/global invariant theory. The 1981 §6 and 1988 I §7 supply the (G,M)-family arguments. Retain each paper's field hypotheses: the earliest formulation over Q is transported only by a proved restriction-of-scalars argument or the later number-field treatment. These originals supplement the survey; their acquisition is not a full proof-closure audit or a general function-field trace formula.

## Acceptance and sources

The compact-quotient trace formula, the GL_2 Eisenstein constant term and a residual pole must be worked examples. Every exchange of infinite sums, differentiation and integration has a cited proved criterion. [Arthur](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §§1–23, is the organizing reference; §§24–30 explain uses beyond this scope. [Franke](https://www.numdam.org/item/10.1016/s0012-9593%2898%2980015-3.pdf), §§2–7, supplies AS.5. [Langlands' Eisenstein monograph](https://publications.ias.edu/rpl/paper/39) is downloaded in the author-project transcription; its editorial corrections and acknowledged reconstruction caveats must be checked, not silently identified with the printed edition. Mœglin–Waldspurger is requested as a detailed complementary proof reference. The Arthur survey alone is not a full proof source. Suggested.lean contains only representative expressible interfaces.

## Completion contracts added on 2026-09-15

**Applies to:** `AS.0`, `AS.1`, `AS.2`, `AS.3`, `AS.4`, `AS.6`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Construct the measurable spectral parameter space modulo Weyl equivalence, the measurable field of induced Hilbert spaces and its Plancherel measure. Prove Eisenstein wave packets are dense by the orthogonal-complement argument, not just isometric on an initial subspace. For singular parameters build residues and limiting Maass–Selberg terms before the residual summands. Expand invariantization into the induction on Levi subgroups with its common normalization of weighted characters and orbital integrals.

### Producer–consumer contract

The spectral decomposition returns a surjective unitary map and intertwining relations. The trace identity returns distributions on a specified test-function space, with the summation topology. Trace class is a proved property for the relevant kernels or extracted distributions, not a property of every convolution operator.

### Acceptance and source route

The compact quotient, GL_2 continuous spectrum, a residual pole and variation in truncation parameter T must all occur. Recover the expected polynomial-exponential T-dependence instead of asserting constancy.

**Source route:** Arthur 1978/1980 and 1988 I–II; Langlands Eisenstein monograph; Franke §§2–7. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
