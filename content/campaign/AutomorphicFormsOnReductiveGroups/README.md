# Automorphic forms on reductive groups

## Scope

Construct the general language and basic theory of automorphic forms for connected reductive groups over arbitrary number fields, with nonsplit groups and inner forms included. Use smooth complex functions and (g,K)-modules at infinity. Generality concerns the carriers and theorems actually true for arbitrary reductive groups: multiplicity one, a global Whittaker model or a Shimura interpretation are not imposed on every representation. Locally profinite representation and restricted-product lemmas retain their broader hypotheses; a separate arithmetic function-field foundation is not hidden in this specification.

Dependencies: AdelicAlgebraicGroups for G(F)\G(A), measures and reduction theory; ReductiveGroups for rational representations; SmoothRepresentationsOfLocalGroups for finite-place representations; existing RepresentationTheory for Lie/compact-group foundations. AF.1 builds the real reductive theory missing from that existing scope. ModularForms and GL2AutomorphicRepresentationsAndTransfer supply their classical specializations. AutomorphicSpectralTheory owns Eisenstein continuation and the full analytic spectrum; ArithmeticLocallySymmetricSpaces owns topological integral cohomology.

## Conventions

Right translation is R(g)f(x)=f(xg); infinitesimal action is the derived right action. Fix a maximal compact K∞ and the Lie algebra of G(F⊗ℝ), retaining component-group actions. An automorphic form is left G(F)-invariant, smooth at infinity, locally constant at finite places, K∞-finite, Z(U(g_C))-finite and of moderate growth. Smooth automorphic representations and their K∞-finite vectors are distinct categories linked by globalization. For a fixed unitary central character χ use f(zg)=χ(z)f(g), with quotient integration on the chosen split-center quotient.

## Milestones

### AF.0. Test functions and growth

Construct adelic smooth test functions as restricted tensor products of finite-place locally constant compactly supported functions and archimedean C∞ compactly supported functions. Define height functions from faithful embeddings and prove polynomial comparability, translation estimates and independence of the moderate-growth condition. Define uniform moderate growth for all differential operators and prove precisely where it follows from admissibility/finiteness. Prove differentiation, right translation and finite Hecke action preserve the specified spaces.

### AF.1. Real reductive representation foundations

Define compatible (g,K)-modules with algebraic infinitesimal action, locally finite K action and derivative compatibility. Construct U(g_C), its center action and generalized infinitesimal-character subspaces using existing Lie algebra APIs. Prove finite K-type multiplicities for admissible modules; build smooth moderate-growth Fréchet globalizations of finite-length Harish–Chandra modules and the uniqueness/exactness comparison. Define relative Lie algebra cochains Hom_K(∧^q(g/k),V), differential, functoriality and long exact sequences. Handle disconnected K via its finite component group. These analytic globalization proofs are targets, not an assumed black box.

### AF.1a. Continuous cohomology, van Est and invariant forms

This stage owns the regulator comparison formerly consumed without a supplier by BorelRegulators:R.2. For a finite-dimensional real Lie group G with finitely many components and a maximal compact K, construct continuous and differentiable group-cochain complexes, the smoothing comparison, and the complex of G-invariant V-valued differential forms on G/K. First use finite-dimensional smooth real or complex coefficient modules V; extend to the quasi-complete smooth coefficient category only with the precise continuity and completeness assumptions of Borel–Wallach IX.1–5. An arbitrary topological representation is not covered by the finite-dimensional theorem.

Identify invariant forms with relative Lie algebra cochains, including the finite K/K° action, signs, differential and coefficient action. Construct the comparison maps, the contracting homotopy on G/K and the relatively injective resolution; prove that they induce van Est's isomorphism. Source pin: supplied Borel–Wallach, second edition (2000), I.1.4 and **Corollary IX.5.6(ii)**, printed p.183, together with the continuous/differentiable comparison in IX.1–5. This is not merely the definition of relative cohomology. Prove naturality for eligible group/coefficient maps and cup-product compatibility, and distinguish the invariant-form complex from all forms on an arithmetic quotient. Arithmetic quotient comparisons remain ALS.5's responsibility.

Acceptance: a compact group (averaging), a real vector group with trivial coefficients, GL_n(C)/U(n) in the regulator range, and a disconnected group with a nontrivial component action. The regulator construction imports this stage, not the full automorphic spectral decomposition. Smooth globalization in AF.1 uses the separately archived Bernstein–Krötz primary source; van Est does not wait for Eisenstein continuation.

### AF.2. Automorphic spaces and representations

Construct the above space as an invariant subspace of functions and prove that fixing finite level, a finite set of K-types and an infinitesimal-character ideal gives the intended finite-type/finiteness statements with growth and cuspidal hypotheses recorded. Construct the Hecke×(g,K) action and the category of automorphic subquotients. For irreducible admissible constituents, prove restricted tensor-product factorization and uniqueness of almost-everywhere spherical vectors up to the specified scalars. General automorphic multiplicities remain finite integers, not forced to equal one.

### AF.3. Constant terms and cusp forms

For each proper rational parabolic P=MN define f_P(g)=∫_{N(F)\N(A)}f(ng)dn, using the compactness of the unipotent quotient. Prove convergence, smoothness, equivariance, transitivity for nested parabolics and compatibility with Hecke operators. Define cuspidality by vanishing of every proper-parabolic constant term and prove invariance under conjugacy of parabolics. Prove rapid decay on Siegel sets for cusp forms with the required central normalization; deduce square integrability for unitary central character and finite multiplicity of cuspidal constituents. For anisotropic groups modulo center, make the absence of proper rational parabolics explicit.

### AF.4. Algebraic weights and rational structures

Define algebraic highest weights, infinitesimal characters and cohomological representations; distinguish C-algebraic and L-algebraic normalizations and record the half-root twist when definable. Construct coefficient systems from algebraic representations with lattices and prove independence of the chosen lattice after inverting its primes. For cohomological cuspidal representations, prove rationality and finite fields of definition under the theorem's exact hypotheses. Torsion Hecke eigenclasses are defined through integral cohomology and are not identified with reductions of every characteristic-zero cusp form.

### AF.5. Comparison examples and transport

Prove the GL_1 dictionary with Hecke characters including infinity type, conductor and unitary twist. Prove the GL_2/Q dictionary with classical modular forms, slash actions, central character and normalized Hecke operators. Identify algebraic modular forms on compact-at-infinity groups with functions on finite adelic double cosets valued in an algebraic representation. Supply compatibility with restriction of scalars, products, central characters and inner forms where a genuine isomorphism or transfer theorem is available. Representation transfer itself is owned by the separate transfer roadmap.

## Acceptance and sources

All modules have usable subspace, morphism, scalar-extension and finite-level APIs. Show that a noncuspidal Eisenstein series belongs to the correct growth space and that a general reductive automorphic representation need not be generic. Arithmetic cohomology comparisons must respect Hecke normalizations.

Globalization proof source: Bernstein–Krötz, Smooth Fréchet globalizations of Harish–Chandra modules. Van Est source: supplied Borel–Wallach, second edition.

Primary sources: Borel–Jacquet, *Automorphic forms and automorphic representations*, Corvallis I (book requested); [Langlands, *On the notion of an automorphic representation*](https://publications.ias.edu/rpl/paper/40); [Arthur](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §§2–7,12; [Franke](https://www.numdam.org/item/10.1016/s0012-9593%2898%2980015-3.pdf), §§1–2,5–7. The classical definition and globalization assumptions should be reviewed against Borel–Jacquet and Casselman–Wallach before implementation. Suggested.lean is a representative aid; this specification is definitive.

## Completion contracts added on 2026-09-15

**Applies to:** `AF.0`, `AF.1`, `AF.1a`, `AF.2`, `AF.4`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Expand globalization into G-continuous norms, Sobolev comparison, polynomial K-type bounds, nuclear smooth vectors, and the principal-series subrepresentation/quotient argument of Bernstein–Krötz. Prove morphisms extend continuously and the globalization functor is exact. For rational structures, define the field of rationality via coefficient automorphisms, then separately prove existence of a model over a finite extension; a stabilizer field alone is not a field of definition.

### Producer–consumer contract

Export continuous maps between genuine smooth Fréchet representations and their Harish–Chandra modules, with compatible derived action. AF.1a constructs cup-compatible van Est maps independently of Eisenstein theory. Automorphic multiplicity and descent obstruction remain explicit data.

### Acceptance and source route

Compute relative cochains for a compact group and a real vector group; check one disconnected K action; check translation and the Lie action agree in the GL_2 modular-form dictionary.

**Source route:** Bernstein–Krötz Theorem 1.1, §§5/7/8/12; Borel–Wallach IX.5.6(ii); Borel–Jacquet. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
